# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| first_name_hiragana | string | null: false |
| last_name_hiragana  | string | null: false |
| first_name_katakana | string | null: false |
| last_name_katakana  | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| description | string     | null: false                    |
| category    | string     | null: false                    |
| state       | string     | null: false,                   |
| price       | string     | null: false,                   |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :buyer

## buyer テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | string     | null: false                    |
| expiration_date | string     | null: false                    |
| security_code   | string     | null: false                    |
| postal_code     | string     | null: false                    |
| prefectures     | string     | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item