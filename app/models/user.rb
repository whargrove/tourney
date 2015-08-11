class User < ActiveRecord::Base

  has_secure_password

  # Associations
  has_many :tournaments

end
