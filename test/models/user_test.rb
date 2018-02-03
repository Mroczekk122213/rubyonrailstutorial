require 'test_helper'

class UserTest < ActiveSupport::TestCase
def setup
  @user = User.new(name: "Piotr", email: "USER@foo.COM",
                   password: "piesek", password_confirmation: "piesek")
end
test "schould_be_valid" do
assert @user.valid?
end
test "name schould be present" do
  @user.name = "   "
  assert_not @user.valid?
end
test "email schould be present" do
  @user.email = "   "
  assert_not @user.valid?
end
test "name schould not be too long" do
  @user.name = "a" * 51
  assert_not @user.valid?
end
test "email schould not be too long" do
  @user.email = "a" * 244 + "@example.com"
  assert_not @user.valid?
end
test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
end
end
test "email adressess schould be unique" do
duplicate_user = @user.dup
duplicate_user.email = @user.email.upcase
@user.save
assert_not duplicate_user.valid?
end
test "email addresses should be saved as lower-case" do
  mixed_case_email = "USER@foo.COM"
  @user.email = mixed_case_email

  # Calling `save!` here will raise an exception if failed to save @user.
  @user.save!
  assert_equal mixed_case_email.downcase, @user.reload.email
end
test "password schould be present" do
  @user.password = @user.password_confirmation = "" * 6
  assert_not @user.valid?
end
test "password schould have minimum length" do
  @user.password = @user.password_confirmation = "a" * 5
  assert_not @user.valid?
end
test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end
end
