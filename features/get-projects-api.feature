Feature: Get Projects API

  Background: 
    Given the database contains the following
      | ID    | name        | status | description        | hours | client   | 
      | blsm  | Blossom     | 0      | blockchain project | 90    | Blossom1 | 


  Scenario: Get all projects
    Given GET request is made to /projects
    When the request is received
    Then a response status code of 200 is returned
    And the data is returned as a json object equal to
    """
      ```json
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
      ```
    """
  
  Scenario: Get all projects with a specific status
    Give a GET request is made to /projects/:status
    When the request is received
    Then a response status code of 200 is returned
    And the data is returned as a json object equal to 
    """
      ```json
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
      ```
    """
  
  Scenario: Get all projects from a specific client
    Given a GET request is made to /projects/:client
    When the request is received
    Then a response status code of 200 is returned
    And the data is returned as a json object equal to
    """
      ```json
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
      ```
    """

  Scenario: Get a specific project by ID
    Given a GET request is made to /projects/:id
    When the request is received
    Then a response status code of 200 is returned
    And the data is returned as a json object equal to
    """
      ```json
      { 
        "ID": "blsm",
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
      ```
    """
  
  Scenario: Get a specific project Name by ID
    Given a GET request is made to /projects/:id/:name
    When the request is received
    Then a response status code of 200 is returned
    And the data is returned as a json object equal to
    """
      ```json
      {
        "name": "Blossom"
      }
      ```
    """
      
  Scenario: Get a specific project Status by ID
    Given a GET request is made to /projects/:id/:status
    When the request is received
    Then a response status code of 200 is returned
    And the data is returned as a json object equal to
    """
      ```json
      {
        "status": 0
      }
      ```
    """
 
  Scenario: Get a specific project Description by ID
    Given a GET request is made to /projects/:id/:description
    When the request is received
    Then a response status code of 200 is returned
    And the data is returned as a json object equal to
    """
      ```json
      {
        "description": "blockchain project"
      }
      ```
    """
  
  Scenario: Get a specific project Hours by ID
    Given a GET request is made to /projects/:id/:hours
    When the request is received
    Then a response status code of 200 is returned
    And the data is returned as a json object equal to
    """
      ```json
      {
        "hours": 90
      }
      ```
    """
  
  Scenario: Get a specific project Client by ID
    Given a GET request is made to /projects/:id/:client
    When the request is received
    Then a response status code of 200 is returned
    And the data is returned as a json object equal to
    """
      ```json
      {
        "client": "Blossom1"
      }
      ```
    """

  Scenario: Validate GET request with invalid ID
    Given the system knows about the database
    When a GET request is made to /projects/:id/
    Then a response status code of 400 is returned 