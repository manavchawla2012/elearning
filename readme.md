# Elearning Website
Here we are creating a elearing website. 

## Steps to Install 
1) Install Pipenv ``sudo pip3 install pipenv``
2) Clone the project ``git clone https://github.com/manavchawla2012/elearning.git``
3) Enter directory and Create virtual environment using pipenv
4) Activate your virtual environment and type ``pipenv install or pipenv sync``
5) Try running the project by typing ``python3 manage.py runserver #portnumber``

##Setting up Postgres Database
1) Install Postgres Server
2) Create a user for the database and create a new database with name ``elearn``
3) Import tables using command ``psql -h hostname -d databasename -U username -f {SQL script file name}``


## Project Version
* 1.0) User Login Page
* 1.1) Login page for Tutor
* 1.2) Signup page for User
* 1.3) Url Shortner

## Url Shortner
* Create a url with uri by clicking Filters
* Click button ``Get Short Url``
* You will get a short url. Which will be valid for 20 seconds.
* Time can be increased by changing values in `views file` of `Elearing` app
* After link expiry you will get a JSON page with a message that ``Link is Expired``

***
### Method behind Url Shortner:
* Sending Current URL via ajax to Controller
* Extracting features from url such as path and parameters
* Converting string of `path + parameters` to md5 and storing in database and setting up expiry time
* And creating a link like ``/url/MD5`` for the user to share with customers
* When customer access the link he gets redirected to the actual url which is recreated via backend.