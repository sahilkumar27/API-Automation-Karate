Feature: Create user using post API

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
      # * requestPayload.email = randomString + "@gmail.com"
    * set requestPayload.email = randomString + "@gmail.com"
    * print requestPayload.email

  Scenario: Create a user with given data
    Given path '/public/v1/users'
    And request requestPayload
    * def tokenID = '8e373fdfe1faf07192c1cc1ea29e3e3f2dea3cc44892ca833ef71e294acd7908'
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And print response
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'sahil'
    And match $.data.email ==  requestPayload.email
