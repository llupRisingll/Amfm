<?php
class LoginAuthModel {

    public static function checkAccount($usn, $pwd) {
        // Database connection
        $database = DatabaseModel::db();
        $connection = DatabaseModel::getConnection();

        // Process of querying data
        $sql = "SELECT id FROM `accounts` WHERE `username`=:username AND `pass`=:password LIMIT 1";
        $prepare = $database->mysqli_prepare($connection, $sql);
        $database->mysqli_execute($prepare, array(
            ':username'=>$usn,
            ':password'=>$pwd
        ));

        // Get the matched data from the database
        $result = $database->mysqli_fetch_assoc($prepare);

        // Return false when the username/password is wrong
        if (count($result) < 1)
            return false;

        // Return the user id from the database
        return $result[0]["id"];
    }
}
    