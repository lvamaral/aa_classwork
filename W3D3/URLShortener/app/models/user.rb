class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'ShortenedUrl'

  has_many :visited_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'Visit'

  def self.create!(email)
    User.new({email: email}).save
  end
end
