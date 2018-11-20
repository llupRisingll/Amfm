<?php
class HomePresenter {
    public function get(){
    	SessionModel::restrictLogged();

        View::addVar("view_title", "Mon-Light OFW Credit Cooperative");
        View::addCSS("/_layouts/Home/css/bootstrap.min.css");
        View::addCSS("/_layouts/Home/css/main.css");
        View::addCSS("/_layouts/Home/css/font-awesome.min.css");
        View::addCSS("/_layouts/Home/css/simple-line-icons.css");
        View::addCSS("/_layouts/Home/css/preloader.css");
        View::addCSS("/_layouts/Home/css/custom.css");
        View::addCSS("/_layouts/Home/css/responsive.css");
        View::addCSS("/_layouts/Home/css/index.css");

	    // Import JQuery Library
        View::addScript("/_layouts/Home/js/jquery.min.js");
	    View::addScript("/_layouts/Home/js/jquery.easing.js");
	    View::addScript("/_layouts/Home/js/jquery.counterup.js");
	    View::addScript("/_layouts/Home/js/jquery.waypoints.js");
	    View::addScript("/_layouts/Home/js/bootstrap.min.js");

	    // Import Other JS
	    View::addScript("/_layouts/Home/js/index.js");
	    View::addScript("/_layouts/Home/js/common.js");
        View::addScript("/_layouts/Home/js/util.js");
        View::addScript("/_layouts/Home/js/controls.js");
        View::addScript("/_layouts/Home/js/places_impl.js");
        View::addScript("/_layouts/Home/js/stats.js");
        View::addScript("/_layouts/Home/js/price.slider.js");
        View::addScript("/_layouts/Home/js/custom.js");
        View::addScript("/_layouts/Home/js/testimonials.js");
        View::addScript("https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js");
        View::addScript("https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js");
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
    