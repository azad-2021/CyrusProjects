<?php 
include"connection.php";
include"session.php";

date_default_timezone_set('Asia/Calcutta');
$timestamp =date('y-m-d H:i:s');
$Date = date('Y-m-d',strtotime($timestamp));

$UserName=!empty($_POST['UserName'])?$_POST['UserName']:'';
$Password=!empty($_POST['Password'])?$_POST['Password']:'';
if (!empty($UserName) and !empty($Password))
{
	$Query="SELECT EmployeeName, Designation, EmployeeCode FROM employees
	inner join designation on employees.DesignationID=designation.DesignationID
	WHERE EmployeeName='$UserName' and Password='$Password'";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{	
		$arr=mysqli_fetch_assoc($result);
		$_SESSION['username']=$arr['EmployeeName'];
		$_SESSION['Designation']=$arr['Designation'];
		$_SESSION['userid']=$arr['EmployeeCode'];
		$ID=$arr['EmployeeCode'];
		$sql = "INSERT INTO loginlogs (UserID)
		VALUES ($ID)";

		if ($con->query($sql) === TRUE) {

		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}


		echo 1;
	}else{
		echo "Incorrect user name or password";
	}

}


?>