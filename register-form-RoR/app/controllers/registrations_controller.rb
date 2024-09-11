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
    if params[:query].present?
      query = "%#{params[:query].downcase}%"
      @registrations = Registration.where("LOWER(firstName) LIKE :query", query: query)
    else
      @registrations = Registration.all
    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def close_confirm_delete_modal
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("confirm_delete_modal", partial: "empty") }
    end
  end

  def destroy
    puts "destroy"
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("confirm_delete_modal", partial: "empty"),
          turbo_stream.replace("registrations", partial: "list", locals: { registrations: Registration.all })
        ]
      end
      format.html { redirect_to registrations_path, notice: "Registration was successfully deleted." }
    end
  end

  def confirm_delete
    puts "confirm_delete"
    @registration = Registration.find(params[:id])
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("confirm_delete_modal", partial: "confirm_delete", locals: { registrationID: @registration }) }
    end
  end

  def edit
    @registration = Registration.find(params[:id])
  end
  
  def update
    @registration = Registration.find(params[:id])
    if @registration.update(registration_params)
      redirect_to registrations_path, notice: 'Registration updated successfully.'
    else
      render :edit
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:firstName, :lastName, :birthday, :gender, :email, :phone, :subject)
  end
end
