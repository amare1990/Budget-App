class MyTransaction < ApplicationRecord
  belongs_to :user

  has_many :category_my_transactions
  has_many :categories, through: :category_my_transactions
end
