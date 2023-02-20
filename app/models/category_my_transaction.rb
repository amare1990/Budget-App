class CategoryMyTransaction < ApplicationRecord
  belongs_to :category
  belongs_to :my_transaction
end
