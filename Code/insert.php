<?php 
include"connection.php";
include"session.php";


date_default_timezone_set('Asia/Calcutta');
$timestamp =date('y-m-d H:i:s');
$Date = date('Y-m-d',strtotime($timestamp));
$m=date('m',strtotime($timestamp));
$y=date('y',strtotime($timestamp));
$EmployeeCode=$_SESSION['userid'];

if ($m<=3) {
	$FY=($y-1).$y;

}else{
	$FY=$y.($y+1);
}


$ConsigneeName=!empty($_POST['ConsigneeName'])?$_POST['ConsigneeName']:'';
if (!empty($ConsigneeName))
{

	$sql = "INSERT INTO consignee (ConsigneeName)
	VALUES ('$ConsigneeName')";

	if ($con->query($sql) === TRUE) {
		echo 1;
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
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
	$StateCodeDiv=!empty($_POST['StateCodeDiv'])?$_POST['StateCodeDiv']:'';

	$sql = "INSERT INTO $div (OrganizationCode, DivisionName, StateCode)
	VALUES ($OrgCode, '$NewDiv', $StateCodeDiv)";

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
	$PGType=!empty($_POST['PGType'])?$_POST['PGType']:'';
	$AMCIncludedMonth=!empty($_POST['AMCIncludedMonth'])?$_POST['AMCIncludedMonth']:'';
	$ValidTillDate=!empty($_POST['ValidTillDate'])?$_POST['ValidTillDate']:'';

	if (!empty($AMCIncludedMonth)) {
		$sql = "INSERT INTO $orders (DivisionCode, Description, OrderNo, OrderDate, CompletionDate, PGAmount, PGDate, Warranty, OrderingAuth, BillingAuth, PGTypeID, AMCIncluded, AMCPeriod, PGValidDate)
		VALUES ($DivisionCodeO, '$Description', '$LOANumber', '$LOADate', '$Completion', $BGAmount, '$BGDate', $Warranty, '$OderingAuth', '$BillingAuth', $PGType, 1, $AMCIncludedMonth, '$ValidTillDate')";
	}else{

		$sql = "INSERT INTO $orders (DivisionCode, Description, OrderNo, OrderDate, CompletionDate, PGAmount, PGDate, Warranty, OrderingAuth, BillingAuth, PGTypeID, PGValidDate)
		VALUES ($DivisionCodeO, '$Description', '$LOANumber', '$LOADate', '$Completion', $BGAmount, '$BGDate', $Warranty, '$OderingAuth', '$BillingAuth', $PGType, '$ValidTillDate')";
	}
	if ($con->query($sql) === TRUE) {

		$OrderID=$con->insert_id;
		$_SESSION["NewOrderID"]=$OrderID;
		$sql2 = "INSERT INTO $demands (OrderID, OrderDate, StatusID)
		VALUES ($OrderID, '$Date', 1)";

		if ($con->query($sql2) === TRUE) {
			echo $OrderID;
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
	$BillingType=!empty($_POST['BillingType'])?$_POST['BillingType']:0;
	
	$MaterialName=str_replace("/"," or",$MaterialName);
	$Schedule=str_replace("/","or",$Schedule);

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

		$MaterialName=str_replace("'", "", $MaterialName);
		$Schedule=str_replace("'", "", $Schedule);

		$sql = "INSERT INTO $temprequirement (OrderID, SrNo, MaterialName, Qty, Unit, Rate, InspectingAuth, BillingType)
		VALUES ($OrderIDRequirement, '$Schedule', '$MaterialName', $RequirementQty, '$UnitRequirement', $RequirementRate, '$IAuth', $BillingType)";

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
	$DistrictCodeSite=!empty($_POST['DistrictCodeSite'])?$_POST['DistrictCodeSite']:'';

	$Query="SELECT SiteName FROM site WHERE SiteName='$SiteName' and DivisionCode=$DivisionCodeS";
	$result=mysqli_query($con,$Query);


	if (mysqli_num_rows($result)>0)
	{
		echo 'Site already exist';

	}else{
		$sql = "INSERT INTO site (DivisionCode, SiteName, Address, Consignee, DistrictCode)
		VALUES ($DivisionCodeS, '$SiteName', '$SiteAddress', '$Consignee', $DistrictCodeSite)";

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

	$sql = "DELETE FROM $temprequirement WHERE TID=$DelRID";

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
	$DistrictCodeV=!empty($_POST['DistrictCodeV'])?$_POST['DistrictCodeV']:'';

	if ($AVType=='New') {

		$sql = "INSERT INTO vendors (VendorName, Contact, Email, Address, GSTNo, DistrictCode)
		VALUES ('$VendorNameAV', '$Contact', '$EmailAV', '$AddressAV', '$GSTNoAV', $DistrictCodeV)";

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
		$sql = "INSERT INTO vendor_details (OrderID, VendorID, MaterialID)
		VALUES ($OrderIDAV, $VendorNameAV, $MaterialIDAV)";

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

			//$err=1;

			echo "Error: " . $sql . "<br>" . $con->error;
		}

	}


	$sql = "INSERT INTO po (OrderID, ShippingAddress, PONo, UserID)
	VALUES ($OrderIDGenPO, '$Shipping', '$NewPONo', $EmployeeCode)";

	if ($con->query($sql) === TRUE) {

		$POID=$con->insert_id;
		$_SESSION['PONo']=$NewPONo;



		for ($i=0; $i < count($OfferIDGenPO); $i++) { 

			$query = "SELECT MaterialID FROM cyrusproject.offers WHERE OfferID=$OfferIDGenPO[$i];";
			$result=mysqli_query($con,$query);
			if (mysqli_num_rows($result)>0)
			{
				$row=mysqli_fetch_assoc($result);
				$MaterialID=$row["MaterialID"];

				$sqlm = "UPDATE cyrusproject.demand_details SET Status=4 WHERE MaterialID=$MaterialID";

				if ($con->query($sqlm) === TRUE) {

					//echo 1;
				} else {
					echo "Error: " . $sqlm . "<br>" . $con->error;
				}

			}


			$sql2 = "INSERT INTO po_details (POID, OfferID, POQty)
			VALUES ($POID, $OfferIDGenPO[$i], $POQty[$i])";
			if ($con->query($sql2) === TRUE) {
				
			} else {
				//$err=1;
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
	$OrderIDSurvey=!empty($_POST['OrderIDSurvey'])?$_POST['OrderIDSurvey']:'';
	$sql = "UPDATE sitesurvey SET Status=1 WHERE SiteCode=$SaveSurveyData";

	if ($con->query($sql) === TRUE) {

		$sql2 = "UPDATE orders SET OrderStatusID=3 WHERE OrderID=$OrderIDSurvey";
		if ($con->query($sql2) === TRUE) {

			echo 1;
		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
	

}

//UPDATE Ready Qty
$ReadyQtyE=!empty($_POST['ReadyQtyE'])?$_POST['ReadyQtyE']:'';
if (!empty($ReadyQtyE))
{

	$ID=!empty($_POST['ID'])?$_POST['ID']:'';

	$query = "SELECT MaterialID FROM cyrusproject.po_details
	join offers on po_details.OfferID=offers.OfferID WHERE po_details.ID=$ID";
	$result=mysqli_query($con,$query);
	if (mysqli_num_rows($result)>0)
	{
		$row=mysqli_fetch_assoc($result);
		$MaterialID=$row["MaterialID"];
	}

	$sql = "UPDATE cyrusproject.po_details SET ReadyQty=$ReadyQtyE WHERE ID=$ID";

	if ($con->query($sql) === TRUE) {

		$sql = "UPDATE cyrusproject.demand_details SET Status=5 WHERE MaterialID=$MaterialID";

		if ($con->query($sql) === TRUE) {

			echo 1;
		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
	

}

//UPDATE Ready Qty
$POIDCH=!empty($_POST['POIDCH'])?$_POST['POIDCH']:'';
if (!empty($POIDCH))
{
	$RateCH=!empty($_POST['RateCH'])?$_POST['RateCH']:'';
	$OrderIDCH=!empty($_POST['OrderIDCH'])?$_POST['OrderIDCH']:'';
	$MovementIDCH=!empty($_POST['MovementIDCH'])?$_POST['MovementIDCH']:'';
	$ShippingAddressCH=!empty($_POST['ShippingAddressCH'])?$_POST['ShippingAddressCH']:'';
	$StateCodeCH=!empty($_POST['StateCodeCH'])?$_POST['StateCodeCH']:'';

	$SiteCodeCH=!empty($_POST['SiteCodeCH'])?$_POST['SiteCodeCH']:'';

	$Query="SELECT ChallanNo FROM cyrusproject.deliverychallan order by ChallanID desc LIMIT 1";
	$result=mysqli_query($con,$Query);

	if (mysqli_num_rows($result)>0)
	{

		$arr=mysqli_fetch_assoc($result);
		$ChallanNo=$arr['ChallanNo'];
		$ChallanNo=(int)substr($ChallanNo, 8)+1;
		$ChallanNo=$FY.'CEUP'.$ChallanNo;
	}else{
		$ChallanNo=$FY.'CEUP1';
	}
	

	$Query="SELECT PONo FROM cyrusproject.po WHERE POID=$POIDCH[0]";
	$result=mysqli_query($con,$Query);

	if (mysqli_num_rows($result)>0)
	{

		$arr=mysqli_fetch_assoc($result);
		$PONo=$arr['PONo'];

	}

	$err=0;
	for ($i=0; $i < count($POIDCH); $i++) { 


		$Query="SELECT MaterialID, ReadyQty FROM cyrusproject.po_details
		join offers on po_details.OfferID=offers.OfferID
		where POID=$POIDCH[$i]";
		$result=mysqli_query($con,$Query);

		if (mysqli_num_rows($result)>0)
		{

			$arr=mysqli_fetch_assoc($result);
			$MaterialID=$arr['MaterialID'];
			$ReadyQty=$arr['ReadyQty'];

			$sql = "INSERT INTO `challan detail` (MaterialID, ReadyQty, ChallanNo, Rate)
			VALUES ($MaterialID, $ReadyQty, '$ChallanNo', $RateCH[$i])";

			if ($con->query($sql) === TRUE) {



				if (!empty($StateCodeCH)) {

					$sql2 = "UPDATE cyrusproject.sitesurvey SET Satus=2 WHERE MaterialID=$MaterialID";

					if ($con->query($sql2) === TRUE) {

					} else {
						$err=1;
						echo "Error: " . $sql2 . "<br>" . $con->error;
					}
				}



			} else {
				echo "Error: " . $sql . "<br>" . $con->error;
				$err=1;
				break;
			}
		}

	}

	if ($err==0) {


		if (!empty($StateCodeCH)) {
			$sql = "INSERT INTO deliverychallan (OrderID, PONo, MovementID, ShippingAddress, StateCode, SiteCode, ChallanDate, ChallanNo)
			VALUES ($OrderIDCH, '$PONo', $MovementIDCH, '$ShippingAddressCH', $StateCodeCH, $SiteCodeCH, '$Date', '$ChallanNo')";

		}else{

			$sql = "INSERT INTO deliverychallan (OrderID, PONo, MovementID, ShippingAddress, StateCode, ChallanDate, ChallanNo)
			VALUES ($OrderIDCH, '$PONo', $MovementIDCH, '$ShippingAddressCH', $StateCodeCH, '$Date', '$ChallanNo')";

		}


		if ($con->query($sql) === TRUE) {

			echo 1;
			$_SESSION['ChallanNo']=$ChallanNo;

		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}
	}

}

$OrderIDAW=!empty($_POST['OrderIDAW'])?$_POST['OrderIDAW']:'';
if (!empty($OrderIDAW))
{
	$SiteCodeAW=!empty($_POST['SiteCodeAW'])?$_POST['SiteCodeAW']:'';
	$MaterialIDAW=!empty($_POST['MaterialIDAW'])?$_POST['MaterialIDAW']:'';
	$QtyAW=!empty($_POST['QtyAW'])?$_POST['QtyAW']:'';
	$WorkTypeAW=!empty($_POST['WorkTypeAW'])?$_POST['WorkTypeAW']:'';
	$SDateAW=!empty($_POST['SDateAW'])?$_POST['SDateAW']:'';
	$EDateAW=!empty($_POST['EDateAW'])?$_POST['EDateAW']:'';

	if ($QtyAW<=0)
	{

		echo "Quantity must be greator than 0";

	}else{

		$sql = "INSERT INTO sitework (OrderID, SiteCode, MaterialID, WorkTypeID, Qty, StartDate, EndDate)
		VALUES ($OrderIDAW, $SiteCodeAW, $MaterialIDAW, $WorkTypeAW, $QtyAW, '$SDateAW', '$EDateAW')";

		if ($con->query($sql) === TRUE) {

			echo 1;


		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}

	}
}

/*
$OrderIDAW=!empty($_POST['OrderIDAW'])?$_POST['OrderIDAW']:'';
if (!empty($OrderIDAW))
{
	$SiteCodeAW=!empty($_POST['SiteCodeAW'])?$_POST['SiteCodeAW']:'';
	$MaterialIDAW=!empty($_POST['MaterialIDAW'])?$_POST['MaterialIDAW']:'';
	$QtyAW=!empty($_POST['QtyAW'])?$_POST['QtyAW']:'';
	$WorkTypeAW=!empty($_POST['WorkTypeAW'])?$_POST['WorkTypeAW']:'';
	$SDateAW=!empty($_POST['SDateAW'])?$_POST['SDateAW']:'';
	$EDateAW=!empty($_POST['EDateAW'])?$_POST['EDateAW']:'';
	



	$Query="SELECT * FROM cyrusproject.sitework WHERE MaterialID=$MaterialIDAW and SiteCode=$SiteCodeAW";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{

		echo "Material already exist";

	}else{

		$sql = "INSERT INTO sitework (OrderID, SiteCode, MaterialID, WorkTypeID, Qty, StartDate, EndDate)
		VALUES ($OrderIDAW, $SiteCodeAW, $MaterialIDAW, $WorkTypeAW, $QtyAW, '$SDateAW', '$EDateAW')";

		if ($con->query($sql) === TRUE) {

			echo 1;


		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}

	}
}
*/

$Vremark=!empty($_POST['Vremark'])?$_POST['Vremark']:'';
if (!empty($Vremark))
{
	$VRID=!empty($_POST['VRID'])?$_POST['VRID']:'';
	$Verification=!empty($_POST['Verification'])?$_POST['Verification']:'';

	if ($Verification=='Rejected') {
		$Vremark=$Verification.' '.$Vremark;
		$Accepted=0;
	}else{
		$Accepted=1;
	}

	$sql = "UPDATE work_verification SET VerificationRemark='$Vremark', VerificationByID=$EmployeeCode, VerificationDate='$Date', Accepted=$Accepted, Closed=$Accepted WHERE VerificationID =$VRID";

	if ($con->query($sql) === TRUE) {

		echo 1;
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
	

}

$EmployeeAssign=!empty($_POST['EmployeeAssign'])?$_POST['EmployeeAssign']:'';
if (!empty($EmployeeAssign))
{
	$WorkIDAssign=!empty($_POST['WorkIDAssign'])?$_POST['WorkIDAssign']:'';
	$sql = "UPDATE sitework SET EmployeeCode=$EmployeeAssign, AssignDate='$Date' WHERE WorkID=$WorkIDAssign";

	if ($con->query($sql) === TRUE) {

		$sql2 = "UPDATE orders inner join sitework on orders.OrderID=sitework.OrderID SET OrderStatusID=4 WHERE WorkID=$WorkIDAssign";
		if ($con->query($sql2) === TRUE) {

			echo 1;
		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}
	

}

//Update DOC

$NewDOC=!empty($_POST['NewDOC'])?$_POST['NewDOC']:'';
if (!empty($NewDOC))
{	
	$DOC=!empty($_POST['DOC'])?$_POST['DOC']:'';
	$OrderIDDOC=!empty($_POST['OrderIDDOC'])?$_POST['OrderIDDOC']:'';
	$file = $_FILES['file'];

  // validate file size
	if ($file['size'] > 2 * 1024 * 1024) {
		echo 'File size must be less than 2MB.';
		exit;
	}

  // validate file type
	if ($file['type'] != 'application/pdf') {
		echo 'File must be in PDF format.';
		exit;
	}

	$uploadDir = 'NewDOCDocument/';
	

	
	$sql = "UPDATE orders SET CompletionDate='$NewDOC' WHERE OrderID=$OrderIDDOC";
	if ($con->query($sql) === TRUE) {

		$sql = "INSERT INTO dochistory (OrderID, CompletionDate, Updatedby, UpdatedOn)
		VALUES ($OrderIDDOC, '$DOC', $EmployeeCode, '$Date')";

		if ($con->query($sql) === TRUE) {
			$last_id = $con->insert_id;
			$uploadFile = $uploadDir . basename($last_id.'.pdf');
			if (move_uploaded_file($file['tmp_name'], $uploadFile)) {
				echo 1;
			}
		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}

}


//Update PG

$NewPG=!empty($_POST['NewPG'])?$_POST['NewPG']:'';
if (!empty($NewPG))
{	
	$PG=!empty($_POST['PG'])?$_POST['PG']:'';
	$OrderIDPG=!empty($_POST['OrderIDPG'])?$_POST['OrderIDPG']:'';

	$file = $_FILES['file2'];

  // validate file size
	if ($file['size'] > 2 * 1024 * 1024) {
		echo 'File size must be less than 2MB.';
		exit;
	}

  // validate file type
	if ($file['type'] != 'application/pdf') {
		echo 'File must be in PDF format.';
		exit;
	}

	$uploadDir = 'NewPGDocument/';

	$sql = "UPDATE orders SET PGValidDate='$NewPG' WHERE OrderID=$OrderIDPG";
	if ($con->query($sql) === TRUE) {

		$sql = "INSERT INTO pghistory (OrderID, PGDate, Updatedby, UpdatedOn)
		VALUES ($OrderIDPG, '$PG', $EmployeeCode, '$Date')";

		if ($con->query($sql) === TRUE) {
			$last_id = $con->insert_id;
			$uploadFile = $uploadDir . basename($last_id.'.pdf');
			if (move_uploaded_file($file['tmp_name'], $uploadFile)) {
				echo 1;
			}
		} else {
			echo "Error: " . $sql . "<br>" . $con->error;
		}
	} else {
		echo "Error: " . $sql . "<br>" . $con->error;
	}

}

?>
