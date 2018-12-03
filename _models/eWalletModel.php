<?php

class eWalletModel {
	public static function fetch_bin_wallet(){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();

		$prepare = $database->mysqli_prepare($connection, "
			SELECT balance FROM `bin_wallet` bw
			INNER JOIN `bin_info` bi ON bi.bwid=bw.id
			WHERE bi.cid=:USER_ID LIMIT 1
		");

		$database->mysqli_execute($prepare, array(
			":USER_ID" => SessionModel::getUserID()
		));

		$result = $database->mysqli_fetch_assoc($prepare);

		if (count($result)){
			return ($result[0]["balance"]);
		}

		return 0;
	}

	public static function fetch_uni_wallet(){
		$database = DatabaseModel::initConnections();
		$connection = DatabaseModel::getMainConnection();

		$prepare = $database->mysqli_prepare($connection, "
			SELECT balance FROM `uni_wallet` uw
			INNER JOIN `uni_info` ui ON ui.uwid=uw.id
			WHERE ui.cid=:USER_ID LIMIT 1
		");

		$database->mysqli_execute($prepare, array(
			":USER_ID" => SessionModel::getUserID()
		));

		$result = $database->mysqli_fetch_assoc($prepare);

		if (count($result)){
			return ($result[0]["balance"]);
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
}