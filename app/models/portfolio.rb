class Portfolio < ApplicationRecord
  validates :title, :body, :main_image, :thumb_image, presence: true
  
  def self.angular
    where(subtitle: 'Angular')
  end
  # best practice to create custom scopes to call in controller
  scope :r_o_r_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
end
