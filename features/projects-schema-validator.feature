Feature: Projects Schema Validator


Scenario: Valid if all fields filled in
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

Scenario: Invalid if missing Name field
  When data missing "name" is passed to Validator    
  """
    {
      "status": 0,
      "description": "blockchain project",
      "hours": 90,
      "client": "Blossom1"
    }
  """
  Then validation "fails"

Scenario: Invalid if missing Status field
  When data missing "status" is passed to Validator    
  """
    {
    	"name": "blossom",
      "description": "blockchain project",
      "hours": 90,
      "client": "Blossom1"
    }
  """
  Then validation "fails"

Scenario: Invalid if missing Description field
  When data missing "description" is passed to Validator    
  """
    {
    	"name": "blossom",
      "status": 0,
      "hours": 90,
      "client": "Blossom1"
    }
  """
  Then validation "fails"

Scenario: Invalid if missing Hours field
  When data missing "hours" is passed to Validator
  """
    {
    	"name": "blossom",
      "status": 0,
      "description": "blockchain project",
      "client": "Blossom1"
    }
  """
  Then validation "fails"

Scenario: Invalid if missing Client field
  When data missing "client" is passed to Validator    
  """
    {
    	"name": "blossom",
      "status": 0,
      "description": "blockchain project",
      "hours": 90,
    }
  """
  Then validation "fails"

Scenario: Invalid if incorrect datatype is used for Status field
  When an invalid datatype for "status" is passed to Validator
  """
    {
    	"name": "blossom",
      "status": "to-do",
      "description": "blockchain project",
      "hours": 90,
      "client": "Blossom1"
    }
  """
  Then validation "fails"


Scenario: Invalid if incorrect datatype is used for Hours field 
  When an invalid datatype for "hours" is passed to Validator 
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