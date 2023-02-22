class Category < ApplicationRecord
  include IconUploader::Attachment(:icon)

  belongs_to :user

  has_many :category_my_transactions, dependent: :destroy
  has_many :my_transactions, through: :category_my_transactions

  validates :name, presence: true, length: { in: 2..30 }
end
