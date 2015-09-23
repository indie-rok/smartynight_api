class User < ActiveRecord::Base
  
  #validates_uniqueness_of :email

  devise :omniauthable, :omniauth_providers => [:facebook]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
 
  has_one :venue
  has_one :dancer

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.extra.raw_info.email
      user.user_type = 'dancer'
      user.password = Devise.friendly_token[0,20]
      user.verified = true
      user.wants_newsletter = true
      user.avatar_url = auth.info.image
      user.build_dancer(
        username: auth.info.name,
        facebook_token: auth.credentials.token,
        gender: auth.extra.raw_info.gender
      )
    end
  end

   def is_venue?
      self.dancer.nil?
    end

    def is_dancer?
      self.venue.nil?
    end

end
