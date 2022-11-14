class Api::RegionsController < ApplicationController
  def index
    regions = Address::Region.all
    render json: regions, each_serializer: RegionSerializer
  end
end
