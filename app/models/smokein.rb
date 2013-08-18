class Smokein < ActiveRecord::Base
  attr_accessible :strain_id, :user_id

  belongs_to :strain
  belongs_to :user
end
