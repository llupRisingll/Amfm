<?php

class eWalletModel {
	public static function fetch_bin_wallet($type="balance"){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();

		$prepare = $database->mysqli_prepare($connection, "
			SELECT $type FROM `bin_wallet` bw
			INNER JOIN `bin_info` bi ON bi.bwid=bw.id
			WHERE bi.cid=:USER_ID LIMIT 1
		");

		$database->mysqli_execute($prepare, array(
			":USER_ID" => SessionModel::getUserID()
		));

		$result = $database->mysqli_fetch_assoc($prepare);

		if (count($result)){
			return ($result[0][$type]);
		}

		return 0;
	}

	public static function fetch_uni_wallet($type="balance"){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();

		$prepare = $database->mysqli_prepare($connection, "
			SELECT $type FROM `uni_wallet` uw
			INNER JOIN `uni_info` ui ON ui.uwid=uw.id
			WHERE ui.cid=:USER_ID LIMIT 1
		");

		$database->mysqli_execute($prepare, array(
			":USER_ID" => SessionModel::getUserID()
		));

		$result = $database->mysqli_fetch_assoc($prepare);

		if (count($result)){
			return ($result[0][$type]);
		}

		return 0;
	}

	public static function fetch_uni_monthly(){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();

		$prepare = $database->mysqli_prepare($connection, "
			SELECT `amount` FROM `uni_monthly` WHERE `cid`=:USER_ID LIMIT 1
		");

		$database->mysqli_execute($prepare, array(
			":USER_ID" => SessionModel::getUserID()
		));

		$result = $database->mysqli_fetch_assoc($prepare);

		if (count($result)){
			return ($result[0]["amount"]);
		}

		return 0;
	}

	public static function fetch_e_wallet(){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();

		$prepare = $database->mysqli_prepare($connection, "
			SELECT amount FROM e_wallet WHERE cid = :USER_ID
		");

		$database->mysqli_execute($prepare, array(
			":USER_ID" => SessionModel::getUserID()
		));

		$result = $database->mysqli_fetch_assoc($prepare);

		if (count($result)){
			return ($result[0]["amount"]);
		}

		return 0;
	}

	public static function transfer_to_wallet($type, $amount){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();

		$database->mysqli_begin_transaction($connection);

		try {
			// Increase e_wallet amount
			$prepare = $database->mysqli_prepare($connection, "
				INSERT INTO `e_wallet`(`cid`, `amount`) VALUES (:USER_ID,$amount)
				ON DUPLICATE KEY UPDATE `amount`=`amount`+$amount;
			");
			$database->mysqli_execute($prepare, array(
				":USER_ID" => SessionModel::getUserID()
			));

			// Dynamic table
			if ($type == "bin") {
				$table = "bin_wallet";
				$table_info = "bin_info";
				$table_id = "bwid";
			}
			if ($type == "uni") {
				$table = "uni_wallet";
				$table_info = "uni_info";
				$table_id = "uwid";
			}

			// Check the remaining balance
			$prepare = $database->mysqli_prepare($connection, "
				SELECT `balance` FROM `$table` t INNER JOIN `$table_info` ti ON t.id=ti.$table_id
				WHERE `cid` = :USER_ID;
			");
			$database->mysqli_execute($prepare, array(
				":USER_ID" => SessionModel::getUserID()
			));
			$balance = $database->mysqli_fetch_assoc($prepare)[0]["balance"];
			if ($balance - $amount < 0){
				$database->mysqli_rollback($connection);
				return false;
			}

			// Deduct from the wallet
			$prepare = $database->mysqli_prepare($connection, "
				UPDATE `$table` t INNER JOIN `$table_info` ti ON t.id=ti.$table_id
					SET `balance`= balance-$amount,
						`paid` = `paid`+$amount
				WHERE `cid` = :USER_ID;
			");
			$database->mysqli_execute($prepare, array(
				":USER_ID" => SessionModel::getUserID()
			));

			// Commit the changes when no error found.
			$database->mysqli_commit($connection);
			return true;

		} catch(Exception $e){
			echo $e->getMessage();

			//Rollback the transaction.
			$database->mysqli_rollback($connection);
			return false;
		}
	}

	public static function fetch_pending_withdrawal(){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();

		$prepare = $database->mysqli_prepare($connection, "
			SELECT `amount` FROM `withdrawal_request` WHERE `cid`=:USER_ID LIMIT 1
		");

		$database->mysqli_execute($prepare, array(
			":USER_ID" => SessionModel::getUserID()
		));

		$result = $database->mysqli_fetch_assoc($prepare);

		if (count($result)){
			return ($result[0]["amount"]);
		}

		return false;
	}

	public static function withdraw_money($amount){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();
		$database->mysqli_begin_transaction($connection);

		try {
			// Check the remaining balance
			$prepare = $database->mysqli_prepare($connection, "
				SELECT `amount` FROM `e_wallet` WHERE `cid`=:USER_ID
			");
			$database->mysqli_execute($prepare, array(
				":USER_ID" => SessionModel::getUserID()
			));
			$balance = $database->mysqli_fetch_assoc($prepare)[0]["amount"];
			if ($balance - $amount < 0){
				$database->mysqli_rollback($connection);
				return false;
			}

			// deduct e_wallet amount
			$prepare = $database->mysqli_prepare($connection, "
				UPDATE `e_wallet` SET `amount`=`amount`-:AMOUNT WHERE `cid`=:USER_ID;
			");
			$database->mysqli_execute($prepare, array(
				":USER_ID" => SessionModel::getUserID(),
				":AMOUNT" => $amount
			));

			// Increase e_wallet amount
			$prepare = $database->mysqli_prepare($connection, "
				INSERT INTO `withdrawal_request`(`cid`, `amount`, `resq_date`) VALUES (:USER_ID,$amount,now())
				ON DUPLICATE KEY UPDATE `amount`=`amount`+$amount;
			");
			$database->mysqli_execute($prepare, array(
				":USER_ID" => SessionModel::getUserID()
			));

			// Commit the changes when no error found.
			$database->mysqli_commit($connection);
			return true;

		} catch(Exception $e){
			echo $e->getMessage();

			//Rollback the transaction.
			$database->mysqli_rollback($connection);
			return false;
		}
	}

	public static function cancel_withdraw(){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();
		$database->mysqli_begin_transaction($connection);

		try {
			// Check the remaining balance
			$prepare = $database->mysqli_prepare($connection, "
				SELECT `amount` FROM `withdrawal_request` WHERE `cid`=:USER_ID
			");
			$database->mysqli_execute($prepare, array(
				":USER_ID" => SessionModel::getUserID()
			));
			$balance = $database->mysqli_fetch_assoc($prepare)[0]["amount"];

			// Increase e_wallet amount
			$prepare = $database->mysqli_prepare($connection, "
				UPDATE `e_wallet` SET `amount`=`amount`+:AMOUNT WHERE `cid`=:USER_ID;
			");
			$database->mysqli_execute($prepare, array(
				":USER_ID" => SessionModel::getUserID(),
				":AMOUNT" => $balance
			));

			// Delete request
			$prepare = $database->mysqli_prepare($connection, "
				DELETE FROM `withdrawal_request` WHERE `cid`=:USER_ID
			");
			$database->mysqli_execute($prepare, array(
				":USER_ID" => SessionModel::getUserID()
			));

			// Commit the changes when no error found.
			$database->mysqli_commit($connection);
			return true;

		} catch(Exception $e){
			echo $e->getMessage();

			//Rollback the transaction.
			$database->mysqli_rollback($connection);
			return false;
		}
	}
}