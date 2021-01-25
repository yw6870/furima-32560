# Furimaアプリ

# 概要

このアプリでは不要になったものを出品すると、欲しい人が買ってくれるという個人間で商品を売買するためのサービスです。

# 実装機能

- ユーザー管理機能（gem:devise）
- 商品出品機能（画像アップロード機能）
- 商品購入機能（クレジット決済機能：PAY.JP API）


# 本番環境（デプロイ先とテストアカウント＆ID）

- GitHub:https://github.com/yw6870/furima-32560
- デプロイ先:http://52.198.243.132/
- テストアカウント:
出品者Email:test@test
出品者Password:aaaaa1
購入者Email:a@a
購入者Password:aaaaa1

# DEMO

### トップ画面

![スクリーンショット 2021-01-25 15 00 45](https://user-images.githubusercontent.com/68420090/105667740-38699300-5f1f-11eb-9c1e-8c394e71c712.png)

### ユーザー登録画面

![スクリーンショット 2021-01-25 14 54 12](https://user-images.githubusercontent.com/68420090/105667685-1a9c2e00-5f1f-11eb-92b3-902e1e27d972.png)

### 商品出品画面

![スクリーンショット 2021-01-25 15 01 49](https://user-images.githubusercontent.com/68420090/105667777-491a0900-5f1f-11eb-8c40-9c8ed40df551.png)

### 商品購入画面

![スクリーンショット 2021-01-25 15 03 50](https://user-images.githubusercontent.com/68420090/105667802-57682500-5f1f-11eb-8e46-1c522c305033.png)

# 工夫したポイント

# 使用技術（開発環境）

- 言語：HTML,SCSS,Ruby,JavaScript
- フレームワーク：Ruby on Rails
- DB：mysql
- サーバー：AWS

# 課題や今後実装したい機能

- コメント機能

- お気に入り機能

- カテゴリー・キーワード検索機能

# DB設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_date         | date    | null: false               |

### Association

- has_many :items
- has_many :purchase_histories

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| info                   | string     | null: false                    |
| category_id            | integer    | null: false                    |
| sales_status_id        | integer    | null: false                    |
| shipping_fee_status_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| scheduled_delivery_id  | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_history

## purchase_history テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :charge

## charges テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| addresses        | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_history | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_history