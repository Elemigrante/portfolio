class User < ApplicationRecord
  petergate(roles: [:site_admin, :editor], multiple: false)
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  validates :name, presence: true

  has_many :comments, dependent: :destroy
  
  def first_name
    self.name.split.first
  end
  
  def last_name
    self.name.split.last
  end
end
