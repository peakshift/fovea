Feature: Projects Schema Validator


Scenario: Valid if all fields filled in
    When a "POST" request is made to "/projects" with the body 
    """
      {
      	"name": "blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then validation is successful

Scenario: Invalid if missing Name field
    When a "POST" request is made to "/projects" with the body 
    """
      {
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then an error is thrown

Scenario: Invalid if missing Status field
    When a "POST" request is made to "/projects" with the body 
    """
      {
      	"name": "blossom",
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then an error is thrown

Scenario: Invalid if missing Description field
    When a "POST" request is made to "/projects" with the body 
    """
      {
      	"name": "blossom",
        "status": 0,
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then an error is thrown

Scenario: Invalid if missing Hours field
    When a "POST" request is made to "/projects" with the body 
    """
      {
      	"name": "blossom",
        "status": 0,
        "description": "blockchain project",
        "client": "Blossom1"
      }
    """
    Then an error is thrown

Scenario: Invalid if missing Client field
    When a "POST" request is made to "/projects" with the body 
    """
      {
      	"name": "blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
      }
    """
    Then an error is thrown

Scenario: Invalid if incorrect datatype is used for Status field
    When a "POST" request is made to "/projects" with the body 
    """
      {
      	"name": "blossom",
        "status": "to-do",
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then an error is thrown


Scenario: Invalid if incorrect datatype is used for Hours field 
    When a "POST" request is made to "/projects" with the body 
    """
      {
      	"name": "blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": "90hrs",
        "client": "Blossom1"
      }
    """
    Then an error is thrown

Scenario: Invalid if missing multiple fields
    When a "POST" request is made to "/projects" with the body 
    """
      {}
    """
    Then an error is thrown