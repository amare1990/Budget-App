class MyTransaction < ApplicationRecord
  belongs_to :user

  has_many :category_my_transactions, :dependent => :destroy
  has_many :categories, through: :category_my_transactions

  validates :name, presence: true, length: {in: 3..30 }
  validates :amount, presence: true, numericality: { only_float: true, greater_than: 0 }
end
