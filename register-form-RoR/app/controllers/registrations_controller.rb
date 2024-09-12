class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to registrations_path
    else
      render :new
    end
  end

  def index
    @registrations = Registration.all

    if params[:query].present?
      query = "%#{params[:query].downcase}%"
      @registrations = Registration.where("LOWER(firstName) LIKE :query", query: query)
    end

    if params[:sort].present? && params[:direction].present?
      @registrations = @registrations.order("#{params[:sort]} #{params[:direction]}")
    else
      @registrations = @registrations.order("firstName ASC") # default sort na ja
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.turbo_stream { redirect_to registrations_path } # แค่รีเฟรชหน้า
      format.html { redirect_to registrations_path, notice: 'Registration deleted successfully.' }
    end
  end

  def confirm_delete
    @registration = Registration.find(params[:id])
    render turbo_stream: turbo_stream.replace("modal", partial: "confirm_delete", locals: { registrationID: @registration })
  end

  private

  def registration_params
    params.require(:registration).permit(:firstName, :lastName, :birthday, :gender, :email, :phone, :subject)
  end
end
