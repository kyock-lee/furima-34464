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



## items

|Column               |Type     |Options      |
|---------------------|---------|-------------|
| seller_name         | string  | null: false |
| item_name           | string  | null: false |
| description         | text    | null: false |
| category_id         | integer | null: false |
| status_id           | integer | null: false |
| shipping_charges_id | integer | null: false |
| shipping_area_id    | integer | null: false |
| shipping_days_id    | integer | null: false |
| cost                | integer | null: false |

### Association
belongs_to :users
has_one :buyer_data


## buyer_data

|Column                  |Type     |Options      |
|------------------------|---------|-------------|
| post_code              | string  | null: false |
| shipping_area_id       | integer | null: false |
| shipping_city          | string  | null: false |
| shipping_adress        | string  | null: false |
| building_name          | string  | null: false |
| phone_number           | string  | null: false |


### Association
belongs_to :items


## card

|Column    |Type     |Options      |
|----------|---------|-------------|
| user_id  | integer | null: false |
| items_id | integer | null: false |


### Association
belongs_to :users
