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

# SROCK-APPの概要
食品の在庫管理の機能と、店舗のスタッフ同士や配送業者の方々とチャットができる機能を組み合わせたアプリです

# アプリを作成した目的
青果店で商品を冷蔵室に搬入するアルバイトをやっていた際に、特定の商品だけが異様に在庫を抱えていたり、逆に売り場に出さなければならない商品の在庫が切れているなどの事態がたびたび発生していました。
その事態を防ぐために、食品の在庫管理をしながら店舗のスタッフや商品を搬入する運送業者と連携が取れるツールを作ってみたいと思い、作成しました。

#  STOCKーAPP DB設計
## usersテーブル
|colum|Type|Options|
|-----|----|-------|
|email|string|null: false|
|password|string|null: false|
|store|string|null: false|
|user|string|null: false, index: true|
### Association
-has_many :messages
-has_many :groups, through: :group_users
-has_many :groups_users
-has_many :stocks

## groupsテーブル
|colum|Type|Options|
|-----|----|-------|
|name|string|null: false|
### Association
-has_many :users, through: :groups_users
-has_many :messages
-has_many :groups_users 


## group_usersテーブル
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

## stocksテーブル
|Column|Type|Options|
|------|----|-------|
|stock|integer|null: false|
|item|string|null: false|
### Association
-belongs_to :user