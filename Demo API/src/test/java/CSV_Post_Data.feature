Feature: Create user using post API

#  Background is just like we shave some preconditions which will be executed before each and every scenario
  Background:
#    now this is a base url
    * url 'https://gorest.co.in'

  Scenario Outline: Create a user with given data
    * def name_csv = '<Name>'
    * def email_csv = '<Email>'
    * print "name from csv", name_csv
    * print "email from csv", email_csv
    * def requestPayload =
    """
   {
    "name": "#(name_csv)",
    "email": "#(email_csv)",
    "gender": "male",
    "status": "active"
  }
    """

#    and this is service url means "path"
    Given path '/public/v1/users'
    And request requestPayload
    * def tokenID = '8e373fdfe1faf07192c1cc1ea29e3e3f2dea3cc44892ca833ef71e294acd7908'
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201

#    '#present' (#) - this is an existing matching keyword to validate or to write the assertion or any specific value is available present or not
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'Sahil'
    And match $.data.email == 'sahil34@testing.com'
#    And match $.data.status == '#present'

  Examples:
    |read('KarateLogin.csv')|