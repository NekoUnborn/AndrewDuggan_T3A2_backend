class MedicinesController < ApplicationController
  #  before_action :authenticate
  before_action :set_medicine, only: %i[show create update destroy]

  def index
    render json: Medicine.all
  end

  def show
    render json: @medicine
  end

  def create
    render json: Medicine.create(medicine_params), status: :created
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
    params.permit(:param1, :param2)
  end
end
