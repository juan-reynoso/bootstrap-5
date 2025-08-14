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
		      :href "https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css")
	      (<:link :rel "stylesheet"
		      :type "text/css"
		      :href "https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css")
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
		  
		  (<:div :class "col-12 py-5"
			 (<:h1 :class "text-primary"
			       "Introducción a ISC")
			 (<:h4 :class "text-muted"
			       "Formar profesionales con capacidad analítica, crítica y creativa capaces de diseñar y desarrollar sistemas de software que permitan propiciar el fortalecimiento de la tecnológia nacional, administrar proyectos de desarrollo de software y especificar y evaluar configuraciones de sistemas de cómputo en todo tipo de empresas."))
		  (<:div :class "col-12 col-lg-6 pt-5"
			 (<:img :class "img-fluid"
				:src "/img/bs-hero.png"))
		  (<:div :class "col-12 col-lg-6 pb-2"
			 (<:div :class "list-group shadow"
				(<:a :class "list-group-item list-group-item-action d-flex gap-3 py-3"
				     :href "https://getbootstrap.com/docs/5.3/getting-started/introduction/"
				     :target "_blank"
				     (<:span :class "bi bi-router h2 text-primary")
				     (<:div :class "d-flex gap-2 w-100 justify-content-between"
					    (<:div
					     (<:h6 :class "mb-0 text-dark"
						   "Redes")
					     (<:p :class "mb-0"
						  "Desarrollan e implementan servidores de red"))))
				(<:a :class "list-group-item list-group-item-action d-flex gap-3 py-3"
				     :href "https://getbootstrap.com/docs/5.3/examples/modals/"
				     :target "_blank"
				     (<:span :class "bi bi-microsoft h2 text-info")
				     (<:div :class "d-flex gap-2 w-100 justify-content-between"
					    (<:div
					     (<:h6 :class "mb-0"
						   "Sistemas operativos")
					     (<:p :class "mb-0"
						  "Configuran y administran virtualización de sistemas operativos"))))
				(<:a :class "list-group-item list-group-item-action d-flex gap-3 py-3"
				     :href "https://getbootstrap.com/docs/5.3/examples/sidebars/"
				     :target "_blank"
				     (<:span :class "bi bi-code-slash h2 text-primary")
				     (<:div :class "d-flex gap-2 w-100 justify-content-between"
					    (<:div
					     (<:h6 :class "mb-0"
						   "Programación")
					     (<:p :class "mb-0"
						  "Móvil, web, etc."))))
				
				(<:a :class "list-group-item list-group-item-action d-flex gap-3 py-3"
				     :href "https://getbootstrap.com/docs/5.3/examples/carousel/"
				     :target "_blank"
				     (<:span :class "bi bi-database-check h2 text-danger")
				     (<:div :class "d-flex gap-2 w-100 justify-content-between"
					    (<:div
					     (<:h6 :class "mb-0"
						   "Base de datos")
					     (<:p :class "mb-0"
						  "Diseñan, desarrollan e implementan bases de datos"))))
				(<:a :class "list-group-item list-group-item-action d-flex gap-3 py-3"
				     :href "https://getbootstrap.com/docs/5.3/examples/"
				     :target "_blank"
				     (<:span :class "bi bi-shield-fill-check h3 text-success")
				     (<:div :class "d-flex gap-2 w-100 justify-content-between"
					    (<:div
					     (<:h6 :class "mb-0"
						   "Seguridad informática")
					     (<:p :class "mb-0"
						  "Aplican aspectos legales y regulatorios en ciberseguridad"))))))))))

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
