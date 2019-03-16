# Introduction

a simple REST-based JSON API enabling you to thoroughly check and verify email addresses right at the point of entry into your system. please read the API Documentation [here](https://documenter.getpostman.com/view/3896445/S17nUWHv). 



# Error Codes
status: 200 email is exist.

status: 404 not found. email doesn't exist

# Rate limit
5 requests for email checking per minute, for an ip address.



# examples

    curl --location --request GET "https://emailverifierinternsvalley.herokuapp.com/check?email=amr.zohdie@gmail.com"
.  
    
    response:
            status: 200 － OK
            {
              "message": "email amr.zohdie@gmail.com exist"
            }      
