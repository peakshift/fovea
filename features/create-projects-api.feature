Feature: Create Projects API


  Scenario: Create a project
    Given a POST request in /projects with
    """
      {
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    When the request is received
    Then the response status code should be 201

  Scenario: Create a project with a missing Name field
    Given a POST request in /projects with
    """
      {
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    When the response is returned
    Then it should show a status code of 400

  Scenario: Create a project with a missing Status field
    Given a POST request in /projects with
    """
      {
        "name": "Blossom",
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    When the response is returned
    Then it should show a status code of 400

  Scenario: Create a project with a missing Description field
    Given a POST request in /projects with
    """
      {
        "name": "Blossom",
        "status": 0,
        "hours": 90,
        "client": "Blossom1"
      }
    """
    When the response is returned
    Then it should show a status code of 400

  Scenario: Create a project with a missing Hours field
    Given a POST request in /projects with
    """
      {
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "client": "Blossom1"
      }
    """
    When the response is returned
    Then it should show a status code of 400

  Scenario: Create a project with a missing Client field
    Given a POST request in /projects with
    """
      {
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
      }
    """
    When the response is returned
    Then it should show a status code of 400 

  Scenario: Create a project with no fields
    Given a POST request in /projects with
    """
      {}
    """
    When the response is returned
    Then it should show a status code of 400

  