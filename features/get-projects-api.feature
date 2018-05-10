Feature: Get Projects API

  Background: 
    Given the database contains the following
      | ID    | name        | status | description        | hours | client   | 
      | blsm  | Blossom     | 0      | blockchain project | 90    | Blossom1 | 


  Scenario: Get all projects
    Given the system knows about the database
    When a GET request is made to /projects
    Then a response status code of 200 is returned
    And the "Content-Type" header is "application/json"
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
    When a GET request is made to /projects/:status
    Then a response status code of 200 is returned
    And the "Content-Type" header is "application/json"
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
    When a GET request is made to /projects/:client
    Then a response status code of 200 is returned
    And the "Content-Type" header is "application/json"
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
    When a GET request is made to /projects/:id
    Then a response status code of 200 is returned
    And the "Content-Type" header is "application/json"
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
    When a GET request is made to /projects/:id/:name
    Then a response status code of 200 is returned
    And the "Content-Type" header is "application/json"
    And the response body is
    """
      {
        "name": "Blossom"
      }
    """
      
  Scenario: Get a specific project Status by ID
    Given the system knows about the database
    When a GET request is made to /projects/:id/:status
    Then a response status code of 200 is returned
    And the "Content-Type" header is "application/json"
    And the response body is
    """
      {
        "status": 0
      }
    """
 
  Scenario: Get a specific project Description by ID
    Given the system knows about the database
    When a GET request is made to /projects/:id/:description
    Then a response status code of 200 is returned
    And the "Content-Type" header is "application/json"
    And the response body is
    """
      {
        "description": "blockchain project"
      }
    """
  
  Scenario: Get a specific project Hours by ID
    Given the system knows about the database
    When a GET request is made to /projects/:id/:hours
    Then a response status code of 200 is returned
    And the "Content-Type" header is "application/json"
    And the response body is
    """
      {
        "hours": 90
      }
    """
  
  Scenario: Get a specific project Client by ID
    Given the system knows about the database
    When a GET request is made to /projects/:id/:client
    Then a response status code of 200 is returned
    And the "Content-Type" header is "application/json"
    And the response body is
    """
      {
        "client": "Blossom1"
      }
    """

  Scenario: Deny request to get projects with an invalid ID
    Given the system knows about the database
    When a GET request is made to /projects/:id
    Then a response status code of 400 is returned 
    And the "Content-Type" header is "application/json"

  Scenario: Deny request to get projects with an invalid Client ID
    Given the system knows about the database
    When a GET request is made to /projects/:client
    Then a response status code of 400 is returned 
    And the "Content-Type" header is "application/json"

  Scenario: Deny request to get projects with an invalid Status code
    Given the system knows about the database
    When a GET request is made to /projects/:status
    Then a response status code of 400 is returned 
    And the "Content-Type" header is "application/json"