<?php
class loginPresenter {
    // HTTP Header Method: GET
    // Used to retrive a data or a view
    public function get(){
        View::addVar("view_title", "AMFM Login");
        View::addCSS("/_layouts/login/login.css");
        View::addCSS("http://".Route::domain()."/css/".md5("Bootstrap").".min.css");
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
    