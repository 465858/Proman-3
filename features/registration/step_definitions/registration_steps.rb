Given /"(.*)" is an anonymous user/ do |name|
  visit '/logout'
end

Given /^"(.*)" an unconfirmed user$/ do |name|
  @email = "#{name}@mail.com"
  When "I go to the registration form"
  And "I fill in \"login\" with \"#{name}\""
  And "I fill in \"email\" with \"#{@email}\""
  And "I fill in \"password\" with \"secret\""
  And "I fill in \"confirmation\" with \"secret\""

  And "I select \"Mr\" from \"title\""
  And "I fill in \"First (given) name\" with \"#{name}\""
  And "I fill in \"initials\" with \"P.\""
  And "I fill in \"Last (family) name\" with \"Jobling\""  
  And "I fill in \"I preferred to be known as\" with \"Hector\""  
    
  And "I fill in \"Staff or student number\" with \"123456\""  
  And "I check \"I accept\""
  
  When "I press \"Register\""
  Then "I should have a successful registration"
end

Given /^"(.*)" an unconfirmed user with password "(.*)"$/ do |name, password|
  @email = "#{name}@mail.com"
  When "I go to the registration form"
  And "I fill in \"login\" with \"#{name}\""
  And "I fill in \"email\" with \"#{@email}\""
  And "I fill in \"password\" with \"#{password}\""
  And "I fill in \"confirmation\" with \"#{password}\""

  And "I select \"Mr\" from \"title\""
  And "I fill in \"First (given) name\" with \"#{name}\""
  And "I fill in \"initials\" with \"P.\""
  And "I fill in \"Last (family) name\" with \"Jobling\""  
  And "I fill in \"I preferred to be known as\" with \"Hector\""  
    
  And "I fill in \"Staff or student number\" with \"123456\""  
  And "I check \"I accept\""
  
  When "I press \"Register\""
  Then "I should have a successful registration"
end

Given /^"(.*)" a confirmed user$/ do |name|
  Given "\"#{name}\" an unconfirmed user"
  And "I receive an email"
  And "I open the email"
  And "I should see \"confirm\" in the email body"
  When "I follow \"confirm\" in the email"
  Then "I should see my account page"
  Then "a clear email queue"
  visit '/logout'
end

Given /^"(.*)" a confirmed user with password "(.*)"$/ do |name, password|
  Given "\"#{name}\" an unconfirmed user with password \"#{password}\""
  And "I receive an email"
  And "I open the email"
  And "I should see \"confirm\" in the email body"
  When "I follow \"confirm\" in the email"
  Then "I should see my account page"
  visit '/logout'
end

Then /^I should see the registration form$/ do
  response.should contain('Login')
  response.should contain('Email')
  response.should contain('Password')
  response.should contain('Title')
  response.should contain('First (given) name')
  response.should contain('Initials')
  response.should contain('Last (family) name')
  response.should contain('Staff or student number')
  response.should contain('I accept')
  response.should contain('Register')
end

Then /^I should have a successful registration$/ do
  When 'I should see "Registration completed"'
end

Then /^I should have an unsuccessful registration$/ do
  When 'I should not see "Registration completed"'
end

Then /^I should be logged in$/ do
  When 'I should see "My Account"'
end

Then /^I should see my account page$/ do
  When 'I should see "My Account"'
end

Then /^I should not be logged in$/ do
  When 'I should not see "My Account"'
end

Then /^I should not see my account page$/ do
  When 'I should not see "My Account"'
end
