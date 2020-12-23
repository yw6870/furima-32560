# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | string | null: false |

### Association

- has_many :items

## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item_name                | string     | null: false                    |
| item_info                | string     | null: false                    |
| item_category            | string     | null: false                    |
| item_sales_status        | string     | null: false                    |
| item_shipping_fee_status | string     | null: false                    |
| item_prefecture          | references | null: false                    |
| item_scheduled_delivery  | string     | null: false                    |
| item_price               | string     | null: false                    |
| user_id                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :charge

## charges テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_number    | string     | null: false                    |
| card_exp_month | string     | null: false                    |
| card_exp_year  | string     | null: false                    |
| cvc            | string     | null: false                    |
| postal_code    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| addresses      | string     | null: false                    |
| building       | string     | null: false                    |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :item