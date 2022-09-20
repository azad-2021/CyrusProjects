<?php 
include"connection.php";
include"session.php";
$NewOrg=!empty($_POST['NewOrg'])?$_POST['NewOrg']:'';
if (!empty($NewOrg))
{

	$sql = "INSERT INTO $org (Organization)
	VALUES ('$NewOrg')";

	if ($con->query($sql) === TRUE) {
		echo 1;
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
}


$NewDiv=!empty($_POST['NewDiv'])?$_POST['NewDiv']:'';
$OrgCode=!empty($_POST['OrgCodeNDiv'])?$_POST['OrgCodeNDiv']:'';
if (!empty($NewDiv))
{

	$sql = "INSERT INTO $div (OrganizationCode, DivisionName)
	VALUES ($OrgCode, '$NewDiv')";

	if ($con->query($sql) === TRUE) {
		echo 1;
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
}


$DivisionCodeO=!empty($_POST['DivisionCodeO'])?$_POST['DivisionCodeO']:'';
$LOADate=!empty($_POST['LOADate'])?$_POST['LOADate']:'';
if (!empty($DivisionCodeO) and !empty($LOADate))
{

	$Completion=!empty($_POST['Completion'])?$_POST['Completion']:'';
	$BGAmount=!empty($_POST['BGAmount'])?$_POST['BGAmount']:'';
	$BGDate=!empty($_POST['BGDate'])?$_POST['BGDate']:'';
	$Warranty=!empty($_POST['Warranty'])?$_POST['Warranty']:'';
	$OderingAuth=!empty($_POST['OderingAuth'])?$_POST['OderingAuth']:'';
	$BillingAuth=!empty($_POST['BillingAuth'])?$_POST['BillingAuth']:'';
	$LOANumber=!empty($_POST['LOANumber'])?$_POST['LOANumber']:'';
	$Description=!empty($_POST['Description'])?$_POST['Description']:'';


	$sql = "INSERT INTO $orders (DivisionCode, Description, LOANo, LOADate, CompletionDate, BGAmount, BGDate, Warranty, OrderingAuth, BillingAuth)
	VALUES ($DivisionCodeO, '$Description', '$LOANumber', '$LOADate', '$Completion', $BGAmount, '$BGDate', $Warranty, '$OderingAuth', '$BillingAuth')";

	if ($con->query($sql) === TRUE) {
		$_SESSION["NewOrderID"]=$con->insert_id;
		echo 1;
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
}


$OrderIDRequirement=!empty($_POST['OrderIDRequirement'])?$_POST['OrderIDRequirement']:'';
$Schedule=!empty($_POST['Schedule'])?$_POST['Schedule']:'';
if (!empty($OrderIDRequirement) and !empty($Schedule))
{

	$MaterialName=!empty($_POST['MaterialName'])?$_POST['MaterialName']:'';
	$RequirementQty=!empty($_POST['RequirementQty'])?$_POST['RequirementQty']:'';
	$UnitRequirement=!empty($_POST['UnitRequirement'])?$_POST['UnitRequirement']:'';
	$IAuth=!empty($_POST['IAuth'])?$_POST['IAuth']:'';
	$RequirementRate=!empty($_POST['RequirementRate'])?$_POST['RequirementRate']:'';
	$Labour=!empty($_POST['Labour'])?$_POST['Labour']:'';
	
	$Query="SELECT MaterialName FROM $temprequirement WHERE MaterialName='$MaterialName'";
	$result=mysqli_query($con,$Query);

	//$Query="SELECT MaterialName FROM $temprequirement WHERE MaterialName='$MaterialName'";
	//$result=mysqli_query($con,$Query);


	if (mysqli_num_rows($result)>0)
	{
		echo 'Material already exist';

	}else{


		$sql = "INSERT INTO $temprequirement (OrderID, SrNo, MaterialName, Qty, Rate, InspectingAuth	, LabourWork)
		VALUES ($OrderIDRequirement, '$Schedule', '$MaterialName', $RequirementQty, $RequirementRate, '$IAuth', $Labour)";

		if ($con->query($sql) === TRUE) {

			echo 1;
		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}
	}

}

?>
