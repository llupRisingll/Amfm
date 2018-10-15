<?php
class SessionModel {
    // Start the Session
    public static function start(){
        if(session_status() != PHP_SESSION_ACTIVE){
            session_name("_sA");
            session_start();
        }
    }
    // Get the Login Status based on username
    public static function getLoginStatus(){
        self::start();
        return isset($_SESSION["username"], $_SESSION["userID"]);
    }
    // Restrict Logged User
    public static function restrictLogged(){
        self::start();
        // Disallow: User Visit if it is already logged in
        if (self::getLoginStatus()){
            header("location: /profile");
            exit;
        }
    }
    // Restrict Guest
    public static function restrictNotLogged(){
        self::start();
        // Disallow: User Visit if it is not yet logged in
        if (!self::getLoginStatus()){
            header("location: /");
            exit;
        }
    }
    // Log a user
    public static function setUser(String $username){
        self::start();
        $_SESSION["username"] = $username;
    }
    // Log the users id
    public static function setID(String $userID){
        self::start();
        $_SESSION["userID"] = $userID;
    }

    // Log the user's name
    public static function setName(String $fn, String $ln){
        self::start();
        $_SESSION["name"] = $fn. " ".$ln;
    }
    // Get Logged user
    public static function getUser(){
        self::start();
        return $_SESSION["username"];
    }
    // Get Logged User ID
    public static function getUserID(){
        self::start();
        return $_SESSION["userID"];
    }
    // Get Logged User ID
    public static function getName(){
        self::start();
        return ucwords($_SESSION["name"]);
    }
    // Destroy the session
    public static function destroy(){
        self::start();
        // Destroy the current Session
        session_destroy();
    }
}
    