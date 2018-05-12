Feature: Projects Schema Validator


Scenario: Valid if all fields filled in
    When data missing name is passed to Validator
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
    When data missing name is passed to Validator
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
    When data missing name is passed to Validator
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
    When data missing name is passed to Validator
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
    When data missing name is passed to Validator
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
    When data missing name is passed to Validator
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
    When data missing name is passed to Validator
    """
      {
      	"name": "blossom",
        "status": "0",
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then an error is thrown


Scenario: Invalid if incorrect datatype is used for Hours field 
    When data missing name is passed to Validator
    """
      {
      	"name": "blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": "90",
        "client": "Blossom1"
      }
    """
    Then an error is thrown