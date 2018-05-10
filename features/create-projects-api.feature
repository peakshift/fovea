Feature: Create Projects API

  Background:
    Given the database contains the following
        | ID    | name        | status | description        | hours | client   | 
  
  Scenario: Create a project
    When a POST request is made to /projects with
    """
      {
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then a response status code of 201 is returned
    And the "Content-Type" header is "application/json"

  Scenario: Deny request to create a project with a missing Name field
    When a POST request is made to /projects with
    """
      {
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then a response status code of 400 is returned
    And the "Content-Type" header is "application/json"

  Scenario: Deny request to create a project with a missing Status field
    When a POST request is made to /projects with
    """
      {
        "name": "Blossom",
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then a response status code of 400 is returned
    And the "Content-Type" header is "application/json"

  Scenario: Deny request to create a project with a missing Description field
    When a POST request is made to /projects with
    """
      {
        "name": "Blossom",
        "status": 0,
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then a response status code of 400 is returned
    And the "Content-Type" header is "application/json"

  Scenario: Deny request to create a project with a missing Hours field
    When a POST request is made to /projects with
    """
      {
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "client": "Blossom1"
      }
    """
    Then a response status code of 400 is returned
    And the "Content-Type" header is "application/json"

  Scenario: Deny request to create a project with a missing Client field
    When a POST request is made to /projects with
    """
      {
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
      }
    """
    Then a response status code of 400 is returned
    And the "Content-Type" header is "application/json" 

  Scenario: Deny request to create a project with no fields
    When a POST request is made to /projects with
    """
      {}
    """
    Then a response status code of 400 is returned
    And the "Content-Type" header is "application/json"

  