Feature: Read, Create, Update and Delete request

Scenario: Get Bookings
Given url 'https://restful-booker.herokuapp.com/booking'
When method GET
Then status 200
And print response

Scenario: Create, update and delete booking
Given header Accept = 'application/json'
Given url 'https://restful-booker.herokuapp.com/auth'
And request {"username":"admin","password":"password123"}
When method POST
Then status 200
And print response
And def token_number = response.token
And print token_number


Given header Accept = 'application/json'
Given url 'https://restful-booker.herokuapp.com/booking'
And request {"firstname" : "Test","lastname" : "User","totalprice" : 128,"depositpaid" : true,"bookingdates" : {"checkin" : "2018-01-01","checkout" :"2019-01-01"},"additionalneeds" : "Breakfast" }
When method POST
Then status 200
And print response
And def bookid = response.bookingid
And print bookid


Given header Content-Type = 'application/json'
Given header Accept = 'application/json'
Given url 'https://restful-booker.herokuapp.com/booking/'+bookid
And cookie token = token_number
And request {"firstname" : "Test","lastname" : "User","totalprice" : 128,"depositpaid" : true,"bookingdates" : {"checkin" : "2018-01-01","checkout" :"2019-01-01"},"additionalneeds" : "Breakfast" }
When method PUT
Then status 200
And print response

Given header Accept = 'application/json'
Given url 'https://restful-booker.herokuapp.com/booking/'+bookid
And cookie token = token_number
When method DELETE
Then status 201





