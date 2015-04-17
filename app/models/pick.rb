class Pick < ActiveRecord::Base
  belongs_to :position
  belongs_to :user
  has_many :grades
  validates :position, uniqueness: {scope: :user_id, message: 'has already been filled on your team'}
end
