Feature: 
  Scenario: Create a project
    Given a POST request in /projects with
      ```
      {
        "name": "Blossom",
        "status": "to-do",
        "description": "blockchain project"
        "hours": "90",
        "client": "Blossom1"
      }
      ```
    When the request is received
    Then the response status code should be 201

  Scenario: Get all projects
    Given a GET request is made to /projects
    When the request is received
    And a response status of 200 is returned
    Then the data is returned as a json object equal to
      ```
      {
        "ID": "blsm",
        "name": "Blossom",
        "status": "to-do",
        "description": "blockchain project"
        "hours": "90",
        "client": "Blossom1"
      }
      ```
  
  Scenario: Get all projects with a specific status
    Give a GET request is made to /projects/:status
    When the request is received
    And a response status of 200 is returned
    Then the data is returned as a json object equal to 
      ```
      {
        "status": "0",
        "ID": "blsm"
      }
      ```
  
  Scenario: Get all projects from a specific client
    Given a GET request is made to /projects/:client
    When the request is received
    And a response status of 200 is returned
    Then the data is returned as a json object equal to
      ```
      {
        "client": "Blossom1",
        "ID": "blsm"
      }
      ```

  Scenario: Get a specific project by ID
    Given a GET request is made to /projects/:id
    When the request is received
    And a response status of 200 is returned
    Then the data is returned as a json object equal to
      ```
      { 
        "ID": "blsm",
        "name": "Blossom",
        "status": "0",
        "description": "blockchain project"
        "hours": "90",
        "client": "Blossom1"
      }
      ```
  
  Scenario: Get a specific project Name by ID
    Given a GET request is made to /projects/:id/:name
    When the request is received
    And a response status of 200 is returned
    Then the data is returned as a json object equal to
      ```
      {
        "ID": "blsm",
        "name": "Blossom"
      }
      ```
      
  Scenario: Get a specific project Status by ID
    Given a GET request is made to /projects/:id/:status
    When the data is accessed
    Then the data is returned as a json object equal to
      ```
      {
        "ID": "blsm",
        "status": "0"
      }
      ```
 
  Scenario: Get a specific project Description by ID
    Given a GET request is made to /projects/:id/:description
    When the request is received
    And a response status of 200 is returned
    Then the data is returned as a json object equal to
      ```
      {
        "ID":"blsm",
        "description": "blockchain project"
      }
      ```
  
  Scenario: Get a specific project Hours by ID
    Given a GET request is made to /projects/:id/:hours
    When the request is received
    And a response status of 200 is returned
    Then the data is returned as a json object equal to
      ```
      {
        "ID": "blsm",
        "hours": "90"
      }
      ```
  
  Scenario: Get a specific project Clientname by ID
    Given a GET request is made to /projects/:id/:client
    When the request is received
    And a response status of 200 is returned
    Then the data is returned as a json object equal to
      ```
      {
        "ID": "blsm"
        "client": "Blossom1"
      }
      ```

  Scenario: Update a specific project by ID
    Given a PUT request is made to /projects/:id/
    When the request is recieved
    And a response status of 200 is returned
    Then the uppdate is displayed in the returned json object

  Scenario: Update a specific project Name by ID
    Given a PUT request is made to /projects/:id/:name
    When the request is recieved
    And a response status of 200 is returned
    Then the new name is displayed in the returned json object

  Scenario: Update a specific project Status by ID
    Given a PUT request is made to /projects/:id/:status
    When request is received
    And a response status of 200 is returned
    Then the project status is changed in the returned json object

  Scenario: Update a specific project Description by ID
    Given a PUT request is made to /projects/:id/:description
    When the request is recieved
    And a response status of 200 is returned 
    Then the new project description is displayed in the returned json object

  Scenario: Update a specific project Hours by ID
    Given a PUT request is made to /projects/:id/:hours
    When the request is recived 
    And a response status of 200 is returned
    Then the project hours is changed in the returned json object
    And the progress bar is recalculated

  Scenario: Update a specific project Client by ID
    Given a PUT request is made to /projects/:id/:client
    When the request is received
    And a response status of 200 is returned
    Then the new client name is displayed in the returned json object

  Scenario: Update multiple properties of a specific project
    Given a PUT request is made to /projects/:id 
    When the request is recieved 
    And a response status of 200 is returned
    Then the updated fields will be displayed in the returned json object

  Scenario: Delete a specific project by ID
    Given a DELETE request is made for /projects/:id
    When the request is processed
    Then the json object is returned as NULL
    And a status code of 204 is returned



  
  
