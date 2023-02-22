require 'rails_helper'

RSpec.describe 'my_transactions/show', type: :view do
  before(:each) do
    assign(:my_transaction, MyTransaction.create!(
                              name: 'Name',
                              amount: '9.99',
                              user: nil
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
