class Todo < ApplicationRecord
  belongs_to :project

  validates :text, presence: true
  validates :project, presence: true
end
