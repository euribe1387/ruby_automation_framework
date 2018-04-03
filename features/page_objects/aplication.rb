require_relative 'login_po'

# This class
class App
  # This method loads the login page
  # # Parameters:
  # # N/A
  # # Return:
  # # => Object: Login Page"
  def login
    LoginPage.new
  end
end