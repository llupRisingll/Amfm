<?php
class ProfilePresenter {
    // HTTP Header Method: GET
    // Used to retrive a data or a view
    public function get(){
        View::addVar("view_title", "ProfilePresenter View Page");
        View::addVar("username", SessionModel::getUser());

	    // Import the Bootstrap
	    View::addCSS("https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css");

	    // Import JQUERy
	    View::addScript("/_layouts/Binary/jquery.min.js");

	    // Include the bootstrap JS
	    View::addScript("https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js");
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
    