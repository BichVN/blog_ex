class Entry < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :body, presence: true, length: { maximum: 140 }
end
