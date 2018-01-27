require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full_title" do
    assert_equal full_title("Contact"), "Ruby on Rails Tutorial Sample App | Contact"
    assert_equal full_title("Help"), "Ruby on Rails Tutorial Sample App | Help"
    assert_equal full_title("About"), "Ruby on Rails Tutorial Sample App | About"
    assert_equal full_title(""), "Ruby on Rails Tutorial Sample App"
  end
end
