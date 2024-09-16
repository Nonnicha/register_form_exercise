class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      delete_cached
      redirect_to registrations_path
    else
      render :new
    end
  end

  def index
    cache_key = "registrations"
    Rails.logger.info("Cache key: #{cache_key}")

    @registrations_cache = Rails.cache.fetch(cache_key, expires_in: 5.minutes) do
      Rails.logger.info("Cache miss")
      cache_data = Registration.all.to_a
      Rails.logger.info("Storing all data in cache key: #{cache_key}")
      cache_data
    end

    @registrations = @registrations_cache

    if params[:query].present?
      query = params[:query].downcase
      @registrations = @registrations.select { |registration| registration.firstName.downcase.include?(query) }
    end
    
    if params[:sort].present? && params[:direction].present?
      sort_column = params[:sort]
      sort_direction = params[:direction] == "asc" ? 1 : -1
  
      @registrations = @registrations.sort_by { |registration| registration[sort_column] }
      @registrations.reverse! if sort_direction == -1
    else
      @registrations = @registrations.sort_by(&:firstName)
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    delete_cached

    respond_to do |format|
      format.turbo_stream { redirect_to registrations_path } # แค่รีเฟรชหน้า
      format.html { redirect_to registrations_path, notice: 'Registration deleted successfully.' }
    end
  end

  def confirm_delete
    @registration = Registration.find(params[:id])
    render turbo_stream: turbo_stream.replace("modal", partial: "confirm_delete", locals: { registrationID: @registration })
  end

  def register_modal
    @registration = Registration.new
    render turbo_stream: turbo_stream.replace("modal", partial: "register_modal", locals: { registrations_path: @registration })
  end

  private

  def registration_params
    params.require(:registration).permit(:firstName, :lastName, :birthday, :gender, :email, :phone, :subject)
  end

  def delete_cached
    Rails.cache.delete("registrations")
    Rails.logger.info("Cache deleted")
  end
end
