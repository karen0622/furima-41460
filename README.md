# README

## users

|Column         |Type    |Options                   |
|---------------|--------|--------------------------|
|email          | string | null: false,unique: true |
|password       | string | null: false              |
|nickname       | string | null: false              |
|last_name      | string | null: false              |
|first_name     | string | null: false              |
|last_name_kana | string | null: false              |
|first_name_kana| string | null: false              |
|birthday       | date   | null: false              |


### Association
has_many:items
has_many:purchase


## items

|Column             |Type     |Options                          |
|-------------------|---------  |-------------------------------|
|user               |references |null: false,foreign_key: true  |
|image              |string     |null: false                    |
|name               |string     |null: false                    |
|explanation        |text       |null: false                    |
|category           |string     |null: false                    |
|product_condition  |text       |null: false                    |
|shipping_cost      |numeric    |null: false                    |
|sipping_date       |date       |null: false                    |
|price              |numeric    |null: false                    |
|area               |string     |null: false                    |


### Association
belongs_to:user
haas_one:purchase


## purchase

|Column|Type      |Options                       |
|----- |----------|------------------------------|
|user  |references|null: false,foreign_key: true |
|item  |references|null: false,foreign_key: true |
 

### Association
belongs_to:user
belongs_to:item
has_one:sipping


## sipping

|Column        |Type       |Options                       |
|--------------|--------   |------------------------------|
|purchase      |references |null: false,foreign_key: true |
|post_code     |numeric    |null: false                   |
|prefecture    |string     |null: false                   |
|city          |string     |null: false                   |
|address       |numeric    |null: false                   |
|phone_number  |numeric    |null: false                   |
|build         |string     |                              |


### Association
belong_to:purchase




