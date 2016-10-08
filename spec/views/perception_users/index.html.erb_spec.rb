require 'rails_helper'

RSpec.describe "perception_users/index", type: :view do
  before(:each) do
    assign(:perception_users, [
      PerceptionUser.create!(
        :name => "Name",
        :email => "Email",
        :password_digest => "Password Digest"
      ),
      PerceptionUser.create!(
        :name => "Name",
        :email => "Email",
        :password_digest => "Password Digest"
      )
    ])
  end

  it "renders a list of perception_users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
  end
end
