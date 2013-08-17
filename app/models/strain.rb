class Strain < ActiveRecord::Base
  attr_accessible :abstract, :category, :name, :rating

  has_many :smokeins
end