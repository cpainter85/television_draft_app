class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :pick

  def self.round_grade_placeholder(round)
    picks = Pick.all.where(round: round)
    users = User.all
    picks.each do |pick|
      users.each do |user|
        grade = pick.grades.new(user_id: user.id, grade: '')
        grade.save
      end
    end
  end
end
