class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = Appointment.new
  end

  def create
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = @doctor.appointments.create(post_params)
    if @appointment.save
      redirect_to doctor_path(@doctor)
    else
      render :new
    end
  end



  private
    def post_params
      params.require(:appointment).permit(:patient_name, :phone_number, :email, :start_time, 
                                          :end_time, :reason, :doctor_id)
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end
end
