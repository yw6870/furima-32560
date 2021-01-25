# Furimaアプリ

# 概要

このアプリでは不要になったものを出品すると、欲しい人が買ってくれるという個人間で商品を売買するためのサービスです。

# DEMO

### トップ画面

![スクリーンショット 2021-01-25 15 00 45](https://user-images.githubusercontent.com/68420090/105667740-38699300-5f1f-11eb-9c1e-8c394e71c712.png)

### ユーザー登録画面

![スクリーンショット 2021-01-25 14 54 12](https://user-images.githubusercontent.com/68420090/105667685-1a9c2e00-5f1f-11eb-92b3-902e1e27d972.png)

### 商品出品画面

![スクリーンショット 2021-01-25 15 01 49](https://user-images.githubusercontent.com/68420090/105667777-491a0900-5f1f-11eb-8c40-9c8ed40df551.png)

### 商品購入画面

![スクリーンショット 2021-01-25 15 03 50](https://user-images.githubusercontent.com/68420090/105667802-57682500-5f1f-11eb-8e46-1c522c305033.png)

# 実装予定の内容

## コメント機能

- 商品について出品者と購入者が情報交換できるようにするため

## お気に入り機能

- 購入者が購入したい商品をお気に入り登録しておくことで後で購入する際に商品を見つけやすくする

## カテゴリー・キーワード検索機能

- 購入者が購入したい商品を見つけやすくするため

# DB設計

-

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