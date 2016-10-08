require 'rails_helper'

RSpec.describe "perception_users/new", type: :view do
  before(:each) do
    assign(:perception_user, PerceptionUser.new(
      :name => "MyString",
      :email => "MyString",
      :password_digest => "MyString"
    ))
  end

  it "renders new perception_user form" do
    render

    assert_select "form[action=?][method=?]", perception_users_path, "post" do

      assert_select "input#perception_user_name[name=?]", "perception_user[name]"

      assert_select "input#perception_user_email[name=?]", "perception_user[email]"

      assert_select "input#perception_user_password_digest[name=?]", "perception_user[password_digest]"
    end
  end
end
