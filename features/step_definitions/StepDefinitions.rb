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

And(/^I click on "login" option$/) do
	$poLogin.clickLogin
end

Then(/^I should see the login page$/) do

end

And(/^I fill the user and password with correct informations$/) do

end

And(/^I click on login button$/) do

end

Then(/^I verify if I am logged$/) do

end




    #$poRegister.clickRegister
    #$poRegister.checkExceptions