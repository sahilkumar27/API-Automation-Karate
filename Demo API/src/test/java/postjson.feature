Feature: Create user using post API

  Background:
    * url 'https://gorest.co.in'
    * def requestPayload = read('classpath:src/test/TestResources/payload/user.json')

  Scenario: Create a user with given data
    Given path '/public/v1/users'
    And request requestPayload
    * def tokenID = '8e373fdfe1faf07192c1cc1ea29e3e3f2dea3cc44892ca833ef71e294acd7908'
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201

    * print response

    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.email == 'sahil20@gmail.com'
    And match $.data.status == '#present'
