class Category < ApplicationRecord
  belongs_to :user

  has_many :category_my_transactions
  has_many :my_transactions, through: :category_my_transactions

  validates :name, presence: true, length:{in: 1..30 }
end
