Feature: Login webMCTest

@Login
Scenario: Testing login on the site with an user previously created
  Given the test configuration data has been intialized 
When I access the webMCTest
	And I click on "Entrar" option
Then I should see the "login" page
	And I fill the user and password with correct informations
	And I click on login button
Then I verify if I am logged

