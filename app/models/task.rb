class Task < ActiveRecord::Base
  belongs_to :tasklist
  validates :title, presence: true
  validates :description, presence: true
end
