# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | integer | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_date         | date    | null: false |

### Association

- has_many :items
- has_many :charges
- has_many :purchase_histories

## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item_name                | string     | null: false                    |
| item_info                | string     | null: false                    |
| item_category            | string     | null: false                    |
| item_sales_status        | integer    | null: false                    |
| item_shipping_fee_status | integer    | null: false                    |
| item_prefecture          | integer    | null: false                    |
| item_scheduled_delivery  | integer    | null: false                    |
| item_price               | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :charge

## charges テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| addresses      | string     | null: false                    |
| building       | string     |                                |
| phone_number   | integer    | null: false                    |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## purchase_history テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item