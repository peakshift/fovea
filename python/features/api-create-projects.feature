Feature: Create Projects API


  @api
  Scenario: Create a project
    When a "POST" request is made to "/projects" with the body
    """
      {
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then the response status code is "201"
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Project created."
      }
    """


  @validation @api
  Scenario: Validate "name" property is sent in request body
    When a "POST" request is made to "/projects" with the body
    """
      {
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then the response status code is "400"
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. 'name' is a required property"
      }
    """

  @validation @api
  Scenario: Validate "status" property is sent in request body
    When a "POST" request is made to "/projects" with the body
    """
      {
        "name": "Blossom",
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then the response status code is "400"
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. 'status' is a required property"
      }
    """

  @validation @api
  Scenario: Validate "description" property is sent in request body
    When a "POST" request is made to "/projects" with the body
    """
      {
        "name": "Blossom",
        "status": 0,
        "hours": 90,
        "client": "Blossom1"
      }
    """
    Then the response status code is "400"
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. 'description' is a required property"
      }
    """

  @validation @api
  Scenario: Validate "hours" property is sent in request body
    When a "POST" request is made to "/projects" with the body
    """
      {
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "client": "Blossom1"
      }
    """
    Then the response status code is "400"
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. 'hours' is a required property"
      }
    """

  @validation @api
  Scenario: Validate "client" property is sent in request body
    When a "POST" request is made to "/projects" with the body
    """
      {
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": 90
      }
    """
    Then the response status code is "400"
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. 'client' is a required property"
      }
    """

  @validation @api
  Scenario: Validate all properties are sent in request body
    When a "POST" request is made to "/projects" with the body
    """
      {}
    """
    Then the response status code is "400"
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. 'name' is a required property"
      }
    """

  @validation @api
  Scenario: Validate datatype for 'status' property
    When a "POST" request is made to "/projects" with the body
     """
      {
        "name": "Blossom",
        "status": "to-do",
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
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

  @validation @api
  Scenario: Validate datatype for 'hours' property
    When a "POST" request is made to "/projects" with the body
     """
      {
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": "90hrs",
        "client": "Blossom1"
      }
    """
    Then the response status code is "400" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. '90hrs' is not of type 'number'"
      }
    """

