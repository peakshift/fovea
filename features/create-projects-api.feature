Feature: Create Projects API

  Background:
    Given the database contains the following
        | ID    | name        | status | description        | hours | client   | 
  
  Scenario: Create a project
    When a POST request is made in /projects with
    """
      {
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then the response status code should be 201

  Scenario: Create a project with a missing Name field
    When a POST request is made in /projects with
    """
      {
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then the response status code should be 400

  Scenario: Create a project with a missing Status field
    When a POST request in /projects with
    """
      {
        "name": "Blossom",
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then the response status code should be 400

  Scenario: Create a project with a missing Description field
    When a POST request in /projects with
    """
      {
        "name": "Blossom",
        "status": 0,
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then the response status code should be 400

  Scenario: Create a project with a missing Hours field
    When a POST request in /projects with
    """
      {
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "client": "Blossom1"
      }
    """
    Then the response status code should be 400

  Scenario: Create a project with a missing Client field
    When a POST request in /projects with
    """
      {
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
      }
    """
    Then the response status code should be 400 

  Scenario: Create a project with no fields
    When a POST request in /projects with
    """
      {}
    """
    Then the response status code should be 400

  