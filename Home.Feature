Feature: Home webMCTest
  
@CheckTitle
Scenario: Checking page's title
  Given the test configuration data has been intialized 
  When I access the webMCTest
  Then I check if every links are present