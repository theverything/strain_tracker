class User < ActiveRecord::Base
  attr_accessible :email, :oauth_expires_at, :oauth_token, :uid, :first

  has_many :smokeins

  def self.from_omniauth(auth)
    where(auth.slice(:uid)).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
