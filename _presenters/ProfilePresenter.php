<?php
class ProfilePresenter {
    public function get(){
	    SessionModel::restrictNotLogged();

	    // Check for a possible request loan
	    Params::permit("rl");
	    if (Params::get("rl") != false){
	    	UniPathModel::addPending(Params::get("rl"));
			header("location: /");
			exit;
	    }

	    // Web page configuration
        View::addVar("view_title", "Profile Page");
	    View::addVar("BODY_CLASS", "bg-light");
        View::addVar("username", SessionModel::getUser());
        View::addVar("FULL_NAME", SessionModel::getName());

	    // Import the Bootstrap
	    View::addCSS("http://".Route::domain()."/css/".md5("Bootstrap").".min.css");

	    // Import the Jquery
	    View::addScript("/_layouts/Binary/jquery.min.js");

	    // Include the bootstrap JS
	    View::addScript("http://".Route::domain()."/js/".md5("Bootstrap").".min.js");
    }

    public function post(){
        Route::returnCode(401);
    }

    public function put(){
        Route::returnCode(401);
    }

    public function delete(){
        Route::returnCode(401);
    }
}