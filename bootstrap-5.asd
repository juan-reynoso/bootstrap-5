;;;; bootstrap-5.asd

(asdf:defsystem #:bootstrap-5
  :description "Describe bootstrap-5 here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:hunchentoot #:yaclml)
  :components ((:file "package")
               (:file "bootstrap-5")))
