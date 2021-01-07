# テーブル設計

## users テーブル

| Column                | Type   | Option                    |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_kana        | string | null: false               |
| first_name_kana       | string | null: false               |
| birthday              | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    | 
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| days_id         | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_one :oder
- belongs_to :user

## orders テーブル

| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association 

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| zip_code         | string     | null: false                    |
| area_id          | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order