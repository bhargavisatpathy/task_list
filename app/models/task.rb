class Task < ActiveRecord::Base
  belongs_to :tasklist
  validates :title, presence: true
  validates :description, presence: true

  enum status: %w(Incomplete Complete)

  scope :completed, -> { where(status: 1) }
  scope :incomplete, -> { where(status: 0) }
end
