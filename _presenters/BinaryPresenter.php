<?php
class BinaryPresenter {
    // HTTP Header Method: GET
    // Used to retrive a data or a view
    public function get(){
        View::addVar("view_title", "BinaryPresenter View Page");
        View::addVar("BODY_CLASS", "bg-light");

	    View::addVar("username", SessionModel::getUser());

        View::addCSS("/_layouts/Binary/Treant.css");
        View::addCSS("/_layouts/Binary/collapsable.css");
	    View::addCSS("http://".Route::domain()."/css/".md5("Bootstrap").".min.css");


        View::addScript("/_layouts/Binary/jquery.min.js");
        View::addScript("/_layouts/Binary/Treant.js");
        View::addScript("/_layouts/Binary/jquery.easing.js");
        View::addScript("/_layouts/Binary/collapsable.js");
        View::addScript("/_layouts/Binary/collapsable.js");
        View::addScript("/_layouts/Binary/raphael.js");
        View::addScript("/_layouts/Binary/raphael.js");

	    View::addScript("http://".Route::domain()."/js/".md5("Bootstrap").".min.js");

        // Use the server domain name address on the layout
        View::addVar("DN", Route::domain());
        View::addVar("hash_id", md5(1));
    }

    // HTTP Header Method: POST
    // Usually used when to insert a new data
    public function post(){
        Route::returnCode(401);
    }

    // HTTP Header Method: PUT
    // Usually used when about to update a data
    public function put(){
        Route::returnCode(401);
    }

    // HTTP Header Method: DELETE
    // Usually used when about to delete a data
    public function delete(){
        Route::returnCode(401);
    }
}
    