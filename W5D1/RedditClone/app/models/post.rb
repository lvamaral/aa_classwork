class Post < ApplicationRecord
  validates :title, :author, presence: true
  validates :subs, presence: { message: "must have at least one sub" }

  has_many :post_subs, inverse_of: :post, dependent: :destroy
  has_many :subs, through: :post_subs, source: :sub

  belongs_to :author,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :User,
  inverse_of: :posts
end
