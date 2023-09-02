Feature: GET API feature

  Scenario: get user details - positive scenario
    Given url 'http://gorest.co.in/public/v1/users'
    And path '4992662'
    When method GET
    Then status 200

  # Response is the already pre defined keyword, it is already available
    * print response
    * def jsonResponse = response
    * print jsonResponse

    * def actName = jsonResponse.data.name
    * def actId = jsonResponse.data.id
    * def actEmail = jsonResponse.data.email

    * print actName
    * print actId
    * print actEmail
    * match actName == 'Deeptimoy Kocchar'
    * match actId == 4992662
    * match actEmail == 'kocchar_deeptimoy@bruen-pacocha.example'


  Scenario: get user details - user not found - neagtive scenario
    Given url 'http://gorest.co.in/public/v1/users'
    And path '1'
    When method GET
    Then status 404