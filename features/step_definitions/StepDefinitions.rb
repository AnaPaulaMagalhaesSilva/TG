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

And(/^I fill the first and last name$/) do
	$poRegister.fillName
end

And(/^I fill the password and his confirmation "([^"]*)" requirements with "([^"]*)" keys$/) do |option, keys|
	$poRegister.fillPass(option, keys)
end

And(/^I click on signup button$/) do
	$poRegister.clickBtnRegister
end

Then(/^I see a message error that requires a longer password$/) do
	$poRegister.verifyShortPassErrorMessage
end

Then(/^I see a message error that requires two same passwords$/) do
	$poRegister.verifyDifferentsPassErrorMessage
end

And(/^I fill the email field with a user already registered$/) do
	$poRegister.fillUserAlreadyRegistered
end

Then(/^I see a message error that requires an email not registered$/) do
	$poRegister.verifyUserAlreadyRegistered
end

And(/^I fill the email field with too many caracteres$/) do
	$poRegister.fillUserLongEmail
end

