Feature: Update user using Put API

  Background:
    * url 'https://gorest.co.in'

    * def random_string =
    """
           function(s) {
                  var text = "";
                  var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                  for(var i=0; i<s; i++)
                          text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
                          return text;
           }
    """
    * def randomString = random_string(10)
    * print randomString

    * def requestPayload =
    """
   {
    "name": "sahil",
    "gender": "male",
    "status": "active"
   }
    """
    * set requestPayload.email = randomString + "@gmail.com"
    * print requestPayload.email

  Scenario: Update a user with given data
#  1st call: Create a user with post call
    Given path '/public/v1/users'
    And request requestPayload
    * def tokenID = '8e373fdfe1faf07192c1cc1ea29e3e3f2dea3cc44892ca833ef71e294acd7908'
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And print response
    And match $.data.id == '#present'

# fetch the user id from the post call response
  * def userId = $.data.id
  * print userId

# 2nd put call -- to update the user
    * def  requestPutPayload =
    """
   {
    "gender": "female",
    "status": "inactive"
   }
    """
    Given path '/public/v1/users/'+userId
    And request requestPutPayload
    * def tokenID = '8e373fdfe1faf07192c1cc1ea29e3e3f2dea3cc44892ca833ef71e294acd7908'
    And header Authorization = 'Bearer ' + tokenID
    When method put
    Then status 200
    And print response
    And match $.data.id == '#present'
    And match $.data.id == userId
    And match $.data.name == '#present'
    And match $.data.name == 'sahil'
    And match $.data.email ==  requestPayload.email

