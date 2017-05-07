require 'securerandom.rb'
require_relative 'user'

class ShortenedUrl < ApplicationRecord
  include SecureRandom

  validates :long_url, :short_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: 'Visit'

  has_many :visitors,
    through: :visits,
    source: :user

  def self.random_code
    link = "b4GOKm4pOYU_-BOXcrUGDg"
    until !exists?(:short_url => link)
      link = SecureRandom.urlsafe_base64
    end
    link
  end

  def self.create!(user_id, long_url)
    ShortenedUrl.new({long_url: long_url, short_url: self.random_code,
      user_id: user_id}).save
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.distinct.count
  end

  def num_recent_uniques
    self.visitors.where(created_at: (10.minutes.ago..Time.now)).distinct.count
  end
end

#link3 = ShortenedUrl.new({long_url: "www.yahoo.com", short_url: ShortenedUrl.random_code, user_id: 1})
