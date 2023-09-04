# How to pass request headers in karate framework
#  There is some error in authorization, so this is just an example of get otp when we pass the bearer token on that

Feature: GET API headers feature

  Scenario: pass the user request with headers_Part1
    Given header Content-Type = 'text/html; charset=UTF-8'
    And header Accept-Encoding = 'gzip, deflate, br'
    And header Connection = 'Keep-Alive'
    And header Expect = '100-continue'
    And header User-Agent = 'Chrome/116.0.0.0'
    And header Authorization = '8e373fdfe1faf07192c1cc1ea29e3e3f2dea3cc44892ca833ef71e294acd7908'

    When url 'http://gorest.co.in/public/v1/users'
    And path '4992582'
    When method GET
    Then status 200
    * print response


# Note: Whenever you're facing problem Error-404 then change the path. Path will change from postman of the GET-'URL' call.
  Scenario: pass the user request with headers_Part2
    * def request_headers = {Connection: 'Keep-Alive', Content-Type: 'text/html;charset=UTF-8', "User-Agent": 'Chrome/116.0.0.0 Safari/537.36'}
    Given headers request_headers
    When url 'http://gorest.co.in/public/v1/users'
    And path '4992582'
    When method GET
    Then status 200
    * print response


  Scenario: pass the user request with headers_Part3
    * def request_headers = {Connection: 'Keep-Alive', Content-Type: 'text/html;charset=UTF-8', "User-Agent": 'Chrome/116.0.0.0 Safari/537.36'}
    When url 'http://gorest.co.in/public/v1/users'
    And path '4992582'
    When method GET
    Then status 200
    * print response