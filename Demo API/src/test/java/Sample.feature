Feature: print hello world feature

  Scenario: Hello World scenario
    * print 'hello world'
    * print 'Hello Sahil automation labs'

  Scenario: declare and print variables
    * def balance = 200
    * def fee = 20
    * def tax = 10
    * def other = 35
    * print 'total amount ->' + (balance + fee + tax)

  Scenario: Calculator scenario
    * def a = 200
    * def b = 10
    * print 'mul ->' +  (a * b)
