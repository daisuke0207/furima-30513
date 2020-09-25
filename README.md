## usersテーブル

| Column | Type | Options |
| ------ | ---- | ------- |
| nickname | string | null: false |
| email | string | null: false |
| password | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday | date | null: false |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column | Type | Options |
| ------ | ---- | ------- |
| name | string | null: false |
| description | text | null: false |
| category_id | integer | null: false |
| status | integer | null: false |
| ship_fee | integer | null: false |
| ship_area | integer | null: false |
| price| integer | null: false |
| user_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order
- has_one_attached :image

## ordersテーブル

| Column | Type | Options |
| ------ | ---- | ------- |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |
| credit_card| integer | null: false |
| postcard | integer | null: false |
| prefecture | integer | null: false |
| city | string | null: false |
| block | string | null: false |
| phone | integer | null: false |

### Association
- belongs_to :item
- belongs_to :user