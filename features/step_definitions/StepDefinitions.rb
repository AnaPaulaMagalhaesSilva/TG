Given(/^the test configuration data has been intialized$/) do
	$poHome = Home.new
	$poLogin = Login.new
	$poRegister = Register.new
	$poAuxiliar = Auxiliar.new
end

When(/^I access the webMCTest$/) do
	visit 'http://177.104.60.16:8000'
	puts page.current_url
	page.save_screenshot('screenshot.png')
end

Then(/^I check if every menus are present$/) do
	$poHome.checkHeader
end

And(/^I click on "([^"]*)" option$/) do |option|
	$poHome.clickMenu(option)
end

Then(/^I should see the "([^"]*)" page$/) do |option|	
	$poHome.checkPage(option)	
end

And(/^I fill the user and password with correct informations$/) do
	$poLogin.loginCoordUser
end

And(/^I click on login button$/) do
	$poLogin.clickLogin
end

Then(/^I verify if I am logged$/) do
	$poLogin.checkIfIamlogged	
end

And(/^I fill the email field$/) do
	$poRegister.fillMail
end






#$poRegister.checkExceptions