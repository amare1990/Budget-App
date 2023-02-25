class CreateCategoryMyTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :category_my_transactions do |t|
      t.references :category, null: false, foreign_key: true
      t.references :my_transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
