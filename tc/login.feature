@login @regression
Feature: Verify the login feature
	As an application user I would like to validate that users can login
	to the application using a valid credential
    Owner: Eduardo Uribe
    TC ID: 11111
	
	Scenario: Verify users can login
		When I navigate to the login page
			Then I validate that login page is displayed

		When I fill in user name field with JSON username
			And I fill in password field with password
			And I click Sign in button
		Then I validate that "Employees information" page is displayed