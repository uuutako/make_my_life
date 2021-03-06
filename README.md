# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  2.6.5
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column               | Type       | Options        |
| -------------------- | ---------- | -------------- |
| nick_name            | string     | unique: true   |
| email                | string     | unique: true   |
| password             | string     | unique: true   |
| first_name           | string     | null: false    |
| last_name            | string     | null: false    |
| first_name_kana      | string     | null: false    |
| last_name_kana       | string     | null: false    |
| birthday             | date       | null: false    |
| sex                  | string     | null: false    |
| age                  | integer    | null: false    |
| instagram            | string     |                |
| facebook             | string     |                |
| twitter              | string     |                |
| phrase               | references | foreign_key: true |

### Association

  has_many    :plans
  has_many    :comments
  has_many    :likes
  has_many    :phrase


## plan テーブル

| Column               | Type        | Options           |
| -------------------- | ----------- | ----------------- |
| title                | string      | null: false       |
| concept              | text        | null: false       |
| item                 | text        | null: false       |
| cost                 |             | null: false       |
| process              | text        | null: false       |
| time                 | integer     | null: false       |
| timezone_id          | integer     | null: false       |
| place                | string      | null: false       |
| category_id          | integer     | null: false       |
| user                 | references  | foreign_key: true |  


### Association

- belongs_to    :user
- has_many      :comments
  has_many      :category
  has_many      :likes

### category テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| plan        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association
- has_many : plans


### comments テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| user        | references | foreign_key: true |
| comments    | text       | null: false       |
| plan        | references | foreign_key: true |

### Association
- belongs_to : user
- belongs_to : plan


### phrase テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| user        | references | foreign_key: true |
| name        | text       |                   |
| phrase      | text       | null: false       |

### Association
- belongs_to : user