class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :completed, inclusion: { in: [true, false] }
  validates :task, presence: true
  validates :date, presence: true, length: { minimum: 10 }

  validate :date_cannot_be_in_the_past

  scope :incomplete_for_today, -> { where(completed: false, date: Date.today) }
end

private

def date_cannot_be_in_the_past
  if date.present? && date < Date.today
    errors.add(:date, "can't be in the past")
  end
end