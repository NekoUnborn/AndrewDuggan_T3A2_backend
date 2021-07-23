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
    # Accepts the given parameters
    # Checks that the DB does not already have an existing entry
    # If the entry does not already exist, then create the new Medicine entry.
    # case Medicine.where(name: medicine_params[:name])
    #  when true
    # Return a status message
    # when false 
    # return a json create method (below line works)
    # render json: Medicine.create(medicine_params), status: :created         
  end

  def update
    if @medicine.update(medicine_params)
      render json: @medicine
    else
      render json: { error: 'Failed to update medicine' }
    end
  end

  def destroy
    if @medicine.destroy
      render status: :no_content
    else
      render json: { error: 'Failed to destroy medicine' }, status: :unprocessable_entity
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
