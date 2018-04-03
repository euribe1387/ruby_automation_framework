require 'site_prism'

# This class is the Login Page Object
class LoginPage < SitePrism::Page
  set_url '/users/sign_in'
  # element :username_input, "input[type='email']", visible: true
  # element :password_input, "input[type='password']"
  element :username_input, :xpath, "//input[@type='email']"
  element :password_input, :xpath, "//input[@type='password']"
end