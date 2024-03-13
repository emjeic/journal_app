class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :completed, inclusion: { in: [true, false] }
  validates :task, presence: true
  validates :date, presence: true, length: { minimum: 10 }

  scope :incomplete_for_today, -> { where(completed: false, date: Date.today) }
end
