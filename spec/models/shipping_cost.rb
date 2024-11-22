class shipping_cost < ActiveHash::Base
  self.date = [
    {id: 0, name: '---'},
    {id: 1, name: '着払い(購入者負担)'},
    {id: 2, name: '送料込み(出品者負担)'},

  ]

  include ActiveHash::Associations
  has_many :items

end







---、
着払い(購入者負担)、
送料込み(出品者負担)
」の3項目が表示されること