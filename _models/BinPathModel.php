<?php
class BinPathModel {
    public static function checkReference(String $ref){
	    // Database connection
	    $database = DatabaseModel::initConnections();
	    $connection = DatabaseModel::getMainConnection();

	    // Process of querying data
	    $sql = "SELECT `id`  FROM `accounts` WHERE `hash_id`=:REF LIMIT 1";
	    $prepare = $database->mysqli_prepare($connection, $sql);
	    $database->mysqli_execute($prepare, array(":REF"=> $ref));

	    // Get the matched data from the database
	    $result = $database->mysqli_fetch_assoc($prepare);

	    // Return false when the reference provided is wrong
	    if (count($result) < 1)
		    return false;

	    $resultArray = $result[0];

	    // Make sure the provided reference is not the user's hash id by checking the resulted id
	    if ($resultArray["id"] === SessionModel::getUserID())
	    	return false;

	    // Return the user id from the database
	    return $resultArray["id"];
    }

    public static function addNode($parent, $id){
    	"INSERT INTO `binpath`(`anc`, `desc`, `parent`)
			(SELECT `anc`, 65 AS `desc`,  64 AS `parent` FROm `binpath` WHERE `desc`=64) UNION
 			(SELECT 65 AS `enc`,65 AS `desc`, 64 AS `parent`)";
    }

    public static function selectNodes($user_id){
    	"SELECT a.*, b.parent FROM `accounts` a 
			JOIN `binpath` b
    			ON (a.id=b.`desc`)
    		WHERE b.anc = :user_id";
    }
}