Feature: Delete Projects API
Only authorised persons can perform such actions

  Background: 
    Given the database contains the following
      | ID    | name        | status | description        | hours | client   | 
      | blsm  | Blossom     | 0      | blockchain project | 90    | Blossom1 | 
    And I have authorisation

  Scenario: Delete a specific project by ID
    When a DELETE request is made for /projects/:id
    Then a response status code of 204 is returned

  Scenario: Delete a project with an unlisted ID
    When a DELETE request is made for /projects/:id
    Then a response status code of 400 is returned


