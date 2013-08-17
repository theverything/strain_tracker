class StrainSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :abstract, :rating
end
