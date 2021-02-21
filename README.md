## users

|Column              |Type    |Options                    |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| last_name          | string | null: false               |
| family_name_kana   | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |


### Association
has_many :items
has_many :purchasers


## items

|Column               |Type        |Options                         |
|---------------------|------------|--------------------------------|
| user                | references | null: false, foreign_key: true |
| item_name           | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| shipping_charge_id  | integer    | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| shipping_day_id     | integer    | null: false                    |
| cost                | integer    | null: false                    |

### Association
belongs_to :user
has_one :purchaser


## purchasers

|Column              |Type         |Options                         |
|--------------------|-------------|--------------------------------|
| post_code          | string      | null: false                    |
| shipping_area_id   | integer     | null: false                    |
| shipping_city      | string      | null: false                    |
| shipping_address   | string      | null: false                    |
| building_name      | string      |                                |
| phone_number       | string      | null: false                    |
| order              | references  | null: false, foreign_key: true |


### Association
belongs_to :order


## orders

|Column    |Type        |Options                         |
|----------|------------|--------------------------------|
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |


### Association
belongs_to :user
belongs_to :item
has_one :purchaser