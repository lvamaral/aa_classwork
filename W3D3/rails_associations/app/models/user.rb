class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :enrollments,
  primary_key: :id,
  foreign_key: :student_id,
  class_name: 'Enrollment'

  has_many :enrolled_courses,
  through: :enrollments,
  source: :course

  has_many :instructed_courses,
  class_name: 'Course',
  foreign_key: :instructor_id,
  primary_key: :id
end
