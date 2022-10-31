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
		echo "<option value=''>Select Division</option>";
		while ($arr=mysqli_fetch_assoc($result))
		{
			echo '<option value="'.$arr['SiteCode'].'">'.$arr['SiteName']."</option>";

		}
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
	$Query="SELECT $orders.OrderID FROM $orders
	inner join $demands on $orders.OrderID=$demands.OrderID
	WHERE DivisionCode=$DivisionCodeRequirement and ConfirmationDate is null and StatusID <=2 order by $orders.OrderID";
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


$OrderIDTemp=!empty($_POST['OrderIDTemp'])?$_POST['OrderIDTemp']:'';

if (!empty($OrderIDTemp))
{   

	$query="SELECT * FROM $temprequirement WHERE OrderID=$OrderIDTemp";
	$result=mysqli_query($con,$query);
	if (mysqli_num_rows($result)>0)
	{

		while ($row=mysqli_fetch_assoc($result))
		{
			$Labour='No';
			if ($row["LabourWork"]==1) {
				$Labour='Yes';
			}
			print "<tr>";
			print '<td>'.$row["SrNo"]."</td>";
			print '<td style="word-wrap: break-word;">'.$row["MaterialName"]."</td>";
			print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
			print '<td>'.$row["Rate"]."</td>";
			print '<td>'.$row["Rate"]*$row["Qty"]."</td>";
			print '<td>'.$row["InspectingAuth"]."</td>";
			print '<td>'.$Labour."</td>";
			print '<td><button type="button" class="btn btn-danger Delete" id="'.$row["ID"].'">Delete</button></td>';
			print '</tr>';
		}

	}
}

$Sitedata=!empty($_POST['Sitedata'])?$_POST['Sitedata']:'';

if (!empty($Sitedata))
{   

	$query="SELECT * FROM site WHERE DivisionCode=$Sitedata";
	$result=mysqli_query($con,$query);
	if (mysqli_num_rows($result)>0)
	{

		while ($row=mysqli_fetch_assoc($result))
		{

			print "<tr>";

			print '<td>'.$row["SiteName"]."</td>";
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
	$Query="SELECT Orders.OrderID FROM cyrusproject.demand_details
	inner join orders on demand_details.OrderID=orders.OrderID
	Where Status=1 and DivisionCode=$DivCodeOrderAV Group by demand_details.OrderID order by orders.OrderID";
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
	Where Status<=2 and OrderID=$OrderIDAV and LabourWork=0 order by MaterialName";
	$result=mysqli_query($con,$Query);
	echo "<option value=''>Select</option>";
	if (mysqli_num_rows($result)>0)
	{
		while($arr=mysqli_fetch_assoc($result)){
			echo '<option value="'.$arr['MaterialID'].'">'.$arr['MaterialName']."</option>";
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


	$OrderIDOF=!empty($_POST['OrderIDOF'])?$_POST['OrderIDOF']:'';
	if (!empty($OrderIDOF))
	{
		$Query="SELECT VendorName, VendorID FROM cyrusproject.vendors WHERE OrderID=$OrderIDOF Order by VendorName";
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


	$VendorOF=!empty($_POST['VendorOF'])?$_POST['VendorOF']:'';
	if (!empty($VendorOF))
	{
		$Query="SELECT MaterialName, demand_details.MaterialID FROM cyrusproject.demand_details
		join vendor_details on demand_details.MaterialID=vendor_details.MaterialID
		Where Status<=2 and vendor_details.VendorID=$VendorOF order by MaterialName";
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
		WHERE Finalized=1 and vendors.OrderID=$OrderIDPO group by offers.VendorID order by VendorName;";
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

		$query="SELECT OfferID, vendors.VendorID, VendorName, ModalNo, GST, demand_details.MaterialID, MaterialName, demand_details.OrderID, ItemName, OfferRate, OfferDate, offers.Qty, demand_details.Unit, PaymentTerms, WarrantyTerms, DeliveryTerms  FROM cyrusproject.demand_details
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
				print '<td class="d-none"><input  name="Offerrate[]" type="number" value="'.$row["OfferRate"].'"></td>';
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
				print '<td><input type="number" min="1" name="Qty[]" id="'.$row["OfferID"].'" class="form-control rounded-corner"></td>';
				print '<td><input class="form-check-input checkb" id="checkb" name="offerid[]" type="checkbox" value="'.$row["OfferID"].'"></td>';
				print '</tr>';
			}

		}
	}


	$SurveydataE=!empty($_POST['SurveydataE'])?$_POST['SurveydataE']:'';

	if (!empty($SurveydataE))
	{   

		$query="SELECT MaterialName, SurveyID, sitesurvey.Qty, Unit FROM cyrusproject.sitesurvey
		join demand_details on sitesurvey.MaterialID=demand_details.MaterialID WHERE SiteCode=$SurveydataE and sitesurvey.Status=0";
		$result=mysqli_query($con,$query);
		if (mysqli_num_rows($result)>0)
		{

			while ($row=mysqli_fetch_assoc($result))
			{

				print "<tr>";
				print '<td style="word-wrap: break-word;">'.$row["MaterialName"]."</td>";
				print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
				print '<td><button type="button" class="btn btn-danger DeleteSurvey" id="'.$row["SurveyID"].'">Delete</button></td>';
				print '</tr>';
			}

		}
	}

	?>

