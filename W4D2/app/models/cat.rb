class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :description, presence: true
  validates :sex, presence: true, inclusion:{ in:["M", "F"] }

  has_many :cat_rental_requests, dependent: :destroy


  def self.valid_colors
    [
      "black",
      "white",
      "orange",
      "tan"
    ]
  end
end
