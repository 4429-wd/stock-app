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


# Chat-Space DB設計
## usersテーブル
|colum|Type|Options|
|-----|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false, index: true|
### Association
-has_many :messages
-has_many :groups, through: :groups_users
-has_many :groups_users
-has_many :items

## groupsテーブル
|colum|Type|Options|
|-----|----|-------|
|name|string|null: false|
### Association
-has_many :users, through: :groups_users
-has_many :messages
-has_many :groups_users 


## groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## messageテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|image|text||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## storeテーブル
|Column|Type|Options|
|------|----|-------|
|store_name|text|nul: false, foreign_key: true|
-belongs_to :users
-belongs_to :item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|text|null: false|
|item_id|integer|null: false, foreign_key: true|
|stock|integer|null: false|
### Association
- has_many :users