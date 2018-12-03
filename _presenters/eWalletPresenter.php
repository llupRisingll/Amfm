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
    }

    public function post(){
        Route::returnCode(401);
    }

    public function put(){
        Route::returnCode(401);
    }

    public function delete(){
        Route::returnCode(401);
    }
}
    