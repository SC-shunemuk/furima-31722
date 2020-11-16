# テーブル設計

## usersテーブル
| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| encrypted_password| string | null: false |
| first_name        | string | null: false |
| last_name         | string | null: false |
| first_name_kana   | string | null: false |
| last_name_kana    | string | null: false |
| birth_date        | date   | null: false |

### Association

has_many :items
has_many :purchases
has_many :comments


## items
| Column             | Type    | Options           |
| ------------------ | ------- | ----------------- |
| name               | string  | null: false       |
| content            | text    | null: false       |
| price              | integer | null: false       |
| category_id        | integer | null: false       |
| status_id          | integer | null: false       |
| bear_price         | integer | null: false       |
| shipping_address_id| integer | null: false       |
| shipping_day_id    | integer | null: false       |
| user               |reference| foreign_key: true |

### Association

belongs_to :user
has_many   :comments
has_one    :purchase

## purchases
| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user            |reference| null: false, foreign_key: true |
| item            |reference| null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one    :address

## addresses
| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| address_code    | string  | null: false                    |
| prefecture_id   | integer | null: false                    |
| city            | string  | null: false                    |
| address_number  | string  | null: false                    |
| house_name      | string  |                                |
| tel             | string  | null: false, unique: true      |
| purchase        |reference| null:false, foreign_key: true  |

### Association

belongs_to :purchase

## comments
| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| text            | text    |                                |
| user            |reference| null: false, foreign_key: true |
| item            |reference| null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item