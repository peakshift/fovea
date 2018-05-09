Feature: Update Projects API

 Background: 
    Given the database contains the following
      | ID    | name        | status | description        | hours | client   | 
      | blsm  | Blossom     | 0      | blockchain project | 90    | Blossom1 | 


	Scenario: Update a specific project by ID
    Given a PUT request is made to /projects/:id/
    When the request is recieved
    Then a response status code of 200 is returned
    And the update is displayed in the returned json object

  Scenario: Update a specific project Name by ID
    Given a PUT request is made to /projects/:id/:name
    When the request is recieved
    Then a response status code of 200 is returned
    And the new name is displayed in the returned json object

  Scenario: Update a specific project Status by ID
    Given a PUT request is made to /projects/:id/:status
    When request is received
    Then a response status code of 200 is returned
    And the project status is changed in the returned json object

  Scenario: Update a specific project Description by ID
    Given a PUT request is made to /projects/:id/:description
    When the request is recieved
    Then a response status code of 200 is returned 
    And the new project description is displayed in the returned json object

  Scenario: Update a specific project Hours by ID
    Given a PUT request is made to /projects/:id/:hours
    When the request is recived 
    Then a response status code of 200 is returned
    And the project hours is changed in the returned json object
    And the progress bar is recalculated

  Scenario: Update a specific project Client by ID
    Given a PUT request is made to /projects/:id/:client
    When the request is received
    Then a response status code of 200 is returned
    And the new client name is displayed in the returned json object

  Scenario: Update multiple properties of a specific project
    Given a PUT request is made to /projects/:id 
    When the request is recieved 
    Then a response status code of 200 is returned
    And the updated fields will be displayed in the returned json object

  Scenario: Validate invalid datatype cannot be used to update project status
    Given the system knows about the database 
    When a PUT request is made to /projects/:id/:status
    And the request is not an integer
    Then the response status code of 400 is returned

  Scenario: Validate invalid datatype cannot be used to update project hours
    Given the system knows about the database
    When a PUT request is made to /projects/:id/:hours
    And the request is not a number
    Then the response status code of 400 is returned