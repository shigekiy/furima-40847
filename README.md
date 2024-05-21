# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| user               | references | null: false, foreign_key: true |
| title              | string     | null: false |
| image              | text       | null: false |
| description        | text       | null: false |
| category           | string     | null: false |
| condition          | string     | null: false |
| shipping_cost      | string     | null: false |
| sender_prefecture  | string     | null: false |
| shipping_date      | string     | null: false |
| price              | string     | null: false |

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| zip_code           | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| street             | string | null: false |
| building           | string |             |
| phone_number       | string | null: false |

### Association

- belongs_to :purchase_record