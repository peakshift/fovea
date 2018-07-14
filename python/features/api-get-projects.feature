Feature: Get Projects API

  
  # Background: 
  #   Given the database contains the following
  #     | ID    | name        | status | description        | hours | client   | 
  #     | blsm  | Blossom     | 0      | blockchain project | 90    | Blossom1 | 
  #     | zed   | ZipZap      | 0      | blockchain project | 120   | ZED      | 


  @wip @api
  Scenario: Get all projects
    Given the system knows about the database
    When a "GET" request is made to "/projects"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is 
    """
      {
        "data":[
          {
           "client": "Blossom1",
            "ID": "blsm",
            "name": "Blossom",
            "status": 0,
            "description": "blockchain project",
            "hours": 90
          },       
          {
            "ID": "zed",
            "name": "ZipZap",
            "status": 0,
            "description": "blockchain project",
            "hours": 120,
            "client": "ZED"
          }
        ]
      }
    """
  
  @wip @api
  Scenario: Get all projects with a specific status
    Given the system knows about the database
    When a "GET" request is made to "/projects/0"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "data":[
          {
           "client": "Blossom1",
            "ID": "blsm",
            "name": "Blossom",
            "status": 0,
            "description": "blockchain project",
            "hours": 90
          },       
          {
            "ID": "zed",
            "name": "ZipZap",
            "status": 0,
            "description": "blockchain project",
            "hours": 120,
            "client": "ZED"
          }
        ]
      }
    """
  
  @wip @api
  Scenario: Get all projects from a specific client
    Given the system knows about the database
    When a "GET" request is made "to /projects/Blossom1"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "data":[
          {
           "client": "Blossom1",
            "ID": "blsm",
            "name": "Blossom",
            "status": 0,
            "description": "blockchain project",
            "hours": 90
          }
        ]
      }
    """

  @wip @api
  Scenario: Get a specific project by ID
    Given the system knows about the database
    When a "GET" request is made to "/projects/123"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "data":
          {
           "client": "Blossom1",
            "ID": "blsm",
            "name": "Blossom",
            "status": 0,
            "description": "blockchain project",
            "hours": 90
          }
      }
    """
  
  @wip @api
  Scenario: Get a specific project Name by ID
    Given the system knows about the database
    When a "GET" request is made to "/projects/123/name"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "data":
          {
            "name": "Blossom"
          }
      }
    """
  
  @wip @api   
  Scenario: Get a specific project Status by ID
    Given the system knows about the database
    When a "GET" request is made to "/projects/123/status"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "data":
          {
            "status": 0
          }
      }
    """
  
  @wip @api
  Scenario: Get a specific project Description by ID
    Given the system knows about the database
    When a "GET" request is made to "/projects/123/description"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "data":
          {
            "description": "blockchain project"
          }
      }
    """
  
  @wip @api
  Scenario: Get a specific project Hours by ID
    Given the system knows about the database
    When a "GET" request is made to "/projects/123/hours"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "data":
          {
            "hours": 90
          }
      }
    """
  
  @wip @api
  Scenario: Get a specific project Client by ID
    Given the system knows about the database
    When a "GET" request is made to "/projects/123/client"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "data":
          {
           "client": "Blossom1"
          }
      }
    """

  @wip @validation @api
  Scenario: Validate get request by 'ID'
    Given the system knows about the database
    When a "GET" request is made to "/projects/120"
    Then the response status code is "400"  
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. 'id' not found."
      }
    """

  @wip @validation @api
  Scenario: Validate get request by 'client'
    Given the system knows about the database
    When a "GET" request is made to "/projects?filters[client]=fovea"
    Then the response status code is "400"  
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. 'client' not found."
      }
    """

  @wip @validation @api
  Scenario: Validate get request by 'status'
    Given the system knows about the database
    When a "GET" request is made to "/projects?filters[status]=3"
    Then the response status code is "400"  
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. 'status' not found."
      }
    """