require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest

  setup do
    @user = User.new(name: "Travel", email: "elfa@gmail.com", password: "caca")
  end

  test "Get new user form and create user " do
    get "/users/new"
    assert_response :success
    assert_difference("@user.count", 1) do
    post user_path, params: { user: { name: "Travel", email: "elfa@gmail.com", password: "caca" } }
       follow_redirect!
    end
    assert_template 'users/show'
  end
end
