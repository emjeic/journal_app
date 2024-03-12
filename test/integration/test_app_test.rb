require "test_helper"

class TestAppTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  include Devise::Test::IntegrationHelpers

  # test "create_task" do 
  #   sign_in users(:two)
  #   get new_category_task_path(tasks(:one).category)

  #   assert_response :success
  # end

  test "visiting the index" do
    get root_path

  end
end
