Feature: API

Background:
Given i am on Api page 

Scenario: User Signin
	When I send a POST request to api
	Then the response status should be 200
	

