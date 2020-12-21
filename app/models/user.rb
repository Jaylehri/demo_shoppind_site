class User < ApplicationRecord
  rolify
  has_one :image
  validates :mobile, length: { minimum: 10, maximum: 10}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many_attached :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :line_items, dependent: :destroy
  has_one :address
  accepts_nested_attributes_for :address

  def latest_order
    orders.where(status: 'cart').first || new_order
  end
  
  private

  def new_order
    orders.create(status:'cart')
  end
end