class User < ActiveRecord::Base
  has_secure_password

  has_many :picks
  has_many :positions, through: :picks
  has_many :grades
end
