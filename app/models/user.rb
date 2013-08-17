class User < ActiveRecord::Base
  attr_accessible :email, :oauth_expires_at, :oauth_token

  has_many :smokeins

  def self.from_omniauth(auth)
    where(auth.slice(:email)).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
