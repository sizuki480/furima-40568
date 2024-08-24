# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...




# テーブル設計 ---------------------------------------------

## usersテーブル

| Column             | Type   | Options |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false |
| email              | string | null: false  unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :buys



## itemsテーブル
| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name             | string     | null: false |
| explanation      | text       | null: false |
| category_id      | integer    | null: false |
| situation_id     | integer    | null: false |
| shipping_pay_id  | integer    | null: false |
| shipping_area_id | integer    | null: false |
| shipping_time_id | integer    | null: false |
| price            | integer    | null: false |
| user             | references | null: false, foreign_key: true |


<!-- ※イメージはActiveStorageで実装するため含まない -->

### Association

- belongs_to :user
- has_one :buy


## buysテーブル
| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippingsテーブル
| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| post_code        | string     | null: false |
| shipping_area_id | integer    | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| building         | string     |
| tel              | string     | null: false |
| buy              | references | null: false, foreign_key: true |

### Association

- belongs_to :buy
