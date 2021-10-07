(in-package #:bootstrap-5)

(defun login-form ()
  (with-html "My login"
    (<:div :class "container d-flex flex-column"
	   (<:div :class "row align-items-center justify-content-center no-gutters"
		  (<:div :class "col-md-7 col-lg-5 pt-5"
			 (<:div :class "w-100 text-center"
				(<:h1 "Login"))
			 (<:form :action "/sign-in.html"
				 :method "post"
				 (<:div :class "mb-3"
					(<:label :class "form-label fw-bold"
						 :for "user-name"
						 "User name")
					(<:input :class "form-control"
						 :type "text"
						 :name "user-name"
						 :id "user-name"))
				 (<:div :class "mb-3"
					(<:label :class "form-label fw-bold"
						 :for "password"
						 "Password")
					(<:input :class "form-control"
						 :type "password"
						 :name "password"
						 :id "password"))
				 (<:div :class "d-flex justify-content-end"
					(<:strong :class "me-3 text-muted"
						  "password = a-secret")
					(<:button :class "btn btn-primary"
						  :type "submit"
						  "Login"))))))))
