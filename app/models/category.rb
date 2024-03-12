class Category < ApplicationRecord
    has_many :tasks, dependent: :destroy
    belongs_to :user
    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 10 }
end
