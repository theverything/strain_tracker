class StrainSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object
  attributes :id, :name, :category, :abstract, :rating
end
