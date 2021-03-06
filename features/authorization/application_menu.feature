Feature: Application menu
  In order to be able to perform certain tasks
  As a user with a predefined role
  I want the system to present a different application menu depending on the user's role
  
  Scenario: Display standard menu to anonymous users
    Given "guest" is an anonymous user
    When I go to the homepage
    Then I should see "Home" within "#navigation"
    And I should see "Register" within "#navigation"
    And I should see "Login" within "#navigation"
    And I should see "Home" within "#navset"
    And I should see "Projects" within "#navset"
    And I should see "Contact" within "#navset"
    And I should see "About" within "#navset"


  Scenario: Display extra features menu to logged in users
    Given "chris" a logged in user
    When I go to the homepage
    Then I should see "Home" within "#navigation"
    And I should see "Logout" within "#navigation"
    And I should not see "Register" within "#navigation"

  Scenario: Display student features to student users
    Given "mark" a logged in user
    And "mark" has "student" role
    When I go to the homepage
    Then I should see "Home"
    And I should see "Logout"
    And I should not see "Register"
 
  Scenario: Display staff features to staff users
    Given "joseph" a logged in user 
    And "joseph" has "staff" role
    When I go to the homepage
    Then I should see "Home"
    And I should see "Logout"
    And I should not see "Register"

  Scenario: Display coordinator menu to coordinators
    Given "paul" a logged in user
    And "paul" has "coordinator" role
    When I go to the homepage
    Then I should see "Home"
    And I should see "Log out"
    And I should not see "Register"

  Scenario: Display all menu items to administrator
    Given "admin" a logged in user
    And "admin" has "administrator" role
    When I go to the homepage
    Then I should see "Home"
    And I should see "Log out"
    And I should not see "Register"