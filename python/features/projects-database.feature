Feature: Projects Mongodb Connection

#needs to be written up properly
"""
-would need to connect to the database
-would need to ensure credentials are correct
-search for valid and invalid records
-access valid and invalid tables
"""

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
