class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :my_transactions
  has_many :categories

  validates :name, presence: true, length: { in: 5..50 }

  def admin?
    role == 'admin'
  end

  def total_expenditure
    my_transactions.sum(:amount)
  end
end
