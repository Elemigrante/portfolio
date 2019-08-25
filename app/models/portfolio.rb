class Portfolio < ApplicationRecord
  validates :title, :body, :main_image, :thumb_image, presence: true
  # two best practice to create custom scopes to call in controller
  # 1.
  def self.angular
    where(subtitle: 'Angular')
  end
  # 2.
  scope :r_o_r_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
  
  # second way setting the default uses callback.(first in migration called 'default: 0')
  after_initialize :set_defaults
  
  def set_defaults
    self.main_image ||= "https://via.placeholder.com/600x400"
    self.thumb_image ||= "https://via.placeholder.com/350x200"
  end
end