(in-package #:bootstrap-5)
;;; The login for the application
(defun login ()
  "Start session and set random number as user-id"
  (let ((user-id (random 100)))
    #|
      Returns the current SESSION object. If there is no current session, creates one 
      and updates the corresponding data structures.
      In this case the function will also send a session cookie to the browser. |#
    (start-session)
    (setf (session-value :user-id) user-id)))


