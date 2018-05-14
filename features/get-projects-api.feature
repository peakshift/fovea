Feature: Get Projects API

  Background: 
    Given the database contains the following
      | ID    | name        | status | description        | hours | client   | 
      | blsm  | Blossom     | 0      | blockchain project | 90    | Blossom1 | 


  Scenario: Get all projects
    Given the system knows about the database
    When a "GET" request is made to "/projects"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is 
    """
      [
        { 
          "ID": "blsm", 
          "name": "Blossom",
          "status": 0,
          "description": "blockchain project",
          "hours": 90,
          "client": "Blossom1"
        }
      ]
    """
  
  Scenario: Get all projects with a specific status
    Given the system knows about the database
    When a "GET" request is made to "/projects/:status"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      [
        {
          "ID": "blsm",
          "name": "Blossom",
          "status": 0,
          "description": "blockchain project",
          "hours": 90,
          "client": "Blossom1"
        }
      ]
    """
  
  Scenario: Get all projects from a specific client
    Given the system knows about the database
    When a "GET" request is made "to /projects/:client"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      [
        {
          "ID": "blsm",
          "name": "Blossom",
          "status": 0,
          "description": "blockchain project",
          "hours" : 90,
          "client": "Blossom1"
        }
      ]
    """

  Scenario: Get a specific project by ID
    Given the system knows about the database
    When a "GET" request is made to "/projects/:id"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      { 
        "ID": "blsm",
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
  
  Scenario: Get a specific project Name by ID
    Given the system knows about the database
    When a "GET" request is made to "/projects/:id/:name"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "name": "Blossom"
      }
    """
      
  Scenario: Get a specific project Status by ID
    Given the system knows about the database
    When a "GET" request is made to "/projects/:id/:status"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "status": 0
      }
    """
 
  Scenario: Get a specific project Description by ID
    Given the system knows about the database
    When a "GET" request is made to "/projects/:id/:description"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "description": "blockchain project"
      }
    """
  
  Scenario: Get a specific project Hours by ID
    Given the system knows about the database
    When a "GET" request is made to "/projects/:id/:hours"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "hours": 90
      }
    """
  
  Scenario: Get a specific project Client by ID
    Given the system knows about the database
    When a "GET" request is made to "/projects/:id/:client"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "client": "Blossom1"
      }
    """

  @validation
  Scenario: Validate get request by 'ID'
    Given the system knows about the database
    When a "GET" request is made to "/projects/:id"
    Then the response status code is "400"  
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. 'id' not found."
      }
    """

  @validation
  Scenario: Validate get request by 'client'
    Given the system knows about the database
    When a "GET" request is made to "/projects/:client"
    Then the response status code is "400"  
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. 'client' not found."
      }
    """

  @validation
  Scenario: Validate get request by 'status'
    Given the system knows about the database
    When a "GET" request is made to "/projects/:status"
    Then the response status code is "400"  
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. 'status' not found."
      }
    """