Feature: Update Projects API

 Background: 
    Given the database contains the following
      | ID    | name        | status | description        | hours | client   | 
      | blsm  | Blossom     | 0      | blockchain project | 90    | Blossom1 | 


	Scenario: Update mutliple properties of a specific project by ID
    Given the system knows about the database
    When a PUT request is made to /projects/:id
    Then a response status code of 200 is returned
    And the "Content-Type" header is "application/json"

  Scenario: Update a specific project Name by ID
    Given the system knows about the database
    When a PUT request is made to /projects/:id/:name
    Then a response status code of 200 is returned
    And the "Content-Type" header is "application/json"

  Scenario: Update a specific project Status by ID
    Given the system knows about the database
    When a PUT request is made to /projects/:id/:status
    Then a response status code of 200 is returned
    And the "Content-Type" header is "application/json"

  Scenario: Update a specific project Description by ID
    Given a PUT request is made to /projects/:id/:description
    When the request is recieved
    Then a response status code of 200 is returned
    And the "Content-Type" header is "application/json"

  Scenario: Update a specific project Hours by ID
    Given the system knows about the database
    When a PUT request is made to /projects/:id/:hours 
    Then a response status code of 200 is returned
    And the "Content-Type" header is "application/json"

  Scenario: Update a specific project Client by ID
    Given the system knows about the database
    When a PUT request is made to /projects/:id/:clients
    Then a response status code of 200 is returned
    And the "Content-Type" header is "application/json"

  Scenario: Deny project status update request with invalid datatype
    Given the system knows about the database 
    When a PUT request is made to /projects/:id/:status
    Then a response status code of 400 is returned
    And the "Content-Type" header is "application/json"

  Scenario: Deny project hours update request with invalid datatype
    Given the system knows about the database
    When a PUT request is made to /projects/:id/:hours
    Then a response status code of 400 is returned
    And the "Content-Type" header is "application/json"