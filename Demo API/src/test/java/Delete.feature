Feature: Delete user using delete API

#  Background is just like we shave some preconditions which will be executed before each and every scenario
  Background:
#    now this is a base url`
    * url 'https://gorest.co.in'

#    this karate function give the random string, here pattern.charAt gives character and Math.floor -> select random character from the pattern and Math.random gives the random value between 0 & 1
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

  Scenario: Delete a user with given user id

# 1. Create a user using POST Call
    Given path '/public/v1/users'
    And request requestPayload
    * def tokenID = '8e373fdfe1faf07192c1cc1ea29e3e3f2dea3cc44892ca833ef71e294acd7908'
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And print response
    And match $.data.id == '#present'

#  fetch the user id from the response
    * def userId = $.data.id
    * print userId


#2. Delete the same user
    Given path '/public/v1/users/' + userId
    And request requestPayload
    * def tokenID = '8e373fdfe1faf07192c1cc1ea29e3e3f2dea3cc44892ca833ef71e294acd7908'
    And header Authorization = 'Bearer ' + tokenID
    When method delete
    Then status 204
    And print response


#3. get the same user with user id
    Given url 'http://gorest.co.in/public/v1/users/' + userId
    When method GET
    Then status 404
    And match $.data.message == 'Resource not found'