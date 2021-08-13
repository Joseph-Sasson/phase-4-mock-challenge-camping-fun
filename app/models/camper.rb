class Camper < ApplicationRecord
  has_many :signups
  has_many :activities, through: :signups
  validates :name, presence: true
  # validates :age, numericality: {greater_than_or_equal_to: 8, less_than_or_equal_to: 18}
  # validates :age, numericality: {in: 8..18}
  validate :age_limit

  def age_limit
    if (self.age < 8 || self.age > 18)
      errors.add(:age, "must be atleast 8 years old and not older than 18 to be a camper")
    end
  end
end
