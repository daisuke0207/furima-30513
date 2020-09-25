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
| status_id | integer | null: false |
| ship_fee_id | integer | null: false |
| ship_area_id | integer | null: false |
| ship_day_id | integer | null: false |
| price | integer | null: false |
| user | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order
- has_one_attached :image

## ordersテーブル

| Column | Type | Options |
| ------ | ---- | ------- |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addressesテーブル

| Column | Type | Options |
| ------ | ---- | ------- |
| postcard | string | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| block | string | null: false |
| building | string | null: false |
| phone | string | null: false |
| order | references | null: false, foreign_key: true |

### Association
- belongs_to :order