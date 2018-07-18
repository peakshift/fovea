Feature: Projects Schema Validator


  Scenario: Valid if all fields are filled in
    Given a "POST" request is made with the body 
    """
      {
        "name": "blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    When it is passed to Validator    
    Then validation passes

  Scenario: Invalid if missing a field
    Given a "POST" request is made with the body 
    """
      {
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    When it is passed to Validator    
    Then validation fails

  Scenario: Invalid if incorrect datatype is used  
    Given a "POST" request is made with the body
    """
      {
        "name": "blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": "90hrs",
        "client": "Blossom1"
      }
    """ 
    When it is passed to Validator    
    Then validation fails

  Scenario: Invalid if missing multiple fields
    Given a "POST" request is made with the body 
    """
      {}
    """
    When it is passed to Validator
    Then validation fails