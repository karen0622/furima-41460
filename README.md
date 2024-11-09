# README

## users

|Column                   |Type    |Options                   |
|-------------------------|--------|--------------------------|
|email                    | string | null: false,unique: true |
|encrypted_password       | string | null: false              |
|nickname                 | string | null: false              |
|last_name                | string | null: false              |
|first_name               | string | null: false              |
|last_name_kana           | string | null: false              |
|first_name_kana          | string | null: false              |
|birthday                 | date   | null: false              |


### Association
has_many:items
has_many:purchases


## items

|Column                   |Type       |Options                        |
|-------------------------|---------  |-------------------------------|
|user                     |references |null: false,foreign_key: true  |
|name                     |string     |null: false                    |
|explanation              |text       |null: false                    |
|category_id              |integer    |null: false                    |
|product_condition_id     |integer    |null: false                    |
|shipping_cost_id         |integer    |null: false                    |
|shipping_date_id         |integer    |null: false                    |
|area_id                  |integer    |null: false                    |
|price                    |integer    |null: false                    |


### Association
belongs_to:user
has_one:purchase


## purchases

|Column|Type      |Options                       |
|----- |----------|------------------------------|
|user  |references|null: false,foreign_key: true |
|item  |references|null: false,foreign_key: true |
 

### Association
belongs_to:user
belongs_to:item
has_one:shipping


## shippings

|Column        |Type       |Options                       |
|--------------|--------   |------------------------------|
|purchase      |references |null: false,foreign_key: true |
|postcode      |string     |null: false                   |
|area_id       |integer    |null: false                   |
|city          |string     |null: false                   |
|address       |string     |null: false                   |
|phone_number  |string     |null: false                   |
|building      |string     |                              |


### Association
belongs_to:purchase




