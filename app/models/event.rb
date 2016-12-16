class Event < ActiveRecord::Base
  belongs_to :state
  belongs_to :user
  has_many :joined_events, dependent: :destroy
  has_many :users, through: :joined_events

  validates :name, :date, :location, :state, presence: :true

  def self.in_state state_id
  	self.joins(:user).joins(:state).select("events.id as id", "events.name", :date, :location, "states.name as state_name", :user_id, "users.first_name as host").where("events.state_id = #{state_id}")
  end

  def self.out_of_state state_id
  	self.joins(:user).joins(:state).select("events.id as id", "events.name", :date, :location, "states.name as state_name", :user_id, "users.first_name as host").where("events.state_id != #{state_id}")
  end

  def self.host_and_state
    self.joins(:users).joins(:state).select("events.name", "users.first_name as hostf", "users.last_name as hostl", :date, :location, "states.name as state")
  end

  def self.find_attendees event_id
  	self.joins(:joined_events).select("joined_events.user_id as attendee").where("joined_events.event_id = #{self.id}")
  end

end