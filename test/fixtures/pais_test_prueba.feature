Feature: warm welcome
	In order to create a pais
	As a user
	I want to create and manage paises

	Scenario: Create a valid pais
		Given I have no paises
		And I am on the list of articles
		When I follow "New Pais"
		And I fill in "Nombre" with "Alemania"
		And I press "Create"
		Then I should see "New pais created"
		And I should see "Alemania"
		And I should have 1 pais