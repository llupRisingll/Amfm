<?php

class UniLevelEarningModel {
	public static $treeArray = [];
	private static $yourPackage = "b";

	private static function get_parent_level($parent_id, $target_ancestor){

		if (!isset(self::$treeArray[$target_ancestor])){
			return false;
		}

		foreach (self::$treeArray[$target_ancestor] as $key => $value){
			foreach ($value as $val){
				if ($parent_id == $val){
					return $key;
				}
			}
		}
		return false;
	}

	private static function package_lower_than($packageType){
		// Value/Importance of a package Representation
		$packageSort = [
			"b" => 1,
			"s" => 2,
			"g" => 3,
			"d" => 4,
			"v" => 5,
		];

		// Check whether you invited a higher package
		return ($packageSort[$packageType] > $packageSort[self::$yourPackage]);
	}

	private static function money_value($packageType){
		switch ($packageType){
			case "b": return 10;
			case "s": return 15;
			case "g": return 20;
			case "d": return 25;
			case "v": return 30;
			default: return 10;
		}
	}

	public static function classify_tree_levels($userID, $loop_handler=[]){
		// Fetch From the Database
		$nodeList = DB_UnilevelEarning::fetch_unilevel_children($userID);

		$result = array();
		foreach ($nodeList as $element) {
			$result[$element['parent']][] = $element["desc"];

			// Save the package
			if ($element["desc"] == $userID){
				self::$yourPackage = $element["loan_type"];
				continue;
			}

			// Execute the Loop handlers
			if (isset($loop_handler) && !empty($loop_handler)){
				$loop_handler($element);
			}
		}

		$sortIndex = array_keys($result);

		// Resort the SortIndex According to the required parent
		foreach(array_keys($result) as $iterParent){
			// Iterate the parents
			foreach ($result as $parent => $values){
				foreach ($values as $value){

					// When descendant of the other parent
					if ($value == $iterParent){
						if (($position = array_search($parent, $sortIndex)+1) !== false){
							array_splice( $sortIndex, $position, 0, $iterParent);
						}

						if (($key = array_search($iterParent, $sortIndex)) !== false) {
							unset($sortIndex[$key]);
						}

						// Resort the index
						$sortIndex = array_values($sortIndex);
					}
				}
			}
		}

		// Generate the treeLevels according to the sortIndex
		foreach ($sortIndex as $index => $val){
			$treeLevel[$index+1] = $result[$val];
		}

		self::$treeArray[$userID] =  $treeLevel;

/*
 * OBSOLETE ALGORITHM
 *
		// Classify the nodes/ Generate Leveled Data
		foreach ($nodeList as $nodes){
			$parent = $nodes["parent"];
			$child = $nodes["desc"];

			// Exclude yourself and put your data in a variable
			if ($child == $userID){
				self::$yourPackage = $nodes["loan_type"];
				continue;
			}

			// Execute the Loop handlers
			if (isset($loop_handler) && !empty($loop_handler)){
				$loop_handler($nodes);
			}

			// When it is a direct invite
			if ($parent == $userID){
				self::$treeArray[$userID][1][] = $child;
				continue;
			}

			// The key return is the current level of our node
			$key = self::get_parent_level($parent, $userID) + 1;

			// Add the child
			self::$treeArray[$userID][$key][] =  $child;
		}*/
	}

	private static function compute_direct_earning($nodes, $target_anc){
		$totalEarnings = 0;
		$package = $nodes["loan_type"];
		$parent = $nodes["parent"];


		// Use your package Earning when the invitee has package higher than you..
		$currentLevel = self::get_parent_level($parent, $target_anc);

		if ($currentLevel <= 7 && !(bool) $nodes["mature"]){
			if (self::package_lower_than($package)){
				$amountEarned = self::money_value(self::$yourPackage);
			}else{
				$amountEarned = self::money_value($package);
			}
			$totalEarnings += $amountEarned;
		}

		return $totalEarnings;
	}

	public static function compute_total_earnings($userID){
		$parentList = DB_UnilevelEarning::fetch_unilevel_parents($userID);

		foreach ($parentList as $parent){
			self::classify_tree_levels($parent, function ($nodes) use ($parent, &$directEarning) {


				if (!isset($directEarning[$parent])){
					$directEarning[$parent] = 0;
				}

				$directEarning[$parent] += self::compute_direct_earning($nodes, $parent);
			});
		}

		return $directEarning;
	}

	public static function compute_child_earnings($userID){
		$parentList = DB_UnilevelEarning::fetch_unilevel_children($userID);

		// Fetch all of the nodes that is not yet matured

		foreach ($parentList as $parent){

			// Escape the matured accounts
			if ($parent["mature"] == 1){
				continue;
			}

			$parent = $parent["desc"];

			self::classify_tree_levels($parent, function ($nodes) use ($parent, &$directEarning) {


				if (!isset($directEarning[$parent])){
					$directEarning[$parent] = 0;
				}

				$directEarning[$parent] += self::compute_direct_earning($nodes, $parent);
			});
		}

		return $directEarning;
	}

}