class Food < ApplicationRecord
  validates :Name, presence: true, length: { maximum: 250, too_long: '250 characters in post is the maximum allowed.' }
  validates :Measurement_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :Price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :Quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  before_validation :set_default_value
  belongs_to :user, class_name: 'User'

  private
  def set_default_value
    self.Price ||= 0
    self.Quantity ||= 0
  end
end
