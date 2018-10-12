<?php
class logoutPresenter {
    // HTTP Header Method: GET
    // Used to retrive a data or a view
    public function get(){
        SessionModel::destroy();
        header('Location: /');
        exit;
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
    