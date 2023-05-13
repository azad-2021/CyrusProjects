<?php 
include"connection.php";
include"session.php";

//Common Codes
$OrgCode=!empty($_POST['OrgCode'])?$_POST['OrgCode']:'';
if (!empty($OrgCode))
{
	$Query="SELECT DivisionCode, DivisionName FROM $div WHERE OrganizationCode=$OrgCode order by DivisionName";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{
		echo "<option value=''>Select Division</option>";
		while ($arr=mysqli_fetch_assoc($result))
		{
			echo '<option value="'.$arr['DivisionCode'].'">'.$arr['DivisionName']."</option>";

		}
	}

}

$DivisionCode=!empty($_POST['DivisionCode'])?$_POST['DivisionCode']:'';
if (!empty($DivisionCode))
{
	$Query="SELECT SiteName, SiteCode FROM $site WHERE DivisionCode=$DivisionCode order by SiteName";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{
		echo "<option value=''>Select Site</option>";
		while ($arr=mysqli_fetch_assoc($result))
		{
			echo '<option value="'.$arr['SiteCode'].'">'.$arr['SiteName']."</option>";

		}
	}

}

$StateCode=!empty($_POST['StateCode'])?$_POST['StateCode']:'';
if (!empty($StateCode))
{
	$Query="SELECT DistrictCode, DistrictName FROM district WHERE StateCode=$StateCode order by DistrictName";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{
		echo "<option value=''>Select District</option>";
		while ($arr=mysqli_fetch_assoc($result))
		{
			echo '<option value="'.$arr['DistrictCode'].'">'.$arr['DistrictName']."</option>";

		}
	}

}

$GetDistrict=!empty($_POST['GetDistrict'])?$_POST['GetDistrict']:'';
if (!empty($GetDistrict))
{
	$Query="SELECT DistrictCode, DistrictName FROM district WHERE StateCode=$GetDistrict order by DistrictName";
	$result=mysqli_query($con,$Query);
	echo "<option value=''>Select Site</option>";
	if (mysqli_num_rows($result)>0)
	{
		
		while ($arr=mysqli_fetch_assoc($result))
		{
			echo '<option value="'.$arr['DistrictCode'].'">'.$arr['DistrictName']."</option>";

		}
	}

}

$GetGST=!empty($_POST['GetGST'])?$_POST['GetGST']:'';
if (!empty($GetGST))
{
	$Query="SELECT GSTIN FROM division WHERE DivisionCode=$GetGST";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{
		$arr=mysqli_fetch_assoc($result);
		echo $arr['GSTIN'];

	}

}


$DivisionCodeOrder=!empty($_POST['DivisionCodeOrder'])?$_POST['DivisionCodeOrder']:'';
if (!empty($DivisionCodeOrder))
{
	$Query="SELECT OrderID FROM orders WHERE DivisionCode=$DivisionCodeOrder order by OrderID";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{
		echo "<option value=''>Select OrderID</option>";
		while ($arr=mysqli_fetch_assoc($result))
		{
			echo '<option value="'.$arr['OrderID'].'">'.$arr['OrderID']."</option>";

		}
	}

}

$OrderIDSurvey=!empty($_POST['OrderIDSurvey'])?$_POST['OrderIDSurvey']:'';
if (!empty($OrderIDSurvey))
{
	$Query="SELECT MaterialName, MaterialID FROM cyrusproject.demand_details WHERE OrderID=$OrderIDSurvey order by MaterialName";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{
		echo "<option value=''>Select Material</option>";
		while ($arr=mysqli_fetch_assoc($result))
		{
			echo '<option value="'.$arr['MaterialID'].'">'.$arr['MaterialName']."</option>";

		}
	}

}

$GetQtyOF=!empty($_POST['GetQtyOF'])?$_POST['GetQtyOF']:'';
if (!empty($GetQtyOF))
{
	$Query="SELECT Qty FROM demand_details WHERE MaterialID=$GetQtyOF";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{
		$arr=mysqli_fetch_assoc($result);
		echo $arr['Qty'];

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
//End Common code


//Site Survey

$GetQtySurvey=!empty($_POST['GetQtySurvey'])?$_POST['GetQtySurvey']:'';
if (!empty($GetQtySurvey))
{	
	$Query="SELECT (demand_details.Qty-(sum(sitesurvey.Qty))) as leftQty FROM cyrusproject.demand_details
	join sitesurvey on demand_details.MaterialID=sitesurvey.MaterialID WHERE sitesurvey.MaterialID=$GetQtySurvey";
	$result=mysqli_query($con,$Query);
	$arr=mysqli_fetch_assoc($result);

	$Query2="SELECT Qty FROM demand_details WHERE MaterialID=$GetQtySurvey";
	$result2=mysqli_query($con,$Query2);
	$arr2=mysqli_fetch_assoc($result2);
	if (!empty($arr['leftQty'])) {
		echo $arr['leftQty'];
	}else{
		echo $arr2['Qty'];
	}


}

//End Site Survey


$DivisionCodeRequirement=!empty($_POST['DivisionCodeRequirement'])?$_POST['DivisionCodeRequirement']:'';
if (!empty($DivisionCodeRequirement))
{	

	$ReqType=!empty($_POST['ReqType'])?$_POST['ReqType']:'';
	if ($ReqType=='Regular') {

		$Query="SELECT $orders.OrderID FROM $orders
		inner join $demands on $orders.OrderID=$demands.OrderID
		WHERE DivisionCode=$DivisionCodeRequirement and ConfirmationDate is null and StatusID <=2 order by $orders.OrderID";
	}else if($ReqType=='Variation'){
		$Query="SELECT $orders.OrderID FROM $orders
		inner join $demands on $orders.OrderID=$demands.OrderID
		WHERE DivisionCode=$DivisionCodeRequirement and ConfirmationDate is null and StatusID >1 order by $orders.OrderID";

	}

	$result=mysqli_query($con,$Query);
	echo "<option value=''>Order ID</option>";
	if (mysqli_num_rows($result)>0)
	{
		
		while ($arr=mysqli_fetch_assoc($result))
		{
			echo '<option value="'.$arr['OrderID'].'">'.$arr['OrderID']."</option>";

		}
	}

}


$OrderIDRequirement=!empty($_POST['OrderIDRequirement'])?$_POST['OrderIDRequirement']:'';
if (!empty($OrderIDRequirement))
{
	$Query="SELECT $orders.Description FROM $orders
	WHERE OrderID=$OrderIDRequirement";
	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{
		$arr=mysqli_fetch_assoc($result);
		echo $arr['Description'];

	}

}

$DivisionCodeO=!empty($_POST['DivisionCodeO'])?$_POST['DivisionCodeO']:'';

if (!empty($DivisionCodeO))
{   

	$query="SELECT * FROM site join district on site.DistrictCode=district.DistrictCode WHERE DivisionCode=$DivisionCodeO";
	$result=mysqli_query($con,$query);
	if (mysqli_num_rows($result)>0)
	{

		while ($row=mysqli_fetch_assoc($result))
		{
			
			print "<tr>";
			print '<td>'.$row["SiteName"]."</td>";
			print '<td>'.$row["Address"]."</td>";
			print '<td>'.$row["DistrictName"]."</td>";
			print '<td><input class="form-check-input" type="checkbox" name="SiteCodeO[]" value="'.$row["SiteCode"].'"></td>';
			print '</tr>';
		}

	}
}


$OrderIDTemp=!empty($_POST['OrderIDTemp'])?$_POST['OrderIDTemp']:'';

if (!empty($OrderIDTemp))
{   

	$query="SELECT * FROM $temprequirement join billingtype on $temprequirement.BillingType=billingtype.ID WHERE OrderID=$OrderIDTemp";
	$result=mysqli_query($con,$query);
	if (mysqli_num_rows($result)>0)
	{

		while ($row=mysqli_fetch_assoc($result))
		{
			
			print "<tr>";
			print '<td>'.$row["SrNo"]."</td>";
			print '<td style="word-wrap: break-word;">'.$row["MaterialName"]."</td>";
			print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
			print '<td>'.$row["Rate"]."</td>";
			print '<td>'.$row["Rate"]*$row["Qty"]."</td>";
			print '<td>'.$row["InspectingAuth"]."</td>";
			print '<td>'.$row["Type"]."</td>";
			print '<td><button type="button" class="btn btn-danger Delete" id="'.$row["TID"].'">Delete</button></td>';
			print '</tr>';
		}

	}
}

$Sitedata=!empty($_POST['Sitedata'])?$_POST['Sitedata']:'';

if (!empty($Sitedata))
{   

	$query="SELECT * FROM site inner join district on site.DistrictCode=district.DistrictCode WHERE DivisionCode=$Sitedata";
	$result=mysqli_query($con,$query);
	if (mysqli_num_rows($result)>0)
	{

		while ($row=mysqli_fetch_assoc($result))
		{

			print "<tr>";

			print '<td>'.$row["SiteName"]."</td>";
			print '<td>'.$row["DistrictName"]."</td>";
			print '<td>'.$row["Address"].' '.$row["Unit"]."</td>";
			print '<td>'.$row["Consignee"]."</td>";
			print '<td><button type="button" class="btn btn-danger DeleteSite" id="'.$row["SiteCode"].'">Delete</button></td>';
			print '</tr>';
		}

	}
}


$DivCodeOrderAV=!empty($_POST['DivCodeOrderAV'])?$_POST['DivCodeOrderAV']:'';
if (!empty($DivCodeOrderAV))
{
	$Query="SELECT orders.OrderID FROM cyrusproject.demand_details
	inner join orders on demand_details.OrderID=orders.OrderID
	Where demand_details.Status=1 and DivisionCode=$DivCodeOrderAV Group by demand_details.OrderID order by orders.OrderID";
	$result=mysqli_query($con,$Query);
	echo "<option value=''>Order ID</option>";
	if (mysqli_num_rows($result)>0)
	{
		
		while ($arr=mysqli_fetch_assoc($result))
		{
			echo '<option value="'.$arr['OrderID'].'">'.$arr['OrderID']."</option>";

		}
	}

}


$OrderIDAV=!empty($_POST['OrderIDAV'])?$_POST['OrderIDAV']:'';
if (!empty($OrderIDAV))
{
	$Query="SELECT MaterialName, MaterialID FROM cyrusproject.demand_details
	Where Status<=2 and OrderID=$OrderIDAV and BillingType!=4 order by MaterialName";
	$result=mysqli_query($con,$Query);
	echo "<option value=''>Select</option>";
	if (mysqli_num_rows($result)>0)
	{
		while($arr=mysqli_fetch_assoc($result)){
			echo '<option style="white-space: normal; word-wrap: break-word;" value="'.$arr['MaterialID'].'">'.$arr['MaterialName']."</option>";
		}

	}

}

$VendorEAV=!empty($_POST['VendorEAV'])?$_POST['VendorEAV']:'';
if (!empty($VendorEAV))
{
	$Query="SELECT VendorName, VendorID FROM cyrusproject.vendors WHERE OrderID=$VendorEAV Order by VendorName";
	$result=mysqli_query($con,$Query);
	echo "<option value=''>Select</option>";
	if (mysqli_num_rows($result)>0)
	{
		while ($arr=mysqli_fetch_assoc($result))
		{
			echo '<option value="'.$arr['VendorID'].'">'.$arr['VendorName']."</option>";

		}
	}

}

$VendorNameAVE=!empty($_POST['VendorNameAVE'])?$_POST['VendorNameAVE']:'';
if (!empty($VendorNameAVE))
{
	$Query="SELECT * FROM cyrusproject.vendors WHERE VendorID=$VendorNameAVE";
	$result=mysqli_query($con,$Query);

	if (mysqli_num_rows($result)>0)
		{	$row=mysqli_fetch_assoc($result);
			$data = array("Address"=>$row["Address"], "Contact"=>$row["Contact"], "Email"=>$row["Email"], "GST"=>$row["GSTNo"]);
			echo json_encode($data);
		}

	}

	$VendorList=!empty($_POST['VendorList'])?$_POST['VendorList']:'';

	if (!empty($VendorList))
	{   

		$query="SELECT * FROM cyrusproject.vendors
		join vendor_details on vendors.VendorID=vendor_details.VendorID
		WHERE MaterialID=$VendorList";
		$result=mysqli_query($con,$query);
		if (mysqli_num_rows($result)>0)
		{

			while ($row=mysqli_fetch_assoc($result))
			{

				print "<tr>";

				print '<td>'.$row["VendorName"]."</td>";
				print '<td>'.$row["Address"]."</td>";
				print '<td>'.$row["Contact"].' '.$row["Unit"]."</td>";
				print '<td>'.$row["Email"]."</td>";
				print '<td>'.$row["GSTNo"]."</td>";
				print '<td><button type="button" class="btn btn-danger DeleteVendor" id="'.$row["VendorID"].'">Delete</button></td>';
				print '</tr>';
			}

		}
	}


//New offer

	$DivCodeOrderOF=!empty($_POST['DivCodeOrderOF'])?$_POST['DivCodeOrderOF']:'';
	if (!empty($DivCodeOrderOF))
	{
		$Query="SELECT Orders.OrderID FROM cyrusproject.demand_details
		inner join orders on demand_details.OrderID=orders.OrderID
		Where Status=1 and DivisionCode=$DivCodeOrderOF Group by demand_details.OrderID order by orders.OrderID";
		$result=mysqli_query($con,$Query);
		echo "<option value=''>Order ID</option>";
		if (mysqli_num_rows($result)>0)
		{
			
			while ($arr=mysqli_fetch_assoc($result))
			{
				echo '<option value="'.$arr['OrderID'].'">'.$arr['OrderID']."</option>";

			}
		}

	}

/*
	$OrderIDOF=!empty($_POST['OrderIDOF'])?$_POST['OrderIDOF']:'';
	if (!empty($OrderIDOF))
	{
		$Query="SELECT VendorName, VendorID FROM vendors WHERE OrderID=$OrderIDOF Order by VendorName";
		$result=mysqli_query($con,$Query);
		echo "<option value=''>Select</option>";
		if (mysqli_num_rows($result)>0)
		{
			while ($arr=mysqli_fetch_assoc($result))
			{
				echo '<option value="'.$arr['VendorID'].'">'.$arr['VendorName']."</option>";

			}
		}

	}
*/

	$VendorOF=!empty($_POST['VendorOF'])?$_POST['VendorOF']:'';
	if (!empty($VendorOF))
	{
		$OrderIDOF=!empty($_POST['OrderIDOF'])?$_POST['OrderIDOF']:'';
		$Query="SELECT MaterialName, demand_details.MaterialID FROM demand_details
		join vendor_details on demand_details.MaterialID=vendor_details.MaterialID
		Where Status<=2 and vendor_details.VendorID=$VendorOF and demand_details.OrderID=$OrderIDOF order by MaterialName";
		$result=mysqli_query($con,$Query);
		echo '<option value="" style="text-align: center;">Select</option>';
		if (mysqli_num_rows($result)>0)
		{
			while ($arr=mysqli_fetch_assoc($result))
			{
				echo '<option value="'.$arr['MaterialID'].'">'.$arr['MaterialName']."</option>";

			}
		}

	}




	$GetUnitOF=!empty($_POST['GetUnitOF'])?$_POST['GetUnitOF']:'';
	if (!empty($GetUnitOF))
	{
		$Query="SELECT Unit FROM demand_details WHERE MaterialID=$GetUnitOF";
		$result=mysqli_query($con,$Query);
		if (mysqli_num_rows($result)>0)
		{
			$arr=mysqli_fetch_assoc($result);
			echo $arr['Unit'];

		}

	}


	$MaterialdataOF=!empty($_POST['MaterialdataOF'])?$_POST['MaterialdataOF']:'';

	if (!empty($MaterialdataOF))
	{   

		$query="SELECT ID, MaterialName, ItemName, tempoffer.Rate, tempoffer.Qty, Inspection, ModalNo, GST  FROM cyrusproject.tempoffer
		join demand_details on tempoffer.MaterialID=demand_details.MaterialID WHERE VendorID=$MaterialdataOF";
		$result=mysqli_query($con,$query);
		if (mysqli_num_rows($result)>0)
		{

			while ($row=mysqli_fetch_assoc($result))
			{

				print "<tr>";

				print '<td>'.$row["ItemName"]."</td>";
				print '<td>'.$row["ModalNo"]."</td>";
				print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
				print '<td>'.$row["Rate"]."</td>";
				print '<td>'.$row["GST"]."</td>";
				print '<td>'.$row["Inspection"]."</td>";
				print '<td><button type="button" class="btn btn-danger DeleteMaterialOF" id="'.$row["ID"].'">Delete</button></td>';
				print '</tr>';
			}

		}
	}



	$DivisionCodeFV=!empty($_POST['DivisionCodeFV'])?$_POST['DivisionCodeFV']:'';
	if (!empty($DivisionCodeFV))
	{
		$Query="SELECT offers.OrderID FROM cyrusproject.orders
		inner join offers on offers.OrderID=orders.OrderID
		WHERE Finalized=0 and DivisionCode=$DivisionCodeFV group by offers.OrderID;";
		$result=mysqli_query($con,$Query);
		echo "<option value=''>Order ID</option>";
		if (mysqli_num_rows($result)>0)
		{
			
			while ($arr=mysqli_fetch_assoc($result))
			{
				echo '<option value="'.$arr['OrderID'].'">'.$arr['OrderID']."</option>";

			}
		}

	}



	$OrderIDFV=!empty($_POST['OrderIDFV'])?$_POST['OrderIDFV']:'';
	if (!empty($OrderIDFV))
	{
		$Query="SELECT MaterialName, offers.MaterialID FROM cyrusproject.offers
		join demand_details on offers.MaterialID=demand_details.MaterialID
		WHERE Finalized=0 and offers.OrderID=$OrderIDFV group by offers.MaterialID;";
		$result=mysqli_query($con,$Query);
		echo "<option value=''>Material</option>";
		if (mysqli_num_rows($result)>0)
		{
			
			while ($arr=mysqli_fetch_assoc($result))
			{
				echo '<option value="'.$arr['MaterialID'].'">'.$arr['MaterialName']."</option>";

			}
		}

	}


	$MaterialIDFV=!empty($_POST['MaterialIDFV'])?$_POST['MaterialIDFV']:'';

	if (!empty($MaterialIDFV))
	{   

		$query="SELECT OfferID, vendors.VendorID, VendorName, demand_details.MaterialID, MaterialName, ModalNo, demand_details.OrderID, ItemName, OfferRate, OfferDate, GST, offers.Qty, demand_details.Unit, PaymentTerms, WarrantyTerms, DeliveryTerms  FROM cyrusproject.demand_details
		inner join vendor_details on demand_details.MaterialID=vendor_details.MaterialID
		inner join vendors on vendor_details.VendorID=vendors.VendorID
		inner join offers on demand_details.MaterialID=offers.MaterialID
		join `offer terms` on offers.TermID=`offer terms`.TermID WHERE offers.MaterialID=$MaterialIDFV and offers.Finalized=0 and demand_details.Status=2";
		$result=mysqli_query($con,$query);
		if (mysqli_num_rows($result)>0)
		{

			while ($row=mysqli_fetch_assoc($result))
			{
				$File=$row["OrderID"].'_'.$row["VendorID"].'_'.date('d.m.Y',strtotime($row["OfferDate"]));

				print "<tr>";
				print '<td>'.$row["VendorName"]."</td>";
				print '<td>'.$row["ItemName"]."</td>";
				print '<td>'.$row["ModalNo"]."</td>";
				print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
				print '<td>'.$row["OfferRate"]."</td>";
				print '<td>'.$row["GST"]."</td>";
				print '<td>'.$row["PaymentTerms"]."</td>";
				print '<td>'.$row["WarrantyTerms"]."</td>";
				print '<td>'.$row["DeliveryTerms"]."</td>";
				print '<td>'.date('d-M-Y',strtotime($row["OfferDate"]))."</td>";

				print '<td><a href="offer_letter/'.$File.'.pdf" target="_blank">Offer Document</a></td>';
				print '<td><input class="form-check-input checkb" name="select" type="checkbox" value="'.$row["OfferID"].'"></td>';
				print '</tr>';
			}

		}
	}


//PO Place

	$DivisionCodePO=!empty($_POST['DivisionCodePO'])?$_POST['DivisionCodePO']:'';
	if (!empty($DivisionCodePO))
	{
		$Query="SELECT orders.OrderID FROM cyrusproject.orders
		join demand_details on orders.OrderID=demand_details.OrderID
		Where Status=1 and DivisionCode=$DivisionCodePO Group by orders.OrderID order by orders.OrderID";
		$result=mysqli_query($con,$Query);
		echo "<option value=''>Order ID</option>";
		if (mysqli_num_rows($result)>0)
		{
			
			while ($arr=mysqli_fetch_assoc($result))
			{
				echo '<option value="'.$arr['OrderID'].'">'.$arr['OrderID']."</option>";

			}
		}

	}

	$OrderIDPO=!empty($_POST['OrderIDPO'])?$_POST['OrderIDPO']:'';
	if (!empty($OrderIDPO))
	{
		$Query="SELECT vendors.VendorID, VendorName FROM cyrusproject.vendors
		inner join offers on vendors.VendorID=offers.VendorID
		WHERE Finalized=1 and offers.OrderID=$OrderIDPO group by offers.VendorID order by VendorName;";
		$result=mysqli_query($con,$Query);
		echo "<option value=''>Vendor</option>";
		if (mysqli_num_rows($result)>0)
		{
			
			while ($arr=mysqli_fetch_assoc($result))
			{
				echo '<option value="'.$arr['VendorID'].'">'.$arr['VendorName']."</option>";

			}
		}

	}


	$VendorIDPO=!empty($_POST['VendorIDPO'])?$_POST['VendorIDPO']:'';

	if (!empty($VendorIDPO))
	{   

		$query="SELECT DISTINCT offers.MaterialID, OfferID, vendors.VendorID, VendorName, ModalNo, GST, demand_details.MaterialID, MaterialName, demand_details.OrderID, ItemName, OfferRate, OfferDate, offers.Qty, demand_details.Unit, PaymentTerms, WarrantyTerms, DeliveryTerms  FROM cyrusproject.demand_details
		inner join vendor_details on demand_details.MaterialID=vendor_details.MaterialID
		inner join vendors on vendor_details.VendorID=vendors.VendorID
		inner join offers on demand_details.MaterialID=offers.MaterialID
		join `offer terms` on offers.TermID=`offer terms`.TermID WHERE offers.VendorID=$VendorIDPO and offers.Finalized=1 and demand_details.Status=3";
		$result=mysqli_query($con,$query);
		if (mysqli_num_rows($result)>0)
		{

			while ($row=mysqli_fetch_assoc($result))
			{
				$File=$row["OrderID"].'_'.$row["VendorID"].'_'.date('d.m.Y',strtotime($row["OfferDate"]));

				

				print "<tr>";
				print '<td><input class="d-none" name="Offerrate[]" type="number" value="'.$row["OfferRate"].'">'.$row["ItemName"]."</td>";
				print '<td>'.$row["ModalNo"]."</td>";
				print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
				print '<td>'.$row["OfferRate"]."</td>";
				print '<td>'.$row["GST"]."</td>";
				print '<td>'.$row["PaymentTerms"]."</td>";
				print '<td>'.$row["WarrantyTerms"]."</td>";
				print '<td>'.$row["DeliveryTerms"]."</td>";
				print '<td>'.date('d-M-Y',strtotime($row["OfferDate"]))."</td>";

				print '<td><a href="offer_letter/'.$File.'.pdf" target="_blank">Offer Document</a></td>';
				print '<td><input type="number" min="1" name="Qty[]" id="'.$row["OfferID"].'" class="form-control rounded-corner"></td>';
				print '<td><input class="form-check-input checkb" id="checkb" name="offerid[]" type="checkbox" value="'.$row["OfferID"].'"></td>';
				print '</tr>';
			}

		}
	}


	$SurveydataE=!empty($_POST['SurveydataE'])?$_POST['SurveydataE']:'';

	if (!empty($SurveydataE))
	{   

		$View=!empty($_POST['View'])?$_POST['View']:'';

		$query="SELECT MaterialName, SurveyID, sitesurvey.Qty, Unit FROM cyrusproject.sitesurvey
		join demand_details on sitesurvey.MaterialID=demand_details.MaterialID WHERE SiteCode=$SurveydataE and sitesurvey.Status=1";
		$result=mysqli_query($con,$query);
		if (mysqli_num_rows($result)>0)
		{

			while ($row=mysqli_fetch_assoc($result))
			{

				print "<tr>";
				print '<td style="word-wrap: break-word;">'.$row["MaterialName"]."</td>";
				print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
				if (!empty($View)) {
					print '<td><button type="button" class="btn btn-danger disabled DeleteSurvey" id="'.$row["SurveyID"].'">Delete</button></td>';
				}else{
					print '<td><button type="button" class="btn btn-danger DeleteSurvey" id="'.$row["SurveyID"].'">Delete</button></td>';
				}
				print '</tr>';
			}

		}
	}


//Pending PO Details

	$PONoPending=!empty($_POST['PONoPending'])?$_POST['PONoPending']:'';

	if (!empty($PONoPending))
	{   

		$query="SELECT ItemName, ModalNo, OfferRate, POQty, ReadyQty, po_details.ID FROM cyrusproject.po_details
		join offers on po_details.OfferID=offers.OfferID
		WHERE (POQty-ReadyQty)>0 and po_details.POID=$PONoPending";
		$result=mysqli_query($con,$query);
		if (mysqli_num_rows($result)>0)
		{

			while ($row=mysqli_fetch_assoc($result))
			{

				print "<tr>";
				print '<td>'.$row["ItemName"]."</td>";
				print '<td>'.$row["ModalNo"]."</td>";
				print '<td>'.$row["OfferRate"]."</td>";
				print '<td>'.$row["POQty"]."</td>";
				print '<td><input type="number" name="" class="form-control rounded-corner ReadyQtyE" id="'.$row["ID"].'" value="'.$row["ReadyQty"].'" disabled></td>';
				print '</tr>';
			}

		}
	}	

//Movement Control	

	$DivisionCodeM=!empty($_POST['DivisionCodeM'])?$_POST['DivisionCodeM']:'';
	if (!empty($DivisionCodeM))
	{
		$Query="SELECT OrderID FROM orders WHERE DivisionCode=$DivisionCodeM and CompletionDate>current_date() order by OrderID";
		$result=mysqli_query($con,$Query);
		if (mysqli_num_rows($result)>0)
		{
			echo "<option value=''>OrderID</option>";
			while ($arr=mysqli_fetch_assoc($result))
			{
				echo '<option value="'.$arr['OrderID'].'">'.$arr['OrderID']."</option>";

			}
		}

	}

	$OrderIDM=!empty($_POST['OrderIDM'])?$_POST['OrderIDM']:'';
	if (!empty($OrderIDM))
	{
		$Query="SELECT VendorName, VendorID FROM vendors WHERE OrderID=$OrderIDM order by VendorName";
		$result=mysqli_query($con,$Query);
		if (mysqli_num_rows($result)>0)
		{
			echo "<option value=''>Vendor</option>";
			while ($arr=mysqli_fetch_assoc($result))
			{
				echo '<option value="'.$arr['VendorID'].'">'.$arr['VendorName']."</option>";

			}
		}

	}
	$VendorM=!empty($_POST['VendorM'])?$_POST['VendorM']:'';

	if (!empty($VendorM))
	{   

		$query="SELECT ItemName, ModalNo, POQty, ReadyQty, demand_details.MaterialID, InspectionAt, po_details.POID FROM cyrusproject.offers
		join demand_details on offers.MaterialID=demand_details.MaterialID
		join po_details on offers.OfferID=po_details.OfferID
		Where (demand_details.Status=5) or ((POQty-ReadyQty)>0 and Status=6) and VendorID=$VendorM";
		$result=mysqli_query($con,$query);
		if (mysqli_num_rows($result)>0)
		{

			while ($row=mysqli_fetch_assoc($result))
			{

				print "<tr>";
				print '<td>'.$row["ItemName"]."</td>";
				print '<td>'.$row["ModalNo"]."</td>";
				print '<td>'.$row["POQty"]."</td>";
				print '<td>'.$row["ReadyQty"]."</td>";
				print '<td><input class="form-control rounded-corner CRate" name="CRate[]" type="number" min=0 id="'.$row["POID"].'"></td>';
				print '<td><input class="form-check-input checkb" id="'.$row["InspectionAt"].'" name="select" type="checkbox" value="'.$row["POID"].'"></td>';
				print '</tr>';
			}

		}
	}


	$GestSiteM=!empty($_POST['GestSiteM'])?$_POST['GestSiteM']:'';
	if (!empty($GestSiteM))
	{
		$Query="SELECT SiteName, SiteCode FROM site WHERE DivisionCode=$GestSiteM order by SiteName";
		$result=mysqli_query($con,$Query);
		if (mysqli_num_rows($result)>0)
		{
			echo "<option value=''>Select Site</option>";
			while ($arr=mysqli_fetch_assoc($result))
			{
				echo '<option value="'.$arr['SiteCode'].'">'.$arr['SiteName']."</option>";

			}
		}

	}

	$SiteCodeM=!empty($_POST['SiteCodeM'])?$_POST['SiteCodeM']:'';
	if (!empty($SiteCodeM))
	{
		$Query="SELECT * FROM cyrusproject.site WHERE SiteCode=$SiteCodeM";
		$result=mysqli_query($con,$Query);
		if (mysqli_num_rows($result)>0)
		{
			$arr=mysqli_fetch_assoc($result);
			echo $arr['Address'];

		}

	}


	//work assigning


	$SiteCodeWM=!empty($_POST['SiteCodeWM'])?$_POST['SiteCodeWM']:'';
	if (!empty($SiteCodeWM))
	{
		$Query="SELECT MaterialName, sitesurvey.MaterialID FROM cyrusproject.demand_details
		join sitesurvey on demand_details.MaterialID=sitesurvey.MaterialID
		WHERE sitesurvey.SiteCode=$SiteCodeWM order by MaterialName";
		$result=mysqli_query($con,$Query);
		echo "<option value=''>Select Material</option>";
		if (mysqli_num_rows($result)>0)
		{
			
			while ($arr=mysqli_fetch_assoc($result))
			{
				echo '<option value="'.$arr['MaterialID'].'">'.$arr['MaterialName']."</option>";

			}
		}

	}


	$GetQtyW=!empty($_POST['GetQtyW'])?$_POST['GetQtyW']:'';
	if (!empty($GetQtyW))
	{	
		$SiteCodeW=!empty($_POST['SiteCodeW'])?$_POST['SiteCodeW']:'';

		$Query="SELECT (sitesurvey.Qty-sitework.Qty) as leftQty FROM cyrusproject.sitework
		join sitesurvey on sitework.MaterialID=sitesurvey.MaterialID WHERE sitework.MaterialID=$GetQtyW and sitesurvey.SiteCode=$SiteCodeW";
		$result=mysqli_query($con,$Query);
		$arr=mysqli_fetch_assoc($result);

		$Query2="SELECT Qty FROM cyrusproject.sitesurvey WHERE MaterialID=$GetQtyW and SiteCode=$SiteCodeW";
		$result2=mysqli_query($con,$Query2);
		$arr2=mysqli_fetch_assoc($result2);


		if (empty($arr)==true) {
			echo $arr2['Qty'];

		}else{
			//echo $arr['leftQty'];
			echo $arr2['Qty'];
		}



	}

//Site work

	$SiteWork=!empty($_POST['SiteWork'])?$_POST['SiteWork']:'';

	if (!empty($SiteWork))
	{   

		$query="SELECT Work, WorkID, sitework.Qty, Unit, StartDate, EndDate, MaterialName FROM cyrusproject.sitework
		join worktype on sitework.WorkTypeID=worktype.WorkTypeID
		join demand_details on sitework.MaterialID=demand_details.MaterialID WHERE SiteCode=$SiteWork and AssignDate is null and EmployeeCode is null Order by WorkID";
		$result=mysqli_query($con,$query);
		if (mysqli_num_rows($result)>0)
		{

			while ($row=mysqli_fetch_assoc($result))
			{

				print "<tr>";
				print '<td>'.$row["Work"]."</td>";
				print '<td style="word-wrap: break-word;">'.$row["MaterialName"]."</td>";
				print '<td>'.$row["WorkID"]."</td>";
				print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
				print '<td>'.date('d-M-Y',strtotime($row["StartDate"]))."</td>";
				print '<td>'.date('d-M-Y',strtotime($row["EndDate"]))."</td>";
				print '<td><select class="form-control rounded-corner" id="AssignTo" id2="'.$row["WorkID"].'">';
				$Query="SELECT EmployeeCode, EmployeeName FROM employees WHERE DesignationID=2 and Active=1 order by EmployeeName";
				$result2=mysqli_query($con,$Query);
				print "<option value=''>Select Employee</option>";
				if (mysqli_num_rows($result2)>0)
				{
					
					while ($arr=mysqli_fetch_assoc($result2))
					{
						print '<option value="'.$arr['EmployeeCode'].'">'.$arr['EmployeeName']."</option>";

					}
				}
				print'</select></td>';
				print '</tr>';
			}

		}
	}


//Verfication

	
	$VIDConsumed=!empty($_POST['VIDConsumed'])?$_POST['VIDConsumed']:'';

	if (!empty($VIDConsumed))
	{   

		$query="SELECT MaterialName, `material consumed`.Qty, Unit FROM cyrusproject.`material consumed`
		inner join demand_details on `material consumed`.MaterialID=demand_details.MaterialID WHERE VerificationID=$VIDConsumed";
		$result=mysqli_query($con,$query);
		if (mysqli_num_rows($result)>0)
		{

			while ($row=mysqli_fetch_assoc($result))
			{
				
				print "<tr>";
				print '<td>'.$row["MaterialName"]."</td>";
				print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
				print '</tr>';
			}

		}
	}


	$VIDExpense=!empty($_POST['VIDExpense'])?$_POST['VIDExpense']:'';

	if (!empty($VIDExpense))
	{   

		$query="SELECT * FROM `employee expense` WHERE VerificationID=$VIDExpense";
		$result=mysqli_query($con,$query);
		if (mysqli_num_rows($result)>0)
		{

			while ($row=mysqli_fetch_assoc($result))
			{
				$query2="SELECT WorkDate FROM work_verification WHERE VerificationID=$VIDExpense";
				$result2=mysqli_query($con,$query2);
				if (mysqli_num_rows($result)>0)
				{
					$row2=mysqli_fetch_assoc($result2);
					$Expense=$VIDExpense.'_'.date('d-m-Y',strtotime($row2["WorkDate"]));

				}
				
				print "<tr>";
				print '<td>'.$row["MaterialName"]."</td>";
				print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
				print '<td>'.$row["Rate"]."</td>";
				print '<td>'.$row["Qty"]*$row["Rate"]."</td>";
				print '<td><a href="fieldlogin/expense/'.$Expense.'.pdf" target="_blank">Receipt</a></td>';
				print '</tr>';
			}

		}
	}


//Billing

	$DivCodeOrderB=!empty($_POST['DivCodeOrderB'])?$_POST['DivCodeOrderB']:'';
	if (!empty($DivCodeOrderB))
	{
		$Query="SELECT Orders.OrderID FROM cyrusproject.orders Where DivisionCode=$DivCodeOrderB";
		$result=mysqli_query($con,$Query);
		echo "<option value=''>Order ID</option>";
		if (mysqli_num_rows($result)>0)
		{
			
			while ($arr=mysqli_fetch_assoc($result))
			{
				echo '<option value="'.$arr['OrderID'].'">'.$arr['OrderID']."</option>";

			}
		}

	}

//Site Office Work

	$SiteWorkO=!empty($_POST['SiteWorkO'])?$_POST['SiteWorkO']:'';

	if (!empty($SiteWorkO))
	{   

		$query="SELECT * FROM cyrusproject.site_ofice_work
		inner join employees on site_ofice_work.EmployeeCode=employees.EmployeeCode WHERE SiteCode=$SiteWorkO";
		$result=mysqli_query($con,$query);
		if (mysqli_num_rows($result)>0)
		{

			while ($row=mysqli_fetch_assoc($result))
			{

				print "<tr>";
				print '<td>'.$row["Work"]."</td>";
				print '<td>'.$row["WorkID"]."</td>";
				print '<td>'.$row["EmployeeName"]."</td>";
				print '<td><span class="d-none">'.$row["AssignDate"].'</span>'.date('d-M-Y',strtotime($row["AssignDate"]))."</td>";
				print '</tr>';
			}

		}
	}

	?>

