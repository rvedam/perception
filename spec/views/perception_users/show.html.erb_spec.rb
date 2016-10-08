require 'rails_helper'

RSpec.describe "perception_users/show", type: :view do
  before(:each) do
    @perception_user = assign(:perception_user, PerceptionUser.create!(
      :name => "Name",
      :email => "Email",
      :password_digest => "Password Digest"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password Digest/)
  end
end
