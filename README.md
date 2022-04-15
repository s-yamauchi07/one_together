# README

## users table
|Column            |Type    |Options                   |
|------------------|--------|--------------------------|
|nickname          |string  |null: false               |
|email             |string  |null: false, unique: true |
|encrypted_password|string  |null: false               |
|dog_name          |string  |                          |
|dog_type_id       |integer |                          |

# Association
has_many: spots
has_many: comments
belongs_to: favorite
belongs_to: gone_place

## spots table
|Column            |Type    |Options                   |
|------------------|--------|--------------------------|
|name              |string  |null: false               |
|address           |string  |null: false               |
|latitude          |float   |null: false               |
|longitude         |float   |null: false               |
|address           |string  |null: false               |
|phone_number      |string  |null: false               |
|prefecture_id     |integer |null: false               |
|spot_type _id     |integer |null: false               |
|detail_id         |integer |null: false               |
|comment           |text    |null: false               |
|user_id           |references|null: false, foreign_key: true|

# Association
belongs_to :user
has_many: comments
belongs_to: favorite
belongs_to: gone_place

## gone_places table
|Column            |Type        |Options                        |
|------------------|------------|-------------------------------|
|user_id           |references  |null: false, foreign_key: true |
|spot_id           |references  |null: false, foreign_key: true |

# Association
belongs_to :user
belongs_to :spot


## favorites table
|Column            |Type        |Options                        |
|------------------|------------|-------------------------------|
|user_id           |references  |null: false, foreign_key: true |
|spot_id           |references  |null: false, foreign_key: true |

# Association
belongs_to :user
belongs_to :spot

## comments table
|Column            |Type        |Options                        |
|------------------|------------|-------------------------------|
|content           |text        |null: false                    |
|user_id           |references  |null: false, foreign_key: true |
|spot_id           |references  |null: false, foreign_key: true |

# Association
belongs_to :user
belongs_to :spot


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
