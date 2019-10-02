class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['name'].blank? }
  
  validates :title, :body, presence: true
  # two best practice to create custom scopes to call in controller
  # 1.
  
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader
  
  def self.angular
    where(subtitle: 'Angular')
  end
  
  def self.by_position
    order("position ASC")
  end
  
  # 2.
  scope :r_o_r_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
end