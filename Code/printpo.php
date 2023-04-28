<?php
include ('connection.php');
include ('session.php');

//$_SESSION['BillNO']='2223CEUP26264';

if (isset($_GET['PONo'])) {
	$PONo=base64_decode($_GET['PONo']);
}elseif(isset($_SESSION['PONo'])){
	$PONo=$_SESSION['PONo'];
}

date_default_timezone_set('Asia/Calcutta');
$timestamp =date('y-m-d H:i:s');
$Date = date('Y-m-d',strtotime($timestamp));
$Company='CYRUS ELECTRONICS PVT. LTD.';
$PAN='AACCC6555F';
$GSTIN='09AACCC6555F1ZM';
$Address1='Registered Off: Cyrus House, B44/69 Sector Q, Aliganj, Lucknow-24';
$Contact='Ph.(0522)-4026916, 2746916, Fax 4075916 mail- admin@cyruselectronics.co.in';
require('fpdf/fpdf.php');
require('fpdf/html_table.php');
if (!empty($PONo))
{	

	


	$Query="SELECT po.POID, VendorName, Address, Contact, Email, GSTNo, ShippingAddress, PODate, PaymentTerms, WarrantyTerms, DeliveryTerms, OtherTerms, ShippingCharges, OtherCharges, DistrictCode  FROM cyrusproject.po_details
	join po on po_details.POID=po.POID
	join offers on po_details.OfferID=offers.OfferID
	join `offer terms` on offers.TermID=`offer terms`.TermID
	join vendors on offers.VendorID=vendors.VendorID WHERE PONo='$PONo'";

	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{
		$arr=mysqli_fetch_assoc($result);
		$VendorName=$arr['VendorName'];
		$AddressV=$arr['Address'];
		$Email=$arr['Email'];
		$ContactV=$arr['Contact'];
		$GSTNoV=$arr['GSTNo'];
		$ShippingAddress=$arr['ShippingAddress'];
		$PODate=date('d-M-Y',strtotime($arr['PODate']));

		$PaymentTerms=$arr['PaymentTerms'];
		$WarrantyTerms=$arr['WarrantyTerms'];
		$DeliveryTerms=$arr['DeliveryTerms'];
		$OtherTerms=$arr['OtherTerms'];
		$ShippingCharges=$arr['ShippingCharges'];
		$OtherCharges=$arr['OtherCharges'];

		$POID=$arr['POID'];
		$DistrictCode=$arr['DistrictCode'];

		$query="SELECT StateCode from district WHERE DistrictCode=$DistrictCode";
		$result = mysqli_query($con,$query);
		if(mysqli_num_rows($result)>0)
		{

			$row=mysqli_fetch_assoc($result);
			$StateCode = $row['StateCode'];

			if ($StateCode==9) {
				$IG=0;
			}else{
				$IG=1;
			}

		}

	}

	$query="SELECT count(ID) from po_details WHERE POID=$POID";
	$result = mysqli_query($con,$query);
	if(mysqli_num_rows($result)>0)
	{

		$row=mysqli_fetch_assoc($result);
		$CountID = $row['count(ID)'];

	}



	ob_end_clean();


	// Instantiate and use the FPDF class
	$pdf = new PDF();
	$pdf->SetAutoPageBreak(false);
	if ($CountID>10) {
		$pdf->SetAutoPageBreak(true);
	}
	$pdf->AddPage();

	// Set the font for the text
	$pdf->AddFont('ArialNarrow','B','Arial Narrow.php');
	$pdf->AddFont('ArialNarrowB','B','ARIALNB.php'); //Bold
	$pdf->SetFont('ArialNarrow', 'B', 10);

	$pdf->Image('cyruslogo.jpg',10,5,8,0,'jpeg');
	
	$pdf->SetFont('ArialNarrowB', 'B', 24);
	$pdf->Cell(9);
	$pdf->SetTextColor(252, 35, 25 );
	$pdf->Cell(12,2, $Company);
	$pdf->SetTextColor(0,0,0);
	$pdf->Cell(140);
	$pdf->SetFont('ArialNarrowB', 'B', 11);
	$pdf->Cell(15,2,'PO No.: '.$PONo);
	$pdf->Cell(-15);
	$pdf->Cell(15,10,'Date : '.$PODate);

	$pdf->SetFont('ArialNarrowB', 'B', 9.5);
	$pdf->Cell(-166);
	$pdf->Cell(10,13,$Address1);

	$pdf->Cell(-10);
	$pdf->SetFont('ArialNarrow', 'B', 10);
	$pdf->Cell(10,20,$Contact);
	$pdf->Cell(40);
	$pdf->SetFont('ArialNarrowB', 'B', 12);
	$pdf->Cell(2,35,'GSTIN: '.$GSTIN);

	$pdf->Cell(-25);
	$pdf->SetXY(45,32);
	$pdf->SetFont('ArialNarrowB', 'B', 14);
	$pdf->SetDrawColor(50,60,100);
	$pdf->Cell(100,10,'Purchase Order',1,80,'C',0);
	//$pdf->Image($tempDir,170,18,30,0,'png');
	$pdf->SetXY(1,1);
	
	$pdf->SetXY(142,50);
	$pdf->SetFont('ArialNarrowB', 'B', 10);
	$pdf->MultiCell(190,5,'Billed To   : '.$Company,'','L',false);
	$pdf->Ln();
	$pdf->SetFont('ArialNarrowB', 'B', 11);
	$pdf->Cell(8);

	$pdf->SetXY(10,1);
	$pdf->Cell(10,105,'Vendor   : '.$VendorName);

	$pdf->Cell(-10);
	$pdf->Cell(5,115,'Address : '.$AddressV);

	$pdf->Cell(-5);
	$pdf->Cell(10,125,'Contact  : '.$ContactV);

	$pdf->Cell(-10);
	$pdf->Cell(10,135,'Email     : '.$Email);

	$pdf->Cell(-10);
	$pdf->Cell(10,145,'GSTIN    : '.' '.$GSTNoV);
	

	$pdf->SetFont('ArialNarrowB', 'B', 11);
	//$pdf->Cell(50);
	$pdf->SetXY(100,47);

	$pdf->SetFont('ArialNarrowB', 'B', 11);
	$pdf->Cell(120);
	$pdf->SetXY(143,55);
	$pdf->MultiCell(80,5,'Shipped To : '.$ShippingAddress,'','L',false);

	$pdf->SetXY(10,80);
	//Table

	$pdf->SetWidths(Array(10,90,20,18,18,12,18));
	$pdf->SetFillColor(193,229,252);
	$pdf->SetLineHeight(5);
	$pdf->SetAligns(Array('','','','','',''));
	$pdf->SetFont('ArialNarrow','B',12);
	$pdf->Cell(10,5,"S.No.",1,0);
	$pdf->Cell(90,5,"Item Name",1,0);
	$pdf->Cell(20,5,"Modal No.",1,0);
	$pdf->Cell(18,5,"Quantity",1,0);
	$pdf->Cell(18,5,"Unit Price",1,0);
	$pdf->Cell(12,5,"GST %",1,0);
	$pdf->Cell(18,5,"Amount",1,0);

	$pdf->Ln();

	$pdf->SetFont('ArialNarrow', 'B', 9);


	$query="SELECT ItemName, ModalNo, GST, OfferRate, POQty, (OfferRate*POQty) as Amount FROM cyrusproject.offers
	join po_details on offers.OfferID=po_details.OfferID
	where POID=$POID;";
	$result = mysqli_query($con,$query);
	$d=0;
	$TaxableAmountArr=array();
	$AmountArr=array();
	while($arr=mysqli_fetch_assoc($result)){
		$d++;
		$TaxableAmountArr[]=$arr['Amount'];
		$AmountArr[]=($arr['Amount']+(($arr['Amount']*$arr['GST'])/100));
		$pdf->Row(Array(
			$d,
			
			$arr['ItemName'],
			$arr['ModalNo'],
			$arr['POQty'],
			$arr['OfferRate'],
			$arr['GST'],
			$arr['Amount'],
		));

	}

	$TaxableAmount=array_sum($TaxableAmountArr);
	$Amount=array_sum($AmountArr);

	$Y=$pdf->GetY();
	if ($Y>260) {
		$pdf->AddPage();
	}

	$pdf->Ln();
	$pdf->SetFont('ArialNarrowB','B',10);
	$pdf->Cell(140);
	$pdf->Cell(20,2,'Total Taxable Value : '.$TaxableAmount,0,0,'L');
	$pdf->Cell(-1);

	if ($StateCode==9) {

		$pdf->Cell(20,12,'CGST : '.($Amount-$TaxableAmount)/2,0,0,'L');
		$pdf->Cell(-20);
		$pdf->Cell(20,22,'SGST : '.($Amount-$TaxableAmount)/2,0,0,'L');
		$pdf->Cell(-19);
		$pdf->Cell(20,32,'IGST : 0',0,0,'L');
		
	}else{

		$pdf->Cell(20,12,'CGST : 0',0,0,'L');
		$pdf->Cell(-20);
		$pdf->Cell(20,22,'SGST : 0',0,0,'L');
		$pdf->Cell(-19);
		$pdf->Cell(20,32,'IGST : '.($Amount-$TaxableAmount),0,0,'L');

	}
	$pdf->Cell(-26);
	$pdf->Cell(20,42,'Shipping : '.$ShippingCharges);
	$pdf->Cell(-15);
	$pdf->Cell(20,52,'Other : '.$OtherCharges);
	$pdf->Cell(-28);
	$pdf->Cell(20,62,'Grand Total : '.($Amount+ $ShippingCharges + $OtherCharges));

	$Y=$pdf->GetY();
	$pdf->SetXY(10,$Y+38);
	$pdf->MultiCell(190,5,'Payment Terms : '.$PaymentTerms,'','L',false);
	$pdf->Ln();
	$pdf->MultiCell(190,5,'Warranty Terms : '.$WarrantyTerms,'','L',false);
	$pdf->Ln();
	$pdf->MultiCell(190,5,'Delivery Terms : '.$DeliveryTerms,'','L',false);
	if (!empty($OtherTerms)) {
		$pdf->Ln();
		$pdf->MultiCell(200,5,'Other Terms : '.$OtherTerms,'','L',false);
	}
	$pdf->Ln();
	$pdf->Ln();
	$pdf->MultiCell(200,5,'If you have any questions about this purchase order, please contact / email at purchase@cyruselectronics.co.in','','L',false);
	//$pdf->Cell(160,135,"",0,0);
	$Y= $pdf->GetY();

	
	$pdf->Output();


}


?>