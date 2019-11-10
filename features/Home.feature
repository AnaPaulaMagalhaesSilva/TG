Feature: Home webMCTest
  
@CheckHeader
Scenario: Checking page's title
	Given the test configuration data has been intialized 
	When I access the webMCTest
	Then I check if every menus are present