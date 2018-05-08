Feature: 
  Scenario: Create a project
    Given a POST request in /projects with
      ```
      {...}
      ```
    When the data is submitted
    Then the data is stored

  Scenario: Get all projects
    Given a GET request is made to /projects
    When the data is accessed
    Then the data is returned as a json object equal to
      ```
      {...}
      ```
  
  Scenario: Get all projects with a specific status
    Give a GET request is made to /projects/:status
    When the data is accessed
    Then the data is returned as a json object equal to 
      ```
      {...}
      ```
  
  Scenario: Get all projects from a specific client
    Given a GET request is made to /projects/:client
    When the data is accessed
    Then the data is returned as a json object equal to
      ```
      {...}
      ```

  Scenario: Get a specific project by ID
    Given a GET request is made to /projects/:id
    When the data is accessed
    Then the data is returned as a json object equal to
      ```
      {...}
      ```
  
  Scenario: Get a specific project Name by ID
    Given a GET request is made to /projects/:id/:name
    When the data is accessed
    Then the data is returned as a json object equal to
      ```
      {...}
      ```
      
  Scenario: Get a specific project Status by ID
    Given a GET request is made to /projects/:id/:status
    When the data is accessed
    Then the data is returned as a json object equal to
      ```
      {...}
      ```
 
  Scenario: Get a specific project Description by ID
    Given a GET request is made to /projects/:id/:description
    When the data is accessed
    Then the data is returned as a json object equal to
      ```
      {...}
      ```
  
  Scenario: Get a specific project Hours by ID
    Given a GET request is made to /projects/:id/:hours
    When the data is accessed
    Then the data is returned as a json object equal to
      ```
      {...}
      ```
  
  Scenario: Get a specific project Clientname by ID
    Given a GET request is made to /projects/:id/:client
    When the data is accessed
    Then the data is returned as a json object equal to
      ```
      {...}
      ```

  Scenario: Update a specific project by ID
    Given a PUT request is made to /projects/:id/
    When the data is updated
    Then ...

  Scenario: Update a specific project Name by ID
  Given a PUT request is made to /projects/:id/:name
    When the database is updated
    Then the new name is displayed in the client dashboard

  Scenario: Update a specific project Status by ID
  Given a PUT request is made to /projects/:id/:status
    When the database is updated
    Then the project status is changed in the client dashboard
    And ...

  Scenario: Update a specific project Description by ID
    Given a PUT request is made to /projects/:id/:description
    When the database is updated
    Then the new project description is displayed in the client dashboard

  Scenario: Update a specific project Hours by ID
    Given a PUT request is made to /projects/:id/:hours
    When the database is updated
    Then the project hours is changed in the client dashboard
    And the progress bar is recalculated

  Scenario: Update a specific project Client by ID
    Given a PUT request is made to /projects/:id/:client
    When the database is updated
    Then the new client name is displayed in the client dashboard

  Scenario: Update multiple properties of a specific project
    Given a PUT request is made to /projects/:id ...

  Scenario: Delete a specific project by ID
    Given a DELETE request is made for /projects/:id
    When the request is processed
    Then the json object is returned as NULL
    And the data is removed from the database



  
  
