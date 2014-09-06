class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(post_params)
    if @doctor.save
      redirect_to @doctor, notice: 'Doctor created successfully!'
    else
      render :new, notice: 'Unable to save new doctor'
    end
  end

  def edit
  end

  def update
    if @doctor.update(post_params)
      redirect_to @doctor, notice: 'Doctor updated successfully!'
    else
      render :edit, notice: 'Unable to update doctor'
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_url, notice: 'Doctor successfully deleted.'
  end



  private
    def post_params
      params.require(:doctor).permit(:name, :specialty, :description)
    end

    def set_doctor
      @doctor = Doctor.find(params[:id])
    end
end
