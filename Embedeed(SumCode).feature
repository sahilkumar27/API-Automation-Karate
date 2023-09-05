Feature: Example of embedded expersion in krate using SUM of two number
  Scenario: Calculate the sum of two numbers using embedded expressions
    * def a = 10;
    * def b = 20;
    * def sum = a + b
    Given print 'The sum of ${a} and ${b} is ${sum}'
    * print sum
    Then match sum == 30