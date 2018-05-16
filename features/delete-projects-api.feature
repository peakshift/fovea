Feature: Delete Projects API
Only authorised persons can perform such actions

  Background: 
    Given the database contains the following
      | ID    | name        | status | description        | hours | client   | 
      | blsm  | Blossom     | 0      | blockchain project | 90    | Blossom1 |
      | zed   | ZipZap      | 0      | blockchain project | 120   | ZED      | 

    And I have authorisation

  Scenario: Delete a specific project by ID
    When a "DELETE" request is made to "/projects/:id"
    Then the response status code is "200" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Delete successful."
      }
    """
  

  @validation
  Scenario: Validate delete request ID
    When a "DELETE" request is made to "/projects/:id"
    Then the response status code is "400" 
    And the "Content-Type" header value is "application/json"
    And the response body is
    """
      {
        "msg": "Invalid request. 'id' not found."
      }
    """

