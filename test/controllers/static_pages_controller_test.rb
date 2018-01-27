require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get '/'
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    get '/help'
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App | Help"
  end

  test "should get about" do
    get '/about'
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App | About"
  end

  test "should get contact" do
    get '/contact'
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App | Contact"
  end
end
