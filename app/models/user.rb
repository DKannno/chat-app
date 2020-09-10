class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable

         has_many :room_users
         has_many :rooms, through: :room_users
         has_many :messages
        # nameだけバリデーションを記述している理由は、nameはもともとdeviseに用意されていないカラムだったためです。他のカラムはdeviseがあらかじめ用意しているカラムなので、deviseの標準でバリデーションが設定されています。
         validates :name, presence: true
end
