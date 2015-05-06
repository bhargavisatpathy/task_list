class Tasklist < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  validates :title, presence: true

  scope :active, -> { where(archived: false) }
  scope :archived, -> { where(archived: true) }
end
