Feature: 
  Scenario: Create a project
    Given a POST request in /projects with
      ```
      {
        "name": "Blossom",
        "status": "0",
        "description": "blockchain project"
        "hours": "90",
        "client": "Blossom1"
      }
      ```
    When the request is received
    Then the response status code should be 201

  Scenario: Create a project with missing fields
    Given a POST request in /projects with
      ```
      {
        "name": "Blossom",
        "status": "0",
        "description": "blockchain project"
      }
      ```
    When the request is received
    Then the response status code should be 400

  Scenario: Create a project with no fields
    Given a POST request in /projects with
      ```
      {...}
      ```
    When the request is received
    Then the response status code should be 400

  Scenario: Get all projects
    Given GET request is made to /projects
    When the request is received
    Then a response status of 200 is returned
    And the data is returned as a json object equal to
      ```
      [
        {
          "ID": "blsm",
          "name": "Blossom",
          "status": "0",
          "description": "blockchain project"
          "hours": "90",
          "client": "Blossom1"
        }
      ]
      ```
  
  Scenario: Get all projects with a specific status
    Give a GET request is made to /projects/:status
    When the request is received
    Then a response status of 200 is returned
    And the data is returned as a json object equal to 
      ```
      [
        {
          "ID": "blsm",
          "name": "Blossom",
          "status": "0",
          "description": "blockchain project"
          "hours": "90",
          "client": "Blossom1"
        }
      ]
      ```
  
  Scenario: Get all projects from a specific client
    Given a GET request is made to /projects/:client
    When the request is received
    Then a response status of 200 is returned
    And the data is returned as a json object equal to
      ```
      [
        {
          "ID": "blsm",
          "name": "Blossom",
          "status": "0",
          "description": "blockchain project"
          "hours": "90",
          "client": "Blossom1"
        }
      ]
      ```

  Scenario: Get a specific project by ID
    Given a GET request is made to /projects/:id
    When the request is received
    Then a response status of 200 is returned
    And the data is returned as a json object equal to
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
    Then a response status of 200 is returned
    And the data is returned as a json object equal to
      ```
      {
        "name": "Blossom"
      }
      ```
      
  Scenario: Get a specific project Status by ID
    Given a GET request is made to /projects/:id/:status
    When the request is received
    Then a response status of 200 is returned
    And the data is returned as a json object equal to
      ```
      {
        "status": "0"
      }
      ```
 
  Scenario: Get a specific project Description by ID
    Given a GET request is made to /projects/:id/:description
    When the request is received
    Then a response status of 200 is returned
    And the data is returned as a json object equal to
      ```
      {
        "description": "blockchain project"
      }
      ```
  
  Scenario: Get a specific project Hours by ID
    Given a GET request is made to /projects/:id/:hours
    When the request is received
    Then a response status of 200 is returned
    And the data is returned as a json object equal to
      ```
      {
        "hours": "90"
      }
      ```
  
  Scenario: Get a specific project Clientname by ID
    Given a GET request is made to /projects/:id/:client
    When the request is received
    Then a response status of 200 is returned
    And the data is returned as a json object equal to
      ```
      {
        "client": "Blossom1"
      }
      ```

  Scenario: Get a specific project by an invalid ID
    Given a GET request is made to /projects/:id/
    When the request is received
    Then a response status of 400 is returned

  Scenario: Update a specific project by ID
    Given a PUT request is made to /projects/:id/
    When the request is recieved
    Then a response status of 200 is returned
    And the uppdate is displayed in the returned json object

  Scenario: Update a specific project Name by ID
    Given a PUT request is made to /projects/:id/:name
    When the request is recieved
    Then a response status of 200 is returned
    And the new name is displayed in the returned json object

  Scenario: Update a specific project Status by ID
    Given a PUT request is made to /projects/:id/:status
    When request is received
    Then a response status of 200 is returned
    And the project status is changed in the returned json object

  Scenario: Update a specific project Description by ID
    Given a PUT request is made to /projects/:id/:description
    When the request is recieved
    Then a response status of 200 is returned 
    And the new project description is displayed in the returned json object

  Scenario: Update a specific project Hours by ID
    Given a PUT request is made to /projects/:id/:hours
    When the request is recived 
    Then a response status of 200 is returned
    And the project hours is changed in the returned json object
    And the progress bar is recalculated

  Scenario: Update a specific project Client by ID
    Given a PUT request is made to /projects/:id/:client
    When the request is received
    Then a response status of 200 is returned
    And the new client name is displayed in the returned json object

  Scenario: Update multiple properties of a specific project
    Given a PUT request is made to /projects/:id 
    When the request is recieved 
    Then a response status of 200 is returned
    And the updated fields will be displayed in the returned json object

  Scenario: Update a specific project field by ID with invalid data
    Given a PUT request is made to /projects/:id/
    When the request is received
    Then a response status of 400 is returned

  Scenario: Delete a specific project by ID
    Given a DELETE request is made for /projects/:id
    When the request is processed
    Then a status code of 204 is returned
    And the json object is returned as NULL



  
  
