class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_cost
  belongs_to :shipping_date
  belongs_to :area

  has_one_attached :image

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :user_id
    validates :name
    validates :explanation
    validates :price,format: { with: /\A[0-9]+\z/ },inclusion: { in: 300..9_999_999,message: "must be between 300 and 9,999,999"}
    validates :category_id
    validates :product_condition_id
    validates :shipping_cost_id
    validates :area_id
    validates :shipping_date_id
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
