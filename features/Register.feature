Feature: Register webMCTest

@Register
Scenario: Testing the new user's register  
	Given the test configuration data has been intialized 
	When I access the webMCTest
		And I click on "Inscrever" option
	Then I should see the "Inscrever" page
		And I fill the email field
		And I fill the first and last name
		And I fill the password and his confirmation "following" requirements with "same" keys
		And I click on signup button
	Then I verify if the user was correctly created

@Register_With_Too_Short_Password
Scenario: Testing the password requirements 
	Given the test configuration data has been intialized 
	When I access the webMCTest
		And I click on "Inscrever" option
	Then I should see the "Inscrever" page
		And I fill the email field
		And I fill the first and last name
		And I fill the password and his confirmation "unfollowing" requirements with "same" keys
		And I click on signup button
	Then I see a message error that requires a longer password

@Register_With_Differents_Password
Scenario: Testing the message error after fill two differents password
	Given the test configuration data has been intialized 
	When I access the webMCTest
		And I click on "Inscrever" option
	Then I should see the "Inscrever" page
		And I fill the email field
		And I fill the first and last name
		And I fill the password and his confirmation "following" requirements with "differents" keys
		And I click on signup button
	Then I see a message error that requires two same passwords

@Register_With_Existent_Email
Scenario: Testing the message error after fill the email field with a user already registered
	Given the test configuration data has been intialized 
	When I access the webMCTest
		And I click on "Inscrever" option
	Then I should see the "Inscrever" page
		And I fill the email field with a user already registered
		And I fill the first and last name
		And I fill the password and his confirmation "following" requirements with "same" keys
		And I click on signup button
	Then I see a message error that requires an email not registered 

@Register_With_Too_Long_Email 
#This feature depends of teacher's feature correction
Scenario: Testing the message error after fill the email field with too many caracteres 
	Given the test configuration data has been intialized 
	When I access the webMCTest
		And I click on "Inscrever" option
	Then I should see the "Inscrever" page
		And I fill the email field with too many caracteres
		And I fill the first and last name
		And I fill the password and his confirmation "following" requirements with "same" keys
		And I click on signup button
	Then I see a message error that requires an short email 