Feature: Controle de Acesso webMCTest

@Features_Available_To_Unlogged_Users
Scenario: Validate features available to unlogged users
	Given the test configuration data has been intialized 
	When I access the webMCTest
	Then I only should see in the right menu the Entrar and Inscrever option

@Registered_User_Without_Any_Access_Privileges
Scenario: Registered user without access granted to a course
	Given the test configuration data has been intialized 
	When I access the webMCTest
		And I click on "Entrar" option
	Then I should see the "login" page
		And I fill the user and password with "usuário sem privilégios" informations
		And I click on login button
	Then I verify that this user has no access privileges
		And I verify that the user can not do anything until it is included in a discipline by the coordinator

@Verify_Privileges_Student_Profile
Scenario: Check if student users have read only access
	Given the test configuration data has been intialized 
	When I access the webMCTest
		And I click on "Entrar" option
	Then I should see the "login" page
		And I fill the user and password with "estudante" informations
		And I click on login button
	Then I verify students profile have ready only access

@Verify_Privileges_Professor_Profile
Scenario: Verify if teacher users have access to create classes, questions and exams
	Given the test configuration data has been intialized 
	When I access the webMCTest
		And I click on "Entrar" option
	Then I should see the "login" page
		And I fill the user and password with "professor" informations
		And I click on login button
	Then I verify if profile have permission for create classes
		And I verify if profile have permission for create questions
		And I verify if profile have permission for create exams

@Verify_Privileges_Coordinator_Profile
Scenario: Verify if coordinator users have access to create classes, questions, exams, update disciplines and topics
	Given the test configuration data has been intialized 
	When I access the webMCTest
		And I click on "Entrar" option
	Then I should see the "login" page
		And I fill the user and password with "coordenador" informations
		And I click on login button
	Then I verify if profile have permission for create classes
		And I verify if profile have permission for create questions
		And I verify if profile have permission for create exams
		And I verify if profile have permission for update disciplines
		And I verify if profile have permission for create and update topics

@Verify_Privileges_Admin_Profile
Scenario: Verify if coordinator users have access to create classes, questions, exams, update disciplines and topics
	Given the test configuration data has been intialized 
	When I access the webMCTest
		And I click on "Entrar" option
	Then I should see the "login" page
		And I fill the user and password with "administrador" informations
		And I click on login button
	Then I verify if profile have permission for create classes
		And I verify if profile have permission for create questions
		And I verify if profile have permission for create exams
		And I verify if profile have permission for update disciplines
		And I verify if profile have permission for create and update topics
		And I verify if profile have permission for create and update institutes
		And I verify if profile have permission for create and update courses
		And I verify if profile have permission for access admin menu