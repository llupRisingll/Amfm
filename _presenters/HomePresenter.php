<?php
class HomePresenter {
    // HTTP Header Method: GET
    // Used to retrive a data or a view
    public function get(){
        View::addVar("view_title", "Binary Level");
        View::addCSS("http://onushorit.com/EasyLoan/img/favicon_home.ico");
        View::addCSS("/_layouts/Home/bootstrap.min.css");
        View::addCSS("/_layouts/Home/css");
        View::addCSS("/_layouts/Home/font-awesome.min.css");
        View::addCSS("/_layouts/Home/simple-line-icons.css");
        View::addCSS("/_layouts/Home/preloader.css");
        View::addCSS("/_layouts/Home/custom.css");
        View::addCSS("/_layouts/Home/responsive.css");
        View::addCSS("/_layouts/Home/index.css");
        View::addScript("/_layouts/Home/common.js.download");
        View::addScript("/_layouts/Home/util.js.download");
        View::addScript("/_layouts/Home/controls.js.download");
        View::addScript("/_layouts/Home/places_impl.js.download");
        View::addScript("/_layouts/Home/stats.js.download");
        View::addScript("/_layouts/Home/price.slider.js.download");
        View::addScript("/_layouts/Home/custom.js.download");
        View::addScript("/_layouts/Home/testimonials.js.download");
        View::addScript("/_layouts/Home/jquery.min.js.download");
        View::addScript("/_layouts/Home/jquery.easing.js.download");
        View::addScript("/_layouts/Home/jquery.counterup.js.download");
        View::addScript("/_layouts/Home/jquery.waypoints.js.download");
        View::addScript("/_layouts/Home/bootstrap.min.js.download");
        View::addScript("/_layouts/Home/js");
        View::addScript("https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js");
        View::addScript("https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js");
        $dbCon = DatabaseModel::db();
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
    