class User < ActiveRecord::Base
  has_secure_password

  has_many :events, dependent: :destroy
  has_many :joined_events
  has_many :events_attending, through: :joined_events, source: :event

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :location, :state, presence: :true
  validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  before_save do 
  	self.email.downcase!
  	self.first_name.capitalize!
  	self.last_name.capitalize!
  end

end
