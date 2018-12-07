<?php

class BinaryEarningModel {
	public static $treeArray = [];
	private static $pairArray = [];
	private static $parent_list = [];

	public static function get_parent_level($parent_id, $target_ancestor){
		foreach (self::$treeArray[$target_ancestor] as $key => $value){
			foreach ($value as $val){
				if ($parent_id == $val){
					return $key;
				}
			}
		}
		return false;
	}

	public static function classify_tree_levels($userID, $loop_handler=[]){
		// Fetch From the Database
		$nodeList = DB_BinaryEarningModel::fetch_binary_children($userID);

		// Classify the nodes/ Generate Leveled Data
		foreach ($nodeList as $nodes){
			$parent = $nodes["parent"];
			$child = $nodes["desc"];

			// Exclude yourself and put your data in a variable
			if ($child == $userID){
				continue;
			}

			if (isset($loop_handler) && !empty($loop_handler)){
				$loop_handler($nodes);
			}

			// When it is your primary nodes
			if ($parent == $userID){
				self::$treeArray[$userID][1][] = $child;
				continue;
			}

			// The key return is the current level of our node
			$key = self::get_parent_level($parent, $userID) + 1;

			// Add the child
			self::$treeArray[$userID][$key][] = $child;
		}
	}

	private static function classify_tree_parents($nodes, $target_ancestor){
		$parent = $nodes["parent"];
		$child = $nodes["desc"];

		// Add the child;
		self::$pairArray[$target_ancestor][$parent][] = $child;
	}

	private static function earn_direct_from($nodes, $userID){
		if ($nodes["binparent"] == $userID)
			return 100;

		return 0;
	}

	private static function compute_pair_earnings(){
		$totalEarnings = [];

		foreach (self::$pairArray as $parent => $p){

			// Loop the data within the namespace of the value
			foreach ($p as $pairs){
				// Constraints
				if (count($pairs) != 2)
					continue;

				//
				$currentLevel = self::get_parent_level($pairs[0], $parent);

				if ($currentLevel <= 7){
					$totalEarnings[$parent] += 1000;
					continue;
				}

				if ($currentLevel <=12){
					$totalEarnings[$parent] += 500;
					continue;
				}

				$totalEarnings[$parent] += 300;
			}
		}
		return $totalEarnings;
	}

	public static function compute_total_earnings($userID){
		// Retrieve All of the possible parent
		self::$parent_list = DB_BinaryEarningModel::fetch_binary_parents($userID);

		// Compute Total Earnings Amount in Direct Invitation
		$directEarnings = [];
		foreach (self::$parent_list as $parent){
			self::classify_tree_levels($parent, function ($nodes) use ($parent, &$directEarnings){
				self::classify_tree_parents($nodes, $parent);

				$directEarnings[$parent] += self::earn_direct_from($nodes, $parent);
			});
		}

		// Compute Total Earnings Amount in Pairs
		$pairEarning = self::compute_pair_earnings();

		// Combine the Earnings
		$totalEarnings = array();
		foreach (array_keys($directEarnings + $pairEarning) as $key) {
			$totalEarnings[$key] = @($pairEarning[$key] + $directEarnings[$key]);
		}

		return $totalEarnings;
	}

}