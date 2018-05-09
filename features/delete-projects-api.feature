Feature: Delete Projects API
Only authorised persons can perform such actions

  Background: 
    Given the database contains the following
      | ID    | name        | status | description        | hours | client   | 
      | blsm  | Blossom     | 0      | blockchain project | 90    | Blossom1 | 


  Scenario: Delete a specific project by ID
    Given the system knows about the database 
    And I have authorisation
    When a DELETE request is made for /projects/:id
    Then a response status code of 204 is returned
    And the json object is returned as NULL

  Scenario: Delete a project with an unlisted ID
    Given the system knows about the database 
    And I have authorisation
    When a DELETE request is made for /projects/:id
    Then a response status code of 400 is returned


