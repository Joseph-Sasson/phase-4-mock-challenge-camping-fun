class Signup < ApplicationRecord
  belongs_to :camper
  belongs_to :activity
  validates :time, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 23}
  # validate :time_range

  # def time_range
  #   if (self.time < 0 || self.time > 23)
  #     errors.add(:time, "must be within 0 and 23")
  #   end
  # end 
end
