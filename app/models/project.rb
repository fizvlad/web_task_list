class Project < ApplicationRecord
  has_many :todos, -> { order('id') }, dependent: :destroy

  validates :title, presence: true
end
