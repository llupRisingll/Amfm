<?php
class signupPresenter {
    // HTTP Header Method: GET
    // Used to retrive a data or a view
    public function get(){
        View::addVar("view_title", "AMFM Signup");
        View::addCSS("/_layouts/login/signup.css");
        View::addVar("BODY_CLASS", "bg-light");
        View::addCSS("http://".Route::domain()."/css/".md5("Bootstrap").".min.css");

        // Restrict Logged User
        SessionModel::restrictLogged();
    }

    // HTTP Header Method: POST
    // Usually used when to insert a new data
    public function post(){
        Params::permit('fn', 'ln', 'bd', 'ad', 'cn', 'ea', 'usn', 'pwd', 'cfpwd');

        // Put to variable to be used in model
        $first_name = Params::get("fn");
        $last_name = Params::get("ln");
        $birth_date = Params::get("bd");
        $address = Params::get("ad");
        $email_add = Params::get("ea");
        $contact_num = Params::get("cn");
        $usn = Params::get("usn");
        $pwd = Params::get("pwd");
        $cfpwd = Params::get("cfpwd");

        // Check kung may laman ang gabos na data
        if(!isset($first_name, $last_name, $address, $contact_num, $usn, $pwd, $cfpwd)){
            echo "Fill all forms of data!";
            exit;
        }
        // Check if the passwords match
        if($pwd != $cfpwd){
            echo "Error: Password does not match!";
            exit;
        }
        // Check the length of passsword
        if(strlen($pwd) < 8 || strlen($pwd) > 32 ){
            echo "Error: Password must be 8-32 characters only! ";
            exit;
        }
        // Check the length of username
        if (strlen($usn) < 8 || strlen($usn) > 32 ){
            echo "Error: Username must be 8-32 characters only! ";
            exit;
        }
        // Check if the characters of usn is valid
        if(!preg_match('/^[a-z\d_]{0,}$/i', $usn)){
            echo "Username must be alpha numeric characters only!";
            exit;
        }
        // Check the length of first name
        if (strlen($first_name) < 1 || strlen($first_name) > 32 ){
            echo "Error: First name must be 1-32 characters only! ";
            exit;
        }
        // To check the length of last name
        if (strlen($last_name) < 1 || strlen($last_name) > 32 ){
            echo "Error: Last name must be 1-32 characters only! ";
            exit;
        }
        // To check the length of address
        if (strlen($address) < 1 || strlen($address) > 60 ){
            echo "Error: Address must be 1-32 characters only! ";
            exit;
        }

        // To check the length of contact number
        if(strlen($contact_num) < 5 || strlen($contact_num) > 13 ){
            echo "Error: Contact number is Invalid!";
            exit;
        }

        // Validation of contact number
        if(!preg_match('/^\d*$/',$contact_num)){
            echo "Error: Contact number is Invalid! Please input a number only";
            exit;
        }

        // Email validation
        if(!filter_var($email_add, FILTER_VALIDATE_EMAIL)){
            echo "Error: Your Email is invalid";
        }

        // Start the Registration Backend process
        $registered = RegisterAuthModel::register($first_name, $last_name, $birth_date, $address, $email_add, $contact_num, $usn, $pwd, $cfpwd);

        if ($registered === true){
            echo "Successfully registered";
            exit;
        }
        echo "Error found while trying to register";
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
    