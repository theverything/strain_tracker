class User < ActiveRecord::Base
  attr_accessible :email, :oauth_expires_at, :oauth_token

  has_many :smokeins
end
