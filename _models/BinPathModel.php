<?php
class BinPathModel {
    public function __construct() {

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
    