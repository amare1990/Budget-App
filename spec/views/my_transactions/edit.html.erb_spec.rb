require 'rails_helper'

RSpec.describe 'my_transactions/edit', type: :view do
  let(:my_transaction) do
    MyTransaction.create!(
      name: 'MyString',
      amount: '9.99',
      user: nil
    )
  end

  before(:each) do
    assign(:my_transaction, my_transaction)
  end

  it 'renders the edit my_transaction form' do
    render

    assert_select 'form[action=?][method=?]', my_transaction_path(my_transaction), 'post' do
      assert_select 'input[name=?]', 'my_transaction[name]'

      assert_select 'input[name=?]', 'my_transaction[amount]'

      assert_select 'input[name=?]', 'my_transaction[user_id]'
    end
  end
end
