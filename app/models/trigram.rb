class Trigram < ActiveRecord::Base
  attr_accessible :trigram, :score, :owner_id, :owner_type, :fuzzy_field
  include Fuzzily::Model
end
