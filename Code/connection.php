<?php 

$host = "192.168.1.2";  
$user = "Ashok";  
$password = 'Cyrus@123';  

$db = "cyrusproject";


$con = mysqli_connect($host, $user, $password, $db);  
if(mysqli_connect_errno()) {  
  die("Failed to connect with MySQL: ". mysqli_connect_error());  
}

//Tables

$org="organization";
$div="division";
$site="site";
$orders="orders";
$demands="demands";
$units="units";
$temprequirement='temprequirement';
$DemandDetails='demand_details';
?>  