Feature: Home webMCTest
  
@CheckTitle
Scenario: Checking page's title
  Given the test configuration data has been intialized 
  When I access the webMCTest
  Then I check if every links are present

@Login
Scenario: Testing login on the site with an user previously created
	Given the test configuration data has been intialized 
	When I access the webMCTest
		And I click on "Entrar" option
	Then I should see the "login" page
		And I fill the user and password with correct informations
		And I click on login button
	Then I verify if I am logged

@Register
Scenario: Testing the new user's register  
	Given the test configuration data has been intialized 
	When I access the webMCTest
		And I click on "Inscrever" option
	Then I should see the "Inscrever" page
		And I fill the email field
		And I fill the first and last name
		And I fill the password and his confirmation
		And I click on signup button