Feature: Projects Mongodb Connection

Background: Given the database connection has started

Scenario: Connection started 
When a request is made to the database
Then the database can be accessed

Scenario: Connection has not started
When a request is made to the database
Then an error is thrown

Scenario: Credentials are valid
When valid credentials are used
Then the database can be accessed

Scenario: Credentials are invalid
When an invalid credential is used
Then an error is thrown

Scenario: Accessing existing database
Given the connection exists
When the database is accessed
Then the data is returned

Scenario: Accessing a database that does not exist
Given a connection exists
When the database is accessed
Then it is created

Scenario: Accessing existing Collection
Given the database exists
When the search is performed
Then the data is returned

Scenario: Accessing a collection that does not exist
Given the database exists
When the search is performed
Then an error is thrown

Scenario: Accessing existing data
Given the collection exists
When a search is performed
Then the data is returned

Scenario: Accessing data that does not exist
Given the collection exists
When a search is performed 
Then an error is thrown