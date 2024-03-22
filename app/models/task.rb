class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category

  
  validates :task, presence: true, length: { minimum: 10 }
  validates :date, presence: true

  validate :date_cannot_be_in_the_past, on: [:create]

  private
  # method to assigned task by date cannot be in the past
  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

end

