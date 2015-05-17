class Pick < ActiveRecord::Base
  belongs_to :position
  belongs_to :user
  has_many :grades, dependent: :destroy
  validates :position, uniqueness: {scope: :user_id, message: 'has already been filled on your team'}

  def grade_placeholder
    users = User.all
    users.each do |user|
      grade = self.grades.new(user_id: user.id, grade: '')
      grade.save
    end
  end
end
