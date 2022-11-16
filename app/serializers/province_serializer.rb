class ProvinceSerializer < ActiveModel::Serializer
  attributes :name, :region, :id

  def region
    object.region.name
  end
end
