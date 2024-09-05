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
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    redirect_to registration_path
  end

  private

  def registration_params
    params.require(:registration).permit(:firstName, :lastName, :birthday, :gender, :email, :phone, :subject)
  end
end
