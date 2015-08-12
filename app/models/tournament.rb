class Tournament < ActiveRecord::Base

  # Associations
  has_many :players
  has_many :rounds

end
