<?php
class DatabaseModel {
    // Database instances
    private static $DB = null;
    private static $DBCon = null;
    /**
     * Connect to the Database
     */
    public static function db(){
        // Use the "cached" DB to minimize multiple initialization
        if (self::$DB != null){
            return self::$DB;
        }

        // Get authentication credentials from the configuration file
        $AC = Route::config("kim_db");

        // Connect to the Database Server
        $DB = new Plugins\MySQLiPDO();
        $DBCon = $DB->mysqli_connect($AC["host"], $AC["dbname"], $AC["username"], $AC["password"]);
        if (!$DB){
            // TODO: Log this error
            echo "An unknown error occurs. Please try again later or contact the administrator. <a href='/'>Go back to homepage</a>";
            exit;
        }
        // Save DB Instances as methods
        self::$DB = $DB;
        self::$DBCon = $DBCon;
        return $DB;
    }

    public static function getConnection(){
        return self::$DBCon;
    }
}