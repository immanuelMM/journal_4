class Task < ApplicationRecord
    validates :description, :completed_at, presence: true
    belongs_to :category
end
