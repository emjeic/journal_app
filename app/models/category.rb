class Category < ApplicationRecord
  belongs_to :user
  
  has_many :tasks, dependent: :destroy
  
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 20 }

  # method to check for existing complete and incomplete tasks
  def has_complete_and_incomplete_tasks?
    tasks.exists?(completed: true) || tasks.exists?(completed: false)
  end

end
