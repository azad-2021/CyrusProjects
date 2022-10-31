<?php 
include"connection.php";
include"session.php";


date_default_timezone_set('Asia/Calcutta');
$timestamp =date('y-m-d H:i:s');
$Date = date('Y-m-d',strtotime($timestamp));
$m=date('m',strtotime($timestamp));
$y=date('y',strtotime($timestamp));

if ($m<=3) {
	$FY=($y-1).$y;

}else{
	$FY=$y.($y+1);
}


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


$DesignationName=!empty($_POST['DesignationName'])?$_POST['DesignationName']:'';
if (!empty($DesignationName))
{

	$sql = "INSERT INTO designation (Designation)
	VALUES ('$DesignationName')";

	if ($con->query($sql) === TRUE) {
		echo 1;
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
}

$EmployeeName=!empty($_POST['EmployeeName'])?$_POST['EmployeeName']:'';
if (!empty($EmployeeName))
{
	$DesignationCode=!empty($_POST['DesignationCode'])?$_POST['DesignationCode']:'';
	$EmployeeContact=!empty($_POST['EmployeeContact'])?$_POST['EmployeeContact']:'';
	$EmployeeContact='+91'.$EmployeeContact;
	$EmployeeEmail=!empty($_POST['EmployeeEmail'])?$_POST['EmployeeEmail']:'';
	
	$EmployeeAddress=!empty($_POST['EmployeeAddress'])?$_POST['EmployeeAddress']:'';

	$Query="SELECT EmployeeName FROM cyrusproject.employees WHERE EmployeeName='$EmployeeName'";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{

		echo "Employee already exist";

	}else{

		$sql = "INSERT INTO cyrusproject.employees (EmployeeName, DesignationID, Contact, Email, Address)
		VALUES ('$EmployeeName', $DesignationCode, '$EmployeeContact', '$EmployeeEmail', '$EmployeeAddress')";

		if ($con->query($sql) === TRUE) {
			echo 1;
		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}
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

		$OrderID=$_SESSION["NewOrderID"];
		$sql2 = "INSERT INTO $demands (OrderID, OrderDate, StatusID)
		VALUES ($OrderID, '$Date', 1)";

		if ($con->query($sql2) === TRUE) {
			echo 1;
		} else {
			echo "Error: " . $sql2 . "<br>" . $con->error;
		}

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
	$Labour=!empty($_POST['Labour'])?$_POST['Labour']:0;
	
	$Query="SELECT MaterialName FROM $temprequirement WHERE MaterialName='$MaterialName' and OrderID=$OrderIDRequirement";
	$result=mysqli_query($con,$Query);

	$Query2="SELECT MaterialName FROM $DemandDetails WHERE MaterialName='$MaterialName' and OrderID=$OrderIDRequirement";
	$result2=mysqli_query($con,$Query2);


	if (mysqli_num_rows($result)>0)
	{
		echo 'Material already exist';

	}else if (mysqli_num_rows($result2)>0)
	{
		echo 'Material already exist';

	}else{


		$sql = "INSERT INTO $temprequirement (OrderID, SrNo, MaterialName, Qty, Unit, Rate, InspectingAuth, LabourWork)
		VALUES ($OrderIDRequirement, '$Schedule', '$MaterialName', $RequirementQty, '$UnitRequirement', $RequirementRate, '$IAuth', $Labour)";

		if ($con->query($sql) === TRUE) {

			echo 1;
		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}
	}

}



$DivisionCodeS=!empty($_POST['DivisionCodeS'])?$_POST['DivisionCodeS']:'';
if (!empty($DivisionCodeS))
{
	
	$SiteName=!empty($_POST['SiteName'])?$_POST['SiteName']:'';
	$SiteAddress=!empty($_POST['SiteAddress'])?$_POST['SiteAddress']:'';
	$Consignee=!empty($_POST['Consignee'])?$_POST['Consignee']:'';

	$Query="SELECT SiteName FROM site WHERE SiteName='$SiteName' and DivisionCode=$DivisionCodeS";
	$result=mysqli_query($con,$Query);


	if (mysqli_num_rows($result)>0)
	{
		echo 'Site already exist';

	}else{
		$sql = "INSERT INTO site (DivisionCode, SiteName, Address, Consignee)
		VALUES ($DivisionCodeS, '$SiteName', '$SiteAddress', '$Consignee')";

		if ($con->query($sql) === TRUE) {

			echo 1;
		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}
	}

}

$DelRID=!empty($_POST['DelRID'])?$_POST['DelRID']:'';
if (!empty($DelRID))
{

	$sql = "DELETE FROM $temprequirement WHERE ID=$DelRID";

	if ($con->query($sql) === TRUE) {

		echo 1;
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
	

}


$DelSite=!empty($_POST['DelSite'])?$_POST['DelSite']:'';
if (!empty($DelSite))
{

	$sql = "DELETE FROM site WHERE SiteCode=$DelSite";

	if ($con->query($sql) === TRUE) {

		echo 1;
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
	

}


$MaterialIDAV=!empty($_POST['MaterialIDAV'])?$_POST['MaterialIDAV']:'';
if (!empty($MaterialIDAV))
{
	$AVType=!empty($_POST['AVType'])?$_POST['AVType']:'';
	$AddressAV=!empty($_POST['AddressAV'])?$_POST['AddressAV']:'';
	$GSTNoAV=!empty($_POST['GSTNoAV'])?$_POST['GSTNoAV']:'';
	
	$OrderIDAV=!empty($_POST['OrderIDAV'])?$_POST['OrderIDAV']:'';
	$VendorNameAV=!empty($_POST['VendorNameAV'])?$_POST['VendorNameAV']:'';
	$Contact=!empty($_POST['Contact'])?$_POST['Contact']:'';
	$Contact='+91'.$Contact;
	$EmailAV=!empty($_POST['EmailAV'])?$_POST['EmailAV']:'';

	if ($AVType=='New') {

		$sql = "INSERT INTO vendors (OrderID, VendorName, Contact, Email, Address, GSTNo)
		VALUES ($OrderIDAV, '$VendorNameAV', '$Contact', '$EmailAV', '$AddressAV', '$GSTNoAV')";

		if ($con->query($sql) === TRUE) {

			$VendorID = $con->insert_id;
			echo 1;
			$sql2 = "INSERT INTO vendor_details (VendorID, MaterialID)
			VALUES ($VendorID, $MaterialIDAV)";

			if ($con->query($sql2) === TRUE) {

				
			} else {
				echo "Error: " . $sql2 . "<br>" . $con->error;
			}


		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}


	}else if ($AVType=='Existing') {
		$sql = "INSERT INTO vendor_details (VendorID, MaterialID)
		VALUES ($VendorNameAV, $MaterialIDAV)";

		if ($con->query($sql) === TRUE) {

			echo 1;
		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}

	}


}


$DelAV=!empty($_POST['DelAV'])?$_POST['DelAV']:'';
if (!empty($DelAV))
{

	$sql = "DELETE FROM vendors WHERE VendorID=$DelAV";

	if ($con->query($sql) === TRUE) {

		$sql = "DELETE FROM vendor_details WHERE VendorID=$DelAV";

		if ($con->query($sql) === TRUE) {

			echo 1;
		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}


	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
	

}

$MaterialIDOF=!empty($_POST['MaterialIDOF'])?$_POST['MaterialIDOF']:'';
if (!empty($MaterialIDOF))
{
	
	$Modal=!empty($_POST['Modal'])?$_POST['Modal']:'';
	$QtyOF=!empty($_POST['QtyOF'])?$_POST['QtyOF']:'';
	$RateOF=!empty($_POST['RateOF'])?$_POST['RateOF']:'';
	$inspection=!empty($_POST['inspection'])?$_POST['inspection']:'';
	$VendorOF=!empty($_POST['VendorOF'])?$_POST['VendorOF']:'';
	$GSTOF=!empty($_POST['GSTOF'])?$_POST['GSTOF']:'';
	$ModalNoOF=!empty($_POST['ModalNoOF'])?$_POST['ModalNoOF']:'';

	$sql = "INSERT INTO tempoffer (MaterialID, ItemName, Rate, Qty, Inspection, VendorID, GST, ModalNo)
	VALUES ($MaterialIDOF, '$Modal', $RateOF, $QtyOF,  '$inspection', $VendorOF, $GSTOF, '$ModalNoOF')";

	if ($con->query($sql) === TRUE) {

		echo 1;
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
}


$DelOF=!empty($_POST['DelOF'])?$_POST['DelOF']:'';
if (!empty($DelOF))
{

	$sql = "DELETE FROM tempoffer WHERE ID=$DelOF";

	if ($con->query($sql) === TRUE) {

		echo 1;
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
	

}


$FinalizedID=!empty($_POST['FinalizedID'])?$_POST['FinalizedID']:'';
if (!empty($FinalizedID))
{
	//print_r($FinalizedID);
	
	for ($i=0; $i < count($FinalizedID); $i++) { 


		$Query="SELECT MaterialID FROM cyrusproject.offers WHERE OfferID=$FinalizedID[$i]";
		$result=mysqli_query($con,$Query);
		if (mysqli_num_rows($result)>0)
		{

			$arr=mysqli_fetch_assoc($result);
			$MaterialID=$arr['MaterialID'];

		}

		$sql = "UPDATE offers SET Finalized=1, FinalizedDate='$Date' WHERE OfferID=$FinalizedID[$i]";

		if ($con->query($sql) === TRUE) {

			$sql2 = "UPDATE cyrusproject.demand_details SET Status=3 WHERE MaterialID=$MaterialID";

			if ($con->query($sql2) === TRUE) {
				echo 1;
			} else {
				echo "Error: " . $sql2 . "<br>" . $con->error;
			}


		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}
	}
}


$OfferIDGenPO=!empty($_POST['OfferIDGenPO'])?$_POST['OfferIDGenPO']:'';
if (!empty($OfferIDGenPO))
{
	//echo $OfferIDGenPO[0];
	$err=0;
	$Shipping=!empty($_POST['Shipping'])?$_POST['Shipping']:'';
	$Payment=!empty($_POST['Payment'])?$_POST['Payment']:'';
	$Warranty=!empty($_POST['Warranty'])?$_POST['Warranty']:'';
	$Delivery=!empty($_POST['Delivery'])?$_POST['Delivery']:'';
	$Other=!empty($_POST['Other'])?$_POST['Other']:'';
	$OrderIDGenPO=!empty($_POST['OrderIDGenPO'])?$_POST['OrderIDGenPO']:'';
	$POQty=!empty($_POST['POQty'])?$_POST['POQty']:'';

	$ShippingCharges=!empty($_POST['ShippingCharges'])?$_POST['ShippingCharges']:0;
	$OtherCharges=!empty($_POST['OtherCharges'])?$_POST['OtherCharges']:0;

	$Query="SELECT PONo FROM cyrusproject.po order by POID desc LIMIT 1";
	$result=mysqli_query($con,$Query);

	if (mysqli_num_rows($result)>0)
	{

		$arr=mysqli_fetch_assoc($result);
		$PONo=$arr['PONo'];
		$NewPONo=(int)substr($PONo, 6)+1;
		$NewPONo=$FY.'CE'.$NewPONo;
	}else{
		$NewPONo=$FY.'CE1';
	}


	$Query="SELECT TermID FROM cyrusproject.offers WHERE OfferID=$OfferIDGenPO[0]";
	$result=mysqli_query($con,$Query);

	if (mysqli_num_rows($result)>0)
	{

		$arr=mysqli_fetch_assoc($result);
		$TermID=$arr['TermID'];

		if (!empty($Other)) {
			$sql = "UPDATE `offer terms` SET PaymentTerms='$Payment', WarrantyTerms='$Warranty', DeliveryTerms='$Delivery', OtherTerms='$Other', ShippingCharges=$ShippingCharges, OtherCharges=$OtherCharges WHERE TermID=$TermID";
		}else{
			$sql = "UPDATE `offer terms` SET PaymentTerms='$Payment', WarrantyTerms='$Warranty', DeliveryTerms='$Delivery' WHERE TermID=$TermID";
		}


		if ($con->query($sql) === TRUE) {


		} else {

			$err=1;

			echo "Error: " . $sql . "<br>" . $con->error;
		}

	}


	$sql = "INSERT INTO po (OrderID, ShippingAddress, PONo)
	VALUES ($OrderIDGenPO, '$Shipping', '$NewPONo')";

	if ($con->query($sql) === TRUE) {

		$POID=$con->insert_id;
		$_SESSION['PONo']=$NewPONo;



		for ($i=0; $i < count($OfferIDGenPO); $i++) { 

			$sql2 = "INSERT INTO po_details (POID, OfferID, POQty)
			VALUES ($POID, $OfferIDGenPO[$i], $POQty[$i])";
			if ($con->query($sql2) === TRUE) {
				
			} else {
				$err=1;
				echo "Error: " . $sql2 . "<br>" . $con->error;
				break;
			}

		}



	} else {
		$err=1;
		echo "Error: " . $sql . "<br>" . $con->error;
	}

	if ($err==0) {
		echo 1;
	}
}

$MaterialSurvey=!empty($_POST['MaterialSurvey'])?$_POST['MaterialSurvey']:'';
if (!empty($MaterialSurvey))
{
	$OrderIDSurvey=!empty($_POST['OrderIDSurvey'])?$_POST['OrderIDSurvey']:'';
	$Qty=!empty($_POST['QtySurvey'])?$_POST['QtySurvey']:'';
	$SiteCodeSurvey=!empty($_POST['SiteCodeSurvey'])?$_POST['SiteCodeSurvey']:'';
	



	$Query="SELECT MaterialID FROM cyrusproject.sitesurvey WHERE MaterialID=$MaterialSurvey and SiteCode=$SiteCodeSurvey";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{

		echo "Material already exist";

	}else{

		$sql = "INSERT INTO sitesurvey (OrderID, SiteCode, MaterialID, Qty)
		VALUES ($OrderIDSurvey, $SiteCodeSurvey, $MaterialSurvey, $Qty)";

		if ($con->query($sql) === TRUE) {

			echo 1;


		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}

	}
}


$DelSurvey=!empty($_POST['DelSurvey'])?$_POST['DelSurvey']:'';
if (!empty($DelSurvey))
{

	$sql = "DELETE FROM sitesurvey WHERE SurveyID=$DelSurvey";

	if ($con->query($sql) === TRUE) {

		echo 1;
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
	

}


$SaveSurveyData=!empty($_POST['SaveSurveyData'])?$_POST['SaveSurveyData']:'';
if (!empty($SaveSurveyData))
{

	$sql = "UPDATE sitesurvey SET Status=1 WHERE SiteCode=$SaveSurveyData";

	if ($con->query($sql) === TRUE) {

		echo 1;
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
	

}

?>
