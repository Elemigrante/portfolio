class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }
  
  validates :title, :body, :main_image, :thumb_image, presence: true
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
  
  # second way setting the default uses callback.(first in migration called 'default: 0')
  after_initialize :set_defaults
  
  def set_defaults
    self.main_image  ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end