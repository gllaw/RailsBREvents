class JoinedEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  def self.find_attendees e_id
    # attend = Array.new
    # attendees = 
    self.where(event_id: e_id).select(:user_id)
    # .to_a
    # attendees.each do |a|
    #   attend.push
    # end
    # return attend
  end

end
