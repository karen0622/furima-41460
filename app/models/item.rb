class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_cost
  belongs_to :shipping_date
  belongs_to :aria

  has_one_attached :image

end
