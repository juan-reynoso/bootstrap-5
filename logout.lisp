(in-package #:bootstrap-5)

(defun logout ()
  (setf (session-value :user-id) nil)
  (remove-session *session*)
  (with-html "You have logged out "
	    (<:div :class "container mt-3"
		   (<:h1 :class "text-success"
			 "You have logged out.")
		   (<:div :class "mt-3"
			(<:a :class "fs-5"
			     :href "/login.html"
			     "log in again ")))))
