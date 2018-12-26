<?php

require_once dirname(dirname(__FILE__))."/rut/bin/global_vars.php";
require_once dirname(dirname(__FILE__))."/rut/bin/autoload.php";

class Execute{
	private static function fetch_JSON(){
		$string = file_get_contents(ROOT.DS."schedule.json");
		$json_a = json_decode($string, true);

		return $json_a["last_executed"];
	}

	private static function replace_JSON($new_date){
		$jsonData = [
			"last_executed" => $new_date
		];

		file_put_contents(ROOT.DS."schedule.json", json_encode($jsonData, JSON_PRETTY_PRINT));

		echo "executed";
	}

	private static function add_to_wallet(){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();

		// FETCH THE BRANCH TREE DATA
		$sql = "
		UPDATE `uni_wallet` as uw 
		INNER JOIN `uni_info` as ui ON ui.uwid=uw.id 
		INNER JOIN `uni_monthly` gs ON gs.cid = ui.cid
			SET uw.`amount`=uw.amount+gs.amount,
				uw.`balance` = ((uw.amount+gs.amount)-uw.`paid`)
		";

		$prepare = $database->mysqli_prepare($connection, $sql);
		$database->mysqli_execute($prepare, [ ]);

	}

	private static function add_to_history(){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();

		// FETCH THE BRANCH TREE DATA
		$sql = "
		INSERT INTO `uni_history`
			(`uwid`, `amount`, `earn_date`)
			(
			SELECT ui.uwid, gs.amount, NOW() 
				FROM uni_wallet uw 
			INNER JOIN `uni_info` ui ON ui.uwid=uw.id 
			INNER JOIN `uni_monthly` gs ON gs.cid = ui.cid
			)
		";

		$prepare = $database->mysqli_prepare($connection, $sql);
		$database->mysqli_execute($prepare, [ ]);
	}

	public static function init(){
		$last_executed = self::fetch_JSON();
		$current_date = date('Y-m-d');

		if ($current_date > $last_executed){
			// Add to wallets and history per amount per user
			self::add_to_history();
			self::add_to_wallet();

			self::replace_JSON($current_date);

		}else{
			echo "canceled";
		}
	}
}

Execute::init();