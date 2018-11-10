<?php
class UniPathModel {
    public static function addPending(String $loanType){
	    // Database connection
	    $database = DatabaseModel::initConnections();
	    $connection = DatabaseModel::getMainConnection();

	    $database->mysqli_begin_transaction($connection);

	    try {
		    // Save the account auth data
		    $prepared = $database->mysqli_prepare($connection, "
                INSERT INTO `pending_requests`(`user_id`, `parent_id`, `type`) 
                		VALUES (:USER_ID, :PARENT_ID, 'unilevel');
            ");

		    $database->mysqli_execute($prepared, array(
			    ":USER_ID" => SessionModel::getUserID(),
			    ":PARENT_ID" => SessionModel::getParentID()
		    ));

		    // Save the insert id
		    $id = $database->mysqli_insert_id($connection);

		    // Save the account auth data
		    $prepared = $database->mysqli_prepare($connection, "
               INSERT INTO `uni_packg`(`tid`, `packg_type`) VALUES (:TID, :PACKG_TYPE)
            ");

		    $database->mysqli_execute($prepared, array(
			    ":TID" => $id, ":PACKG_TYPE" => $loanType
		    ));

		    // Commit the changes when no error found.
		    $database->mysqli_commit($connection);
		    return true;

	    } catch(Exception $e){
		    /**
		     * An exception has occured, which means that one of our database queries
		     * failed. Print out the error message.
		     */
		    echo $e->getMessage();

		    //Rollback the transaction.
		    $database->mysqli_rollback($connection);
		    return false;
	    }
    }
}
