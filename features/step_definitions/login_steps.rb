When(/^I navigate to the login page$/) do
  init_app(true)
end

Then(/^I validate that login page is displayed$/) do
  expect(@app.login).to be_displayed
end

When(/^I fill in user name field with JSON username"/) do
  @app.login.username_input.set(username)
end

When(/^I fill in password field with password$/) do
  @app.login.password_input.set(CONFIG['app']['login_password'])
end

When(/^I click Sign in button$/) do
  click_link_or_button('Sign in')
end

Then(/^I validate that "(.*?)" page is displayed$/) do |information|
  expect(page).to have_content(information)
end

def init_app(visit = false)
  @app ||= App.new
  if visit
    @app.login.load
  end
end