<?php
class unilevelPresenter {
    // HTTP Header Method: GET
    // Used to retrive a data or a view
    public function get(){
        View::addVar("view_title", "Unilevel");
        View::addVar("BODY_CLASS", "bg-light");
        View::addCSS("/_layouts/Binary/Treant.css");
        View::addCSS("/_layouts/Binary/collapsable.css");
        View::addCSS("https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css");
        View::addScript("/_layouts/Binary/jquery.min.js");
        View::addScript("/_layouts/Binary/Treant.js");
        View::addScript("/_layouts/Binary/jquery.easing.js");
        View::addScript("/_layouts/Binary/collapsable.js");
        View::addScript("/_layouts/Binary/collapsable.js");
        View::addScript("/_layouts/Binary/raphael.js");
        View::addScript("/_layouts/Binary/raphael.js");
        View::addScript("https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js");
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
    