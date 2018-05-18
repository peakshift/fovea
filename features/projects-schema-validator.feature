Feature: Projects Schema Validator


Background:
  Given the schema exists
  """
    {
      "id": "/projects",
      "title": "Projects",
      "type": "object",
      "properties": {
          "name": {
              "type": "string"
          },
          "status": {
              "enum": [ 0, 1, 2 ] 

          },
          "description": {
              "type": "string"
          },
          "hours": {
              "type": "number"
          },
          "client": {
              "type": "string"
          }
      },
      "required": ["name", "status", "hours", "description", "client"]
    }
  """


  Scenario: Valid if all fields are filled in
    When data is passed to Validator 
    """
      {
        "name": "blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then validation "passes"

  Scenario: Invalid if missing a field
    When data with a missing field is passed to Validator    
    """
      {
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then validation "fails"

  Scenario: Invalid if incorrect datatype is used  
    When a field with an invalid datatype is passed to Validator 
    """
      {
        "name": "blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": "90hrs",
        "client": "Blossom1"
      }
    """
    Then validation "fails"

  Scenario: Invalid if missing multiple fields
    When no data is passed to Validator 
    """
      {}
    """
    Then validation "fails"