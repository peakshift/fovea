Feature: Update Projects API

 Background: 
    Given the database contains the following
      | ID    | name        | status | description        | hours | client   | 
      | blsm  | Blossom     | 0      | blockchain project | 90    | Blossom1 | 


	Scenario: Update multiple properties of a specific project by ID
    Given the system knows about the database
    When a "PUT" request is made to "/projects/:id" with the body
     """
      {
        "status": 1,
        "hours": 100
      }
    """
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"

  Scenario: Update a specific project 'name' by ID
    Given the system knows about the database
    When a "PUT" request is made to "/projects/:id/:name" with the body
     """
      {
        "name": "Blossom Project"
      }
    """
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"

  Scenario: Update a specific project 'status' by ID
    Given the system knows about the database
    When a "PUT" request is made to "/projects/:id/:status" with the body
     """
      {
        "status": 1
      }
    """
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"

  Scenario: Update a specific project 'description' by ID
    Given the system knows about the database
    When a "PUT" request is made to "/projects/:id/:hours" with the body
     """
      {
        "description": "blockchain"
      }
    """
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"

  Scenario: Update a specific project 'hours' by ID
    Given the system knows about the database
    When a "PUT" request is made to "/projects/:id/:hours"  with the body
     """
      {
        "hours": 100
      }
    """
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"

  Scenario: Update a specific project 'client' by ID
    Given the system knows about the database
    When a "PUT" request is made to "/projects/:id/:clients" with the body
     """
      {
        "client": "Blossom"
      }
    """
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"

  @validation
  Scenario: Validate 'status' update request datatype
    Given the system knows about the database 
    When a "PUT" request is made to "/projects/:id/:status" with the body
     """
      {
        "status": to-do
      }
    """
    Then the response status code is "400" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. Incorrect data type."
      }
    """

  @validation
  Scenario: Validate 'hours' update request datatype
    Given the system knows about the database
    When a "PUT" request is made to "/projects/:id/:hours" with the body
     """
      {
        "hours": :"100hrs"
      }
    """
    Then the response status code is "400" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. Incorrect data type."
      }
    """