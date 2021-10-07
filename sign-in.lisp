(in-package #:bootstrap-5)

(defun sign-in ()
  "If the password is ok log in the user and display session information, otherwise
display a message that the password is wrong."
  (let ((password (post-parameter "password"))) ; it gets parameter called password
    (if (string= password "a-secret")
	(progn
	  (login)
	  (with-html "Logged in"
	    (<:div :class "container mt-3"
		   (<:h1 :class "text-success"
			 "Welcome, you have logged in.")
		   (<:h3 :class "mt-5 text-info"
			 "Session information")
		   (<:p
		    (<:span :class "fw-bold"
			    "User Id it is a random number. ")
		    (<:as-html  (session-value :user-id)))
		   (<:p
		    (<:span :class "fw-bold"
			    "Hunchentoot session Id. ")
		    (<:as-html (session-id *session*)))
		   (<:p
		    (<:span :class "fw-bold"
			    "Hunchentoot Session cookie value. ")
		    (<:as-html (session-cookie-value *session*) )))))
	(with-html "Ups"
	  (<:div :class "container mt-3"
		 (<:h1 :class "text-danger"
		       "Ups! you password is wrong")
		 (<:div :class "mt-3"
			(<:a :class "fs-5"
			     :href "/login.html"
			     "log in again ")))))))
