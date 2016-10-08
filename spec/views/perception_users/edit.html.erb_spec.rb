require 'rails_helper'

RSpec.describe "perception_users/edit", type: :view do
  before(:each) do
    @perception_user = assign(:perception_user, PerceptionUser.create!(
      :name => "MyString",
      :email => "MyString",
      :password_digest => "MyString"
    ))
  end

  it "renders the edit perception_user form" do
    render

    assert_select "form[action=?][method=?]", perception_user_path(@perception_user), "post" do

      assert_select "input#perception_user_name[name=?]", "perception_user[name]"

      assert_select "input#perception_user_email[name=?]", "perception_user[email]"

      assert_select "input#perception_user_password_digest[name=?]", "perception_user[password_digest]"
    end
  end
end
