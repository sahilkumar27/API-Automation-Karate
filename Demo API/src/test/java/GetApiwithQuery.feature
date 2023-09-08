# GET API Call with Query Parameters ( http://gorest.co.in/public/v1/users?status=active ) here "?" is a query parameter
#  https://gorest.co.in/publivc/v1/users?status=active&gender=male   so here the query parameter = /users?status=active=&gender=male

Feature: GET API with Query Parameters
  Scenario: get all active users
    * def query = {status:'active', gender: 'female'}
    Given url 'http://gorest.co.in/public/v1/users'
    And params query
    When method GET
    Then status 200
    * print response

  Scenario: get all active users
    * def query = {status:'active', gender: 'female'}
    Given url 'http://gorest.co.in/public/v1/users'
    And params query
    When method GET
    Then status 200
    * def jsonResponse = response
    * print jsonResponse
    * def userCount = jsonResponse.data.length
    * print userCount
    * match userCount == 10

