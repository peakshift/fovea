Feature: Projects Database Connection


  Scenario: Insert document into collection
    Given inputdata is
    """
      {
        "name": "Blossom",
        "status": 0,
        "description": "blockchain project",
        "hours": 90,
        "client": "Blossom1"
      }
    """
    When the insert("test", inputdata) method is invoked
    Then the ID of the new document is returned

  Scenario: Retrieve all documents from a collection
    When the get("test") method is invoked
    Then all the documents in the collection is returned

  Scenario: Update a document in the collection
    Given inputdata is
    """
      {
        "status": 1
      }
    """
    And the document ID is "1"
    When the update("test", inputdata, 1) method is invoked
    Then the document is updated

  Scenario: Retrieve a document from a collection
    Given the document ID is "1"
    When the getbyid("test", 1) method is invoked
    Then the document is returned

  Scenario: Delete a document in the collection
    Given the document ID is "1"
    When the delete("test", 1) method is invoked
    Then the document is deleted

  Scenario: Failure to update a document in the collection
    Given inputdata is
    """
      {
        "status": 1
      }
    """
    And the document ID is "100"
    When the update("test", inputdata, 100) method is invoked
    Then the request fails

  Scenario: Failure to retrieve a document from a collection
    Given the document ID is "100"
    When the getbyid("test", 100) method is invoked
    Then the request returns null

  Scenario: Failure to delete an unknown document in the collection
    Given the document ID is "100"
    When the delete("test", 100) method is invoked
    Then the request fails
