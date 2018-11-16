<?php

class AcctManagementModel {


	public static function getInfo(){
		// Database connection
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();

		// Process of querying data
		$sql = "SELECT `username`, `ad`, `email`, `photo`, `cn`, `bdate`, `fn`, `ln` 
					FROM `accounts` a
				LEFT JOIN `account_info` ai ON ai.`accnt_id`=a.`id`
				WHERE a.`id`=:USER_ID  LIMIT 1";

		$prepare = $database->mysqli_prepare($connection, $sql);
		$database->mysqli_execute($prepare, array(
			":USER_ID"=> SessionModel::getUserID()
		));

		// Get the matched data from the database
		$result = $database->mysqli_fetch_assoc($prepare);

		// Return false when the reference provided is wrong
		if (count($result) < 1)
			return false;

		$resultArray = $result[0];

		// Return the array from the database
		return $resultArray;
	}
}