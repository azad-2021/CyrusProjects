<?php 
include"connection.php";
include"session.php";

//$UserID=1;
date_default_timezone_set('Asia/Calcutta');
$timestamp =date('y-m-d H:i:s');
$Date = date('Y-m-d',strtotime($timestamp));

if ($_SESSION['Designation']=='Field Employee') {
	header("Location:fieldlogin/");
}

?>
