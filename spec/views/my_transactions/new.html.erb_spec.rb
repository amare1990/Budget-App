require 'rails_helper'

RSpec.describe "my_transactions/new", type: :view do
  before(:each) do
    assign(:my_transaction, MyTransaction.new(
      name: "MyString",
      amount: "9.99",
      user: nil
    ))
  end

  it "renders new my_transaction form" do
    render

    assert_select "form[action=?][method=?]", my_transactions_path, "post" do

      assert_select "input[name=?]", "my_transaction[name]"

      assert_select "input[name=?]", "my_transaction[amount]"

      assert_select "input[name=?]", "my_transaction[user_id]"
    end
  end
end
