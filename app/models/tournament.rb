class Tournament < ActiveRecord::Base

  # Associations
  has_many :players

end
