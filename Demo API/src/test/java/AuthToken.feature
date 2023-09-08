Feature: GET API feature
  Scenario: get user details
    * def tokenID = '8e373fdfe1faf07192c1cc1ea29e3e3f2dea3cc44892ca833ef71e294acd7908'
    * print tokenID
    Given header Authorization = 'Bearer '+ tokenID
    Given url 'http://gorest.co.in/public/v1/users'
    And path '5104367'
    When method GET
    Then status 200