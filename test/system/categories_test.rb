require "application_system_test_case"
class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:user_one)
  end
  test "visiting" do
    visit root_path
  end
end







