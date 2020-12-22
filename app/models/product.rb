class Product < ApplicationRecord
 # before_destroy :not_referenced_by_any_line_item
  has_many_attached :images, dependent: :destroy
  has_many :line_items, dependent: :destroy 
  belongs_to :user
end
