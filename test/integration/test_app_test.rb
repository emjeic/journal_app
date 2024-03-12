require "test_helper"

class TestAppTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  include Devise::TestHelpers

  # test "create_task" do 
  #   sign_in users(:two)
  #   get new_category_task_path(tasks(:one).category)

  #   assert_response :success
  # end

  test "visiting the index" do
    visit root_path

  end
end
