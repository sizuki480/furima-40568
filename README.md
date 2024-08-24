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
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :buys



## itemsテーブル
| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| explanation   | text       | null: false |
| category      | references | null: false, foreign_key: true |
| situation     | string     | null: false |
| shipping_pay  | string     | null: false |
| shipping_area | string     | null: false |
| shipping_time | string     | null: false |
| price         | string     | null: false |
| sell_flag     | boolean    | default: false |
<!-- 未購入：false   購入済：true -->

<!-- ※イメージはActiveStorageで実装するため含まない -->

### Association

- belongs_to :user
- has_one :buy


## buysテーブル
| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| sell_user_id | references | null: false, foreign_key: true |
| buy_user_id  | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |
| shipping_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippingsテーブル
| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| post_code   | integer    | null: false |
| prefectures | references | null: false, foreign_key: true |
| city        | references | null: false, foreign_key: true |
| address     | string     | null: false |
| building    | string     |
| tel         | integer    | null: false |
| biys_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :buy
