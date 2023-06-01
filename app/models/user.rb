class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, presence: true
  has_many :foods, foreign_key: 'user_id', dependent: :destroy
  has_many :recipes, dependent: :destroy
end
