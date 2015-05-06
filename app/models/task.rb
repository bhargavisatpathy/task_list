class Task < ActiveRecord::Base
  belongs_to :tasklist
  validates :title, presence: true
  validates :description, presence: true
  has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :attachment, :content_type => ["image/jpg", "image/jpeg", "image/png"]


  enum status: %w(Incomplete Complete)

  scope :completed, -> { where(status: 1) }
  scope :incomplete, -> { where(status: 0) }
end
