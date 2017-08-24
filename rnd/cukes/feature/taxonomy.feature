Feature: As an admin able to CRUD admin

 Background: I am logged in as admin and in configuration section
  Given I am logged in as admin
  And go to Taxonomies
  Then I should see heading "Taxonomies"
@fail
 Scenario: Should be able to create a new taxonomy
  Then I click button NEW TAXONOMY
  Then I should see heading "New Taxonomy"
  Then I specify the taxonomy name "To Delete"
  And submit the new form
  Then I should get a success message "has been successfully created!"
  Then I right click on taxonomy in tree
  Then I click edit


