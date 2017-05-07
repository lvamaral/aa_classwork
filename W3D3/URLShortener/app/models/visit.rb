class Visit < ApplicationRecord
  validates :user_id, :short_url_id, presence: true

  def self.record_visit!(user_id, short_url_id)
    Visit.new(user_id: user_id, short_url_id: short_url_id).save
  end

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  belongs_to :shortened_urls,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: 'ShortenedUrl'
end

#v = Visit.record_visit!(1, 2)
