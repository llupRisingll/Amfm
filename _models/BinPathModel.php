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

	/**
	 * Check the current user if it has a pending request
	 * @param String $type
	 * @return bool
	 */
    public static function checkOnPending(String $type){
	    // Database connection
	    $database = DatabaseModel::initConnections();
	    $connection = DatabaseModel::getMainConnection();

	    // Process of querying data
	    $sql = "SELECT `a`.`hash_id` AS `hash` FROM `pending_requests` pr 
					LEFT JOIN `accounts` a ON `a`.id=`pr`.parent_id 
				WHERE `pr`.`type`=:TYPE AND `pr`.`user_id`=:USER_ID LIMIT 1";
	    $prepare = $database->mysqli_prepare($connection, $sql);
	    $database->mysqli_execute($prepare, array(
	    	":TYPE" => $type,
		    ":USER_ID" => SessionModel::getUserID()
	    ));

	    // Get the matched data from the database
	    $result = $database->mysqli_fetch_assoc($prepare);

	    // Return false when the reference provided is wrong
	    if (count($result) < 1)
		    return false;

	    // Return the user id and hash from the database
	    return $result[0]["hash"];
    }


    public static function addPending(String $parentID, String $type){
	    // Database connection
	    $database = DatabaseModel::initConnections();
	    $connection = DatabaseModel::getMainConnection();

	    try {
		    // Save the account auth data
		    $prepared = $database->mysqli_prepare($connection, "
                INSERT INTO `pending_requests`(`user_id`, `parent_id`, `type`) 
                		VALUES (:USER_ID, :PARENT_ID, :TYPE);
            ");

		    $database->mysqli_execute($prepared, array(
			    ":USER_ID" => SessionModel::getUserID(),
			    ":PARENT_ID" => $parentID,
			    ":TYPE" => $type
		    ));

		    return true;

	    } catch(Exception $e){
		    /**
		     * An exception has occured, which means that one of our database queries
		     * failed. Print out the error message.
		     */
		    echo $e->getMessage();

		    return false;
	    }
    }

    public static function removePending(String $type){
		// DELETE FROM DATABASE algorithm
	    // Database connection
	    $database = DatabaseModel::initConnections();
	    $connection = DatabaseModel::getMainConnection();

	    try {
		    // Save the account auth data
		    $prepared = $database->mysqli_prepare($connection, "
                DELETE FROM `pending_requests` WHERE `type`=:TYPE AND `user_id`=:USER_ID;
            ");

		    $database->mysqli_execute($prepared, array(
			    ":USER_ID" => SessionModel::getUserID(),
			    ":TYPE" => $type
		    ));

		    return true;
	    } catch(Exception $e){
		    /**
		     * An exception has occured, which means that one of our database queries
		     * failed. Print out the error message.
		     */
		    echo $e->getMessage();
		    return false;
	    }
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