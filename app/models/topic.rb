class Topic < ApplicationRecord
  validates :title, presence: true
  
  has_many :blogs, dependent: :destroy
  
  def self.with_blogs
    includes(:blogs).where.not(blogs: { id: nil })
  end
end
