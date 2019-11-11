Given(/^the test configuration data has been intialized$/) do
	$poHome = Home.new
	$poLogin = Login.new
	$poRegister = Register.new
	$poAuxiliar = Auxiliar.new
	$poAcesso = ControleDeAcesso.new
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

And(/^I fill the user and password with "([^"]*)" informations$/) do |option|
	$poLogin.loginUser(option)
end

And(/^I click on login button$/) do
	$poLogin.clickLogin
end

Then(/^I click on logout button$/) do
	$poLogin.clickLogout
end

Then(/^I verify if I am logged$/) do
	$poLogin.checkIfIamlogged	
end

And(/^I verify I am unloged$/) do
	$poLogin.checkIfIamUnloged
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

Then(/^I fill the email field with a user that not contains ufabc domain$/) do
	$poRegister.fillUserNotUfabcDomain
end

Then(/^I see a message error that requires a email with ufabc domain$/) do
	$poRegister.verifyUserNotUfabcDomain
end

Then(/^I only should see in the right menu the Entrar and Inscrever options$/) do
	$poAcesso.verifyAvailableOptionsForUnloggedUsers
end

Then(/^I verify that this user has no access privileges$/) do
	$poAcesso.verifyAvailableOptionsForUserWithoutProfile
end

And(/^I verify that the user can not do anything until it is included in a discipline by the coordinator$/) do
	$poAcesso.verifyRestrictedPermission
end

Then(/^I verify students profile have ready only access$/) do
	$poAcesso.verifyRestrictedPermission
end

Then(/^I verify if profile have permission for create classes$/) do
	$poAcesso.verifyIfProfileCanCreateClasses
end

And(/^I verify if profile have permission for create questions$/) do
	$poAcesso.verifyIfProfileCanCreateQuestions
end

And(/^I verify if profile have permission for create exams$/) do
	$poAcesso.verifyIfProfileCanCreateExams
end

And(/^I verify if profile have permission for update disciplines$/) do
	$poAcesso.verifyIfProfileCanUpdateDisciplines
end

And(/^I verify if profile have permission for create and update topics$/) do
	$poAcesso.verifyIfProfileCanUpdateTopics
end

And(/^I verify if profile have permission for create and update institutes$/) do
	$poAcesso.verifyIfProfileCanUpdateAndCreateInstitutes
end

And(/^I verify if profile have permission for create and update courses$/) do
	$poAcesso.verifyIfProfileCanUpdateAndCreateCourses
end

And(/^I verify if profile have permission for access admin menu$/) do
	$poAcesso.verifyIfProfileCanAccessAdminMenu
end



