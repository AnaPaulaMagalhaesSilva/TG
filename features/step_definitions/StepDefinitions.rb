Given(/^the test configuration data has been intialized$/) do
	$poHome = Home.new
	$poLogin = Login.new
	$poRegister = Register.new
end

When(/^I access the webMCTest$/) do
	visit 'http://177.104.60.16:8000/topic/'
	page.save_screenshot('screenshot.png')
end

Then(/^I check if every links are present$/) do
	$poHome.checkMenus
end

And(/^I click on "([^"]*)" option$/) do |option|
	$poHome.clickMenu(option)
end

Then(/^I should see the "([^"]*)" page$/) do |option|	
	$poHome.checkPage(option)	
end

And(/^I fill the user and password with correct informations$/) do
	$poLogin.loginAdminUser
end

And(/^I click on login button$/) do
	$poLogin.clickLogin
end

Then(/^I verify if I am logged$/) do
	$poLogin.checkIfIamlogged	
end






#$poRegister.checkExceptions