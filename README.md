# テーブル設計

## users テーブル

| Column                | Type   | Option                    |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| password              | string | null: false               |
| confirmation_password | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_kana        | string | null: false               |
| first_name_kana       | string | null: false               |
| birthday              | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column       | Type       | Option            |
| ------------ | ---------- | ----------------- |
| image        |            |                   |
| name         | string     | null: false       | 
| description  | text       | null: false       |
| category     | integer    | null: false       |
| condition    | integer    | null: false       |
| delivery_fee | integer    | null: false       |
| area         | integer    | null: false       |
| days         | integer    |  null: false      |
| price        | integer    | null: false       |
| user_id      | references | foreign_key: true |

### Association

- has_one :oder
- belongs_to :user

## ordersテーブル

| Column     | Type       | Option            |
| ---------- | ---------- | ----------------- |
| item_id    | references | foreign_key: true |
| user_id    | references | foreign_key: true |
| address_id | references | foreign_key: true |

### Association 

belongs_to :user
belongs_to :item
belongs_to :address

## addressesテーブル

| Column           | Type    | Option      |
| ---------------- | ------- | ----------- |
| zip_code         | integer | null: false |
| prefectures      | integer | null: false |
| municipality     | string  | null: false |
| house_number     | string  | null: false |
| building         | string  |             |
| telephone_number | integer | null: false |

### Association

- has_many :orders