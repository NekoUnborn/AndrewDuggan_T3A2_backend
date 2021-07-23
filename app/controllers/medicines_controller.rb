class MedicinesController < ApplicationController
  before_action :authenticate
  before_action :set_medicine, only: %i[show update destroy]

  def index
    render json: Medicine.all.pluck(:name, :description)
  end

  def show
    render json: @medicine
  end

  def create
    if Medicine.exists?(:name => medicine_params[:name]) == true 
      render json: { message: 'Medicine already exists'}  
    else 
      @new_med = Medicine.new(medicine_params) 
      if @new_med.save
        render json: {message: "Medication, #{medicine_params[:name]} has been created"}, status: :created
      else
        render json: {message: @new_med.errors.full_messages}, status: 401
      end
    end 
  end

  private

  def set_medicine
    @medicine = Medicine.find(params[:id])
  end

  def medicine_params
    params.permit(:name, :description)
  end
end
