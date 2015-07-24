class Comment < ActiveRecord::Base
  default_scope -> { order(created_at: :asc) }
  belongs_to :user
  belongs_to :entry

  validates :content, presence: true
  validates :user_id, presence: true
end
