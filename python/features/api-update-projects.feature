Feature: Update Projects API

   
  # Background: 
  #   Given the database contains the following
  #     | ID    | name        | status | description        | hours | client   | 
  #     | blsm  | Blossom     | 0      | blockchain project | 90    | Blossom1 | 
  #     | zed   | ZipZap      | 0      | blockchain project | 120   | ZED      | 


  @wip @api
	Scenario: Update multiple properties of a specific project by ID
    Given the system knows about the database
    When a "PUT" request is made to "/projects/200" with the body
    """
      {
        "status": 1,
        "hours": 100
      }
    """
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Update successful."
      }
    """

  @wip @api
  Scenario: Update a specific project 'name' by ID
    Given the system knows about the database
    When a "PUT" request is made to "/projects/200/name" with the body
    """
      {
        "name": "Blossom Project"
      }
    """
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Update successful."
      }
    """

  @wip @api
  Scenario: Update a specific project 'status' by ID
    Given the system knows about the database
    When a "PUT" request is made to "/projects/200/status" with the body
    """
      {
        "status": 1
      }
    """
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Update successful."
      }
    """

  @wip @api
  Scenario: Update a specific project 'description' by ID
    Given the system knows about the database
    When a "PUT" request is made to "/projects/200/description" with the body
    """
      {
        "description": "blockchain"
      }
    """
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Update successful."
      }
    """

  @wip @api
  Scenario: Update a specific project 'hours' by ID
    Given the system knows about the database
    When a "PUT" request is made to "/projects/200/hours"  with the body
    """
      {
        "hours": 100
      }
    """
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Update successful."
      }
    """

  @wip @api
  Scenario: Update a specific project 'client' by ID
    Given the system knows about the database
    When a "PUT" request is made to "/projects/200/clients" with the body
    """
      {
        "client": "Blossom"
      }
    """
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Update successful."
      }
    """

  @wip @validation @api
  Scenario: Validate 'status' update request datatype
    Given the system knows about the database 
    When a "PUT" request is made to "/projects/200/status" with the body
    """
      {
        "status": to-do
      }
    """
    Then the response status code is "400" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. 'to-do' is not one of [0, 1, 2]"
      }
    """

  @wip @validation @api
  Scenario: Validate 'hours' update request datatype
    Given the system knows about the database
    When a "PUT" request is made to "/projects/200/hours" with the body
     """
      {
        "hours": :"100hrs"
      }
    """
    Then the response status code is "400" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. '100hrs' is not of type 'number'"
      }
    """