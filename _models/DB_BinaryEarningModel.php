<?php

class DB_BinaryEarningModel {
	public static function fetch_binary_parents($target_id){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();

		$prepare = $database->mysqli_prepare($connection, "SELECT anc FROM `binpath` WHERE `desc`=:USER_ID");
		$database->mysqli_execute($prepare, array(
			":USER_ID" => $target_id
		));

		// Convert to ordinary Array since you are only fetching a single data
		$result_array = [];
		foreach ($database->mysqli_fetch_rows($prepare) as $key => $val){
			array_push($result_array, $val[0]);
		}

		return $result_array;
	}

	public static function fetch_binary_children($userID){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();

		// FETCH THE BRANCH TREE DATA
		$sql = "
		SELECT a.binparent, a.id, b.lside, b.parent, b.desc, b.anc FROM `accounts` a 
			JOIN `binpath` b
    			ON (a.id=b.`desc`)
    		WHERE b.anc = :USER_ID AND  a.id != :USER_ID
		";

		$prepare = $database->mysqli_prepare($connection, $sql);
		$database->mysqli_execute($prepare, array(
			":USER_ID" => $userID
		));

		// Get the matched data from the database
		return $database->mysqli_fetch_assoc($prepare);
	}


	public static function generate_sql_values(Array $array_values){
		$sqlTemplate = "";
		$firstFlag = true;
		foreach ($array_values as $cid => $amount){
			// Skip the 0 amount earnings
			if ($amount == 0)
				continue;

			// Capture the first value then remove the UNION
			$union = ($firstFlag) ? "" : "UNION ALL";

			if ($firstFlag)
				$firstFlag = false;

			$string = "SELECT $amount AS `amount`, $cid AS `cid`";
			$sqlTemplate .= "$union ". (count($array_values) > 1 ? "($string)": $string). "\n";
		}

		return $sqlTemplate;
	}

	public static function add_bin_history($arrayValues){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();

		$generatedQuery = self::generate_sql_values($arrayValues);

		// FETCH THE BRANCH TREE DATA
		$sql = "
		INSERT INTO `bin_history`
		(`bwid`, `amount`, `earn_date`)

		(SELECT bi.bwid, (gs.amount - bw.amount), NOW() 
			FROM bin_wallet bw 
		INNER JOIN `bin_info` bi ON bi.bwid=bw.id 
        INNER JOIN ( $generatedQuery) gs ON gs.cid = bi.cid
		WHERE (gs.amount - bw.amount) > 0)			
		";

		$prepare = $database->mysqli_prepare($connection, $sql);
		$database->mysqli_execute($prepare, [ ]);
	}

	public static function update_bin_wallet($arrayValues){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();
		$generatedQuery = self::generate_sql_values($arrayValues);

		// FETCH THE BRANCH TREE DATA
		$sql = "
		UPDATE `bin_wallet` as bw 
		INNER JOIN `bin_info` as bi ON bi.bwid=bw.id 
		INNER JOIN ( $generatedQuery) gs ON gs.cid = bi.cid
			SET bw.`amount`=gs.amount, 
				bw.`balance` = (gs.amount-bw.`paid`)
		";

		$prepare = $database->mysqli_prepare($connection, $sql);
		$database->mysqli_execute($prepare, []);
	}


	public static function save_information($arrayValues){
		self::add_bin_history($arrayValues);
		self::update_bin_wallet($arrayValues);
	}
}