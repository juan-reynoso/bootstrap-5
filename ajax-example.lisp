(in-package #:bootstrap-5)

(defun chunk-of-code ()
  (with-yaclml-output-to-string
    (<:img :class "img-fluid"
	   :src "/img/man.png")))

(defun reset-image ()
  (with-yaclml-output-to-string
    (<:img :class "img-fluid"
	   :src "/img/woman.png")))

(defun ajax-example ()
  (with-html "jquery AJAX example"
    (<:main :id "content"
	    :class "container pt-5"
	    (<:div :class "row"
		   (<:div :class "col-12 col-lg-4"
			  (<:div :id "wrap-ajax-image"
				 (<:img :class "img-fluid"
					:src "/img/woman.png"))
			  (<:div :class "d-flex justify-content-between pt-3"
				 (<:button :class "btn btn-outline-success"
					   :type "button"
					   :onclick "resetImage();"
					   (<:i :class "bi bi-arrow-counterclockwise fw-bold fs-5 pe-2")
					   "Reset image")
				 (<:button :class "btn btn-outline-primary"
					   
					   :type "button"
					   :onclick "changeImage();"
					   (<:i :class "bi bi-arrow-left-right fw-bold fs-5 pe-2")
					   "Change image")))))
    (<:script :type "text/javascript"
	      (<:as-is "function resetImage(){
  $.ajax ({url: '/reset-image',
	     cache: false,
	     success: function (result) {
		 $('#wrap-ajax-image').html(result);
	     }
	    });
}
function changeImage(){
  $.ajax ({url: '/chunk',
	     cache: false,
	     success: function (result) {
		 $('#wrap-ajax-image').html(result);
	     }
	    });
}"))))
