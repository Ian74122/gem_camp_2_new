class Api::ProvincesController < ApplicationController
  def index
    region = Address::Region.find(params[:region_id])
    provinces = region.provinces
    render json: provinces, each_serializer: ProvinceSerializer
  end
end
