class Course < ActiveRecord::Base
  validates :name, :instructor_id, presence: true

  has_many :enrollments,
  primary_key: :id,
  foreign_key: :course_id,
  class_name: 'Enrollment'

  has_many :enrolled_students,
  through: :enrollments,
  source: :user

  belongs_to :prerequisite,
  class_name: 'Course',
  foreign_key: :prereq_id,
  primary_key: :id

  belongs_to :instructor,
  class_name: 'User',
  foreign_key: :instructor_id,
  primary_key: :id
end
