class State < ActiveRecord::Base
  validates :name, presence: :true, length: {is: 2}
end
