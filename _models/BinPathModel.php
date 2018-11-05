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

    public static function checkAccountStatus(){
		// Check the status of the account according to its session id

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

		echo "INSERT INTO `binpath`(`anc`, `desc`, `parent`)
			(SELECT `anc`, $id AS `desc`,  $parent AS `parent` FROm `binpath` WHERE `desc`=$parent) UNION
 			(SELECT $id AS `enc`,$id AS `desc`, $parent AS `parent`);";
    }

    public static function selectNodes(){
	    // Database connection
	    $database = DatabaseModel::initConnections();
	    $connection = DatabaseModel::getMainConnection();

	    // Process of querying data
	    $sql = "SELECT a.*, b.parent FROM `accounts` a 
			JOIN `binpath` b
    			ON (a.id=b.`desc`)
    		WHERE b.anc = :USER_ID AND  a.id != :USER_ID";

	       $prepare = $database->mysqli_prepare($connection, $sql);
	    $database->mysqli_execute($prepare, array(
		    ":USER_ID" => SessionModel::getUserID()
	    ));

	    // Get the matched data from the database
	    $result = $database->mysqli_fetch_assoc($prepare);

	    // Return false when the reference provided is wrong
	    if (count($result) < 1)
		    return false;

	    // Return the user id and hash from the database
	    return self::node2JSON($result);
    }

    private static function node2JSON(Array $nodeData){
		$jsonArr = array();

		$nodeList = array();

		// Loop Nodes from database to count the children and
	    // generate graph JSON
		foreach ($nodeData as $nodes){
			$dataArr = array(
				"collapsed" =>  true,
				"image" => "img/person_icon.png",
				"HTMLid" => "a_".$nodes["id"],
				"parentId" => "a_".$nodes["parent"],
				"text" => array(
					"data-toggle" => "tooltip",
					"data-html" => true,
					"data-title" => "<b>Username: </b>".$nodes["username"]
				)
			);
			array_push($jsonArr, $dataArr);

			// Increment the parent
			$nodeList[$nodes["parent"]] += 1;
		}

		// Loop Nodes from database to generate the plus icon as the last children
	    foreach ($nodeData as $nodes){
			// If the node does not have a child
		    if (!isset($nodeList[$nodes["id"]])){
			    $dataArr = array(
				    "image" => "img/plus-logo.png",
				    "HTMLclass" => "add-person",
				    "parentId" => "a_".$nodes["id"],
				    "text" => array(
				    	"data-toggle" => "modal",
			            "data-target" => "#addPerson"
				    )
			    );
			    array_push($jsonArr, $dataArr);
			    array_push($jsonArr, $dataArr);
		    }
	    }

		return json_encode($jsonArr,JSON_PRETTY_PRINT);
    }
}