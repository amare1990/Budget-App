json.extract! my_transaction, :id, :name, :amount, :user_id, :created_at, :updated_at
json.url my_transaction_url(my_transaction, format: :json)
