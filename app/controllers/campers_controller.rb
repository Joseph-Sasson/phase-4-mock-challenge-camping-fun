class CampersController < ApplicationController
  wrap_parameters format: []
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def index
    campers = Camper.all
    render json: campers
  end

  def show
    camper = Camper.find(params[:id])
    render json: camper, include: :activities, serializer: CamperShowSerializer
  end

  def create
    camper = Camper.create(camper_params)
    if camper.valid?
      render json: camper, status: :created
    else
      render json: {errors: camper.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def camper_params
    params.permit(:name, :age)
  end

  def render_not_found
    render json: {error: "Camper not found"}, status: :not_found
  end

end
