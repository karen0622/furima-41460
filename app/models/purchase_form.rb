class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id,:token,:item_id,:purchase_id,:post_code,:area_id,:city,:address,:phone_number,:building
  
  with_options presence: true do
  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g., 123-4567)" }
  validates :area_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :city 
  validates :address
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
  validates :token
  validates :user_id, numericality: true
  validates :item_id, numericality: true
  end

  def save
    #各テーブルにデータを保存する処理
   purchase = Purchase.create(user_id: user_id, item_id: item_id)
   Shipping.create(purchase_id: purchase.id, post_code: post_code, area_id: area_id, city: city, address: address, phone_number: phone_number, building: building)
  end
end
