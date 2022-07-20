# Getting started with Hunchentoot and Bootstrap 5

## Description
This is a small project to start with Hunchentoot as a web server and Bootstrap as framework for building responsive sites.

## Getting Started
### Clone the project
```
git clone https://github.com/juan-reynoso/bootstrap-5.git
```
### Load the project by quicklisp
```
CL-USER> (ql:quickload "bootstrap-5")
To load "bootstrap-5":
  Load 1 ASDF system:
    bootstrap-5
; Loading "bootstrap-5"
...........
("bootstrap-5")
```
### Use the package bootstrap-5
```
CL-USER> (in-package :bootstrap-5)
#<PACKAGE "BOOTSTRAP-5">
```
### Start the web server
```
BOOTSTRAP-5> (start-web-server)
#<EASY-ACCEPTOR (host *, port 8090)>
BOOTSTRAP-5>
```
### See the examples
* Index example

  http://localhost:8090/index.html

* Hunchentoot session example as login

   http://localhost:8090/login.html

* Jquery ajax example

   http://localhost:8090/ajax-example.html
