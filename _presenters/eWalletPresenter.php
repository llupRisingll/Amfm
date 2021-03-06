<?php
class eWalletPresenter {
    public function get(){
	    SessionModel::restrictNotLogged();

        View::addVar("view_title", "E-Wallet System");
        View::addVar("BODY_CLASS", "bg-light");
        View::addVar("username", SessionModel::getUser());
        View::addVar("FULL_NAME", SessionModel::getName());

        // Import the Bootstrap
        View::addCSS("http://".Route::domain()."/css/".md5("Bootstrap").".min.css");

        // Import JQUERy
        View::addScript("/_layouts/Binary/jquery.min.js");

        // Include the bootstrap JS
        View::addScript("http://".Route::domain()."/js/".md5("Bootstrap").".min.js");

	    View::addVar("E_BALANCE", eWalletModel::fetch_e_wallet());
	    View::addVar("BIN_BALANCE", eWalletModel::fetch_bin_wallet());
	    View::addVar("UNI_BALANCE", eWalletModel::fetch_uni_wallet());

	    View::addVar("PENDING_WITHDRAWAL", eWalletModel::fetch_pending_withdrawal());

	    Params::permit("cw");
	    if (Params::get("cw") != false){
	    	eWalletModel::cancel_withdraw();
	    	header("location: /eWallet");
	    	exit;
	    }
    }

    public function post(){
    	Params::permit("type", "amount");
    	if (Params::get("type") != false && Params::get("amount") != false){

    		// Throw away the no-use amount
		    if (Params::get("amount") <= 0){
			    // Reload the page
			    header("location: /eWallet");
			    exit;
		    }

    		if (Params::get("type") == "withdraw"){
				eWalletModel::withdraw_money(Params::get("amount"));

			    // Reload the page
			    header("location: /eWallet");
			    exit;
		    }

    		eWalletModel::transfer_to_wallet(Params::get("type"), Params::get("amount"));

    		// Reload the page
		    header("location: /eWallet");
		    exit;
	    }
    }

    public function put(){
        Route::returnCode(401);
    }

    public function delete(){
        Route::returnCode(401);
    }
}
    