<?php
class loginPresenter {
    // HTTP Header Method: GET
    // Used to retrive a data or a view
    public function get(){
        View::addVar("view_title", "AMFM Login");
        View::addVar("BODY_CLASS", "bg-light");
        View::addCSS("/_layouts/login/login.css");
        View::addCSS("http://".Route::domain()."/css/".md5("Bootstrap").".min.css");
    }

    // HTTP Header Method: POST
    // Usually used when to insert a new data
    public function post(){
        Params::permit('usn', 'pwd');

        $usn = Params::get('usn');
        $pwd = Params::get('pwd');
        $invalid = 'Invalid Username and Password';

        // Check if all form is may laman
        if (!isset($usn, $pwd)){
            echo $invalid;
            exit;
        }
        // Check the length of Usn
        if(strlen($usn) < 3 || strlen($usn) > 32){
            echo $invalid;
            exit;
        }
        // Check the length of password
        if(strlen($pwd) < 3 || strlen($pwd) > 32){
            echo $invalid;
            exit;
        }

        // Start Account checking...
        $account = LoginAuthModel::checkAccount($usn, $pwd);
        if ($account !== false){
            // Save the session
            SessionModel::setUser($usn);
            SessionModel::setID($account);

            // Redirect to the main page
            header("location: /uni");
            exit;
        }

        // Show the invalid error
        echo $invalid;
        exit;
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
    