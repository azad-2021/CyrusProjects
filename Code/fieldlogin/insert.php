<?php 
include"connection.php";
include"session.php";

$MaterialID=!empty($_POST['MaterialID'])?$_POST['MaterialID']:'';
if (!empty($MaterialID))
{
	$WorkID=!empty($_POST['WorkID'])?$_POST['WorkID']:'';
	$Qty=!empty($_POST['Qty'])?$_POST['Qty']:'';

	$Query="SELECT * FROM tempconsumed WHERE MaterialID=$MaterialID and WorkID=$WorkID";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{
		echo "Material already exist";
	}else{
		
		$sql = "INSERT INTO tempconsumed (WorkID, MaterialID, CQty)
		VALUES ($WorkID, $MaterialID, $Qty)";

		if ($con->query($sql) === TRUE) {
			echo 1;
		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}


	}
}


$GetUnit=!empty($_POST['GetUnit'])?$_POST['GetUnit']:'';
if (!empty($GetUnit))
{
	$Query="SELECT Unit FROM demand_details WHERE MaterialID=$GetUnit";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{
		$arr=mysqli_fetch_assoc($result);
		echo $arr['Unit'];

	}

}

$DelMC=!empty($_POST['DelMC'])?$_POST['DelMC']:'';
if (!empty($DelMC))
{

	$sql = "DELETE FROM tempconsumed WHERE ID=$DelMC";

	if ($con->query($sql) === TRUE) {

		echo 1;
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
	

}



$MaterialEx=!empty($_POST['MaterialEx'])?$_POST['MaterialEx']:'';
if (!empty($MaterialEx))
{
	$WorkIDEx=!empty($_POST['WorkIDEx'])?$_POST['WorkIDEx']:'';
	$QtyEx=!empty($_POST['QtyEx'])?$_POST['QtyEx']:'';
	$RateEx=!empty($_POST['RateEx'])?$_POST['RateEx']:'';
	$UnitEx=!empty($_POST['UnitEx'])?$_POST['UnitEx']:'';

	$Query="SELECT * FROM tempexpense WHERE MaterialName='$MaterialEx' and WorkID=$WorkIDEx";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{
		echo "Material already exist";
	}else{
		
		$sql = "INSERT INTO tempexpense (WorkID, MaterialName, Rate, Qty, Unit)
		VALUES ($WorkIDEx, '$MaterialEx', $RateEx, $QtyEx, '$UnitEx')";

		if ($con->query($sql) === TRUE) {
			echo 1;
		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}


	}
}



$DelEx=!empty($_POST['DelEx'])?$_POST['DelEx']:'';
if (!empty($DelEx))
{

	$sql = "DELETE FROM tempexpense WHERE ID=$DelEx";

	if ($con->query($sql) === TRUE) {

		echo 1;
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
	

}


$AddEmployee=!empty($_POST['AddEmployee'])?$_POST['AddEmployee']:'';
if (!empty($AddEmployee))
{
	$WorkIDAE=!empty($_POST['WorkIDAE'])?$_POST['WorkIDAE']:'';
	$EmployeeNameAE=!empty($_POST['EmployeeNameAE'])?$_POST['EmployeeNameAE']:'';

	$Query="SELECT * FROM tempemployee WHERE EmployeeCode=$AddEmployee and WorkID=$WorkIDAE";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{
		echo "Employee already exist";
	}else{
		
		$sql = "INSERT INTO tempemployee (WorkID, EmployeeName, EmployeeCode)
		VALUES ($WorkIDAE, '$EmployeeNameAE', $AddEmployee)";

		if ($con->query($sql) === TRUE) {
			echo 1;
		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}


	}
}


$DelAE=!empty($_POST['DelAE'])?$_POST['DelAE']:'';
if (!empty($DelAE))
{

	$sql = "DELETE FROM tempemployee WHERE ID=$DelAE";

	if ($con->query($sql) === TRUE) {

		echo 1;
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
	

}