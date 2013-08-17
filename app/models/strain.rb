class Strain < ActiveRecord::Base
  attr_accessible :abstract, :category, :name, :rating
  fuzzily_searchable :name

  has_many :smokeins
end
