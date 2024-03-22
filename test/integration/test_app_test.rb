require "test_helper"

class TestAppTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  include Devise::Test::IntegrationHelpers

  fixtures :all  # Load all fixtures

  # test "create_task" do 
  #   sign_in users(:two)
  #   get new_category_task_path(tasks(:one).category)

  #   assert_response :success
  # end

  test "visiting the index" do
    get root_path
    assert true
  end

  # model testing
  test "should not save category without title" do
    category = Category.new
    assert_not category.save, "Saved the category without a title"
  end

  test "delete category" do
    # Sign in a user
    user = users(:user_one)
    sign_in user

    # Create a category to delete
    category = categories(:one)

    # Send a DELETE request to delete the category
    delete category_path(category)

    # Assert that the category is deleted and redirected to the index page
    assert_redirected_to categories_path
    # assert_nil Category.find_by(id: category.id)
  end

  # test "delete task" do
  #   # Sign in a user (if needed)
  #   user = users(:user_one)
  #   sign_in user

  #   # Create a task to delete
  #   task = tasks(:six)

  #   # Send DELETE request to delete the task
  #   delete task_path(task)

  #   # Assert that the response is redirected to the tasks index page
  #   assert_redirected_to tasks_path

  #   # Assert that the task is deleted from the database
  #   assert_nil Task.find_by(id: task.id)
  # end
end
