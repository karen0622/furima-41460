class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_cost
  belongs_to :shipping_date
  belongs_to :area

  has_one_attached :image

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :name
    validates :explanation
    validates :price,numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "Out of setting range"}
    validates :image
  end


   #ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :product_condition_id
    validates :shipping_cost_id
    validates :shipping_date_id
    validates :area_id
  end
end
