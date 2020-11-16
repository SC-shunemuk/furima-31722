# テーブル設計

## usersテーブル
| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| first_name     | string | null: false |
| last_name      | string | null: false |
| first_name_kana| string | null: false |
| last_name_kana | string | null: false |
| birth-date     | date   | null: false |

### Association

has_many :items
has_many :parliaments
has_many :comments


## items
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| content         | text   | null: false |
| price           | integer| null: false |
| category        | string | null: false |
| status          | string | null: false |
| shipping_address| string | null: false |
| shipping_day    | integer| null: false |

### Association

belongs_to :user
has_many   :comments
has_one    :parliament
has_one    :address

## parliaments
| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| when_day        | date    | null: false                    |
| user            |reference| null: false, foreign_key: true |
| item            |reference| null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item

## addresses
| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| address_code    | integer | null: false                    |
| prefecture      | string  | null: false                    |
| city            | string  | null: false                    |
| second_city     | string  | null: false                    |
| address_number  | string  | null: false                    |
| house_name      | string  | null: false                    |
| tel             | integer | null: false, unique: true      |

### Association

belongs_to :item

## comments
| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| text            | text    |                                |
| user            |reference| null: false, foreign_key: true |
| item            |reference| null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item