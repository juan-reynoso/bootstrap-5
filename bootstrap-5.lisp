;;;; bootstrap-5.lisp

(in-package #:bootstrap-5)

(defparameter *server* nil)

(defvar *wwwroot*  (concatenate 'string (namestring (asdf:component-pathname (asdf:find-system :bootstrap-5))) "wwwroot"))

(defun start-web-server (&key (port 8090))
  "Start the web server"
  (setf *server* (start (make-instance 'easy-acceptor :port port))))

(defun stop-web-server ()
  "Stop the web server"
  (stop *server*))

(defun restart-web-server ()
  "Restart the web server"
  (stop-web-server)
  (start-web-server))

(defmacro with-html (title &body body)
  "The basic structure of a web page HTML => HEAD => BODY"
  `(with-yaclml-output-to-string
     (<:html :doctype "html"
	     (<:head
	      (<:meta (@ "charset"
			 "utf-8"))
	      (<:meta :name "viewport"
		      :content "width=device-width, initial-scale=1")
	      (<:link :rel "stylesheet"
		      :type "text/css"
		      :href "https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css")
	      (<:link :rel "stylesheet"
		      :type "text/css"
		      :href "https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css")
	      (<:script :type "text/javascript"
			:src "https://code.jquery.com/jquery-3.6.0.min.js")
	      (<:title (<:as-html ,title)))
	     (<:body
	      ,@body))))

(defun index ()
  "Bootstrao 5.1.2"
  (with-html "index"
    (<:div :class "container"
	   (<:div :class "row"
		  (<:div :class "col-12"
			 :style "background-color: #006bbf;"
			 (<:img :class "img-fluid"
				:src "/img/lisp-alien.png"))
		  (<:div :class "col-12 pt-4"
			 (<:h1 :class "text-primary"
			       "Bootstrap v5.2.0 is finally stable!")
			 (<:h3 :class "text-muted"
			      "Build fast, responsive sites with Bootstrap."))
		  (<:div :class "col-12 col-lg-6 pb-2"
			 (<:img :class "img-fluid"
				:src "/img/bs-hero.png"))
		  (<:div :class "col-12 col-lg-6 pb-2"
			 (<:div :class "list-group shadow"
				(<:a :class "list-group-item list-group-item-action d-flex gap-3 py-3"
				     :href "https://getbootstrap.com/docs/5.1/getting-started/introduction/"
				     :target "_blank"
				     (<:span :class "bi bi-house-door-fill h2 text-success")
				     (<:div :class "d-flex gap-2 w-100 justify-content-between"
					    (<:div
					     (<:h6 :class "mb-0 text-dark"
						   "Home")
					     (<:p :class "mb-0"
						  "Start"))))
				(<:a :class "list-group-item list-group-item-action d-flex gap-3 py-3"
				     :href "https://getbootstrap.com/docs/5.1/examples/modals/"
				     :target "_blank"
				     (<:span :class "bi bi-square h2 text-primary")
				     (<:div :class "d-flex gap-2 w-100 justify-content-between"
					    (<:div
					     (<:h6 :class "mb-0"
						   "Modals")
					     (<:p :class "mb-0"
						  "Transform modals to serve any purpose, from feature tours to dialogs."))))
				(<:a :class "list-group-item list-group-item-action d-flex gap-3 py-3"
				     :href "https://getbootstrap.com/docs/5.1/examples/sidebars/"
				     :target "_blank"
				     (<:span :class "bi bi-layout-sidebar h2 text-primary")
				     (<:div :class "d-flex gap-2 w-100 justify-content-between"
					    (<:div
					     (<:h6 :class "mb-0"
						   "Sidebars")
					     (<:p :class "mb-0"
						  "Common navigation patterns ideal for offcanvas or multi-column layouts."))))
				
				(<:a :class "list-group-item list-group-item-action d-flex gap-3 py-3"
				     :href "https://getbootstrap.com/docs/5.1/examples/carousel/"
				     :target "_blank"
				     (<:span :class "bi bi-images h2 text-primary")
				     (<:div :class "d-flex gap-2 w-100 justify-content-between"
					    (<:div
					     (<:h6 :class "mb-0"
						   "Carousel")
					     (<:p :class "mb-0"
						  "Customize the navbar and carousel, then add some new components."))))
				(<:a :class "list-group-item list-group-item-action d-flex gap-3 py-3"
				     :href "https://getbootstrap.com/docs/5.1/examples/"
				     :target "_blank"
				     (<:span :class "bi bi-search h3 text-primary")
				     (<:div :class "d-flex gap-2 w-100 justify-content-between"
					    (<:div
					     (<:h6 :class "mb-0"
						   "Check it out")
					     (<:p :class "mb-0"
						  "Extensive prebuilt components, and powerful JavaScript plugins."))))))))))

(setq *dispatch-table*
      (list
       (create-regex-dispatcher "^/$" 'index)
       (create-prefix-dispatcher "/index.html" 'index)
       (create-prefix-dispatcher "/login.html" 'login-form)
       (create-prefix-dispatcher "/logout.html" 'logout)
       (create-prefix-dispatcher "/sign-in.html" 'sign-in)
       (create-prefix-dispatcher "/chunk" 'chunk-of-code)
       (create-prefix-dispatcher "/reset-image" 'reset-image)
       (create-prefix-dispatcher "/ajax-example.html" 'ajax-example)
       (create-folder-dispatcher-and-handler "/img/" (concatenate 'string *wwwroot* "/img/"))))
