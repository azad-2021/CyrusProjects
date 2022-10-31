<?php
include ('connection.php');
include ('session.php');

//$_SESSION['BillNO']='2223CEUP26264';

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
if (!empty($_SESSION['PONo']))
{	

	$PONo=$_SESSION['PONo'];


	$Query="SELECT po.POID, VendorName, Address, Contact, Email, GSTNo, ShippingAddress, PODate, PaymentTerms, WarrantyTerms, DeliveryTerms, OtherTerms  FROM cyrusproject.po_details
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

		$POID=$arr['POID'];
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

	/*$pdf->Cell(5,1,'Original for Recepient');
	$pdf->Cell(70);
	$pdf->Cell(5,1,'Duplicate for Transporter/Supplier');
	$pdf->Cell(70);
	$pdf->Cell(5,1,'Triplicate for Supplier');
	$pdf->Cell(1,1,'',1,1);
	*/

	//$pdf->Image('cyrus.png',10,8,33);
	$pdf->Image('cyruslogo.jpg',10,5,8,0,'jpeg');

	//$pdf->SetFont('ArialNarrow', '', 20);

	
	$pdf->SetFont('ArialNarrowB', 'B', 24);
	$pdf->Cell(12);
	$pdf->SetTextColor(252, 35, 25 );
	$pdf->Cell(12,2, $Company);
	$pdf->SetTextColor(0,0,0);
	$pdf->Cell(140);
	$pdf->SetFont('ArialNarrowB', 'B', 9);
	$pdf->Cell(15,2,'PO No.: '.$PONo);
	$pdf->Cell(-15);
	$pdf->Cell(15,10,'Date : '.$PODate);

	$pdf->SetFont('ArialNarrowB', 'B', 9.5);
	$pdf->Cell(-170);
	$pdf->Cell(10,13,$Address1);
	//$pdf->SetFont('ArialNarrow', 'B', 8);
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

	$pdf->SetFont('ArialNarrowB', 'B', 11);
	$pdf->Cell(8);
	$pdf->Cell(10,95,'Vendor : '.$VendorName);

	$pdf->Cell(-10);
	$pdf->Cell(5,105,'Address : '.$AddressV);

	$pdf->Cell(-5);
	$pdf->Cell(10,115,'Contact : '.$ContactV);

	$pdf->Cell(-10);
	$pdf->Cell(10,125,'Email : '.$Email);

	$pdf->Cell(-10);
	$pdf->Cell(10,135,'GSTIN '.' '.' '.' '.' : '.' '.$GSTNoV);
	

	$pdf->SetFont('ArialNarrowB', 'B', 11);
	$pdf->Cell(120);
	$pdf->SetXY(145,47);
	$pdf->MultiCell(80,5,'Shippig To : '.$ShippingAddress,'','L',false);
	//$pdf->MultiCell(10,95,'Shippig To : '.$ShippingAddress);
	$pdf->SetXY(10,75);
//Table

	$pdf->SetWidths(Array(10,110,18,18,12,18));
	$pdf->SetFillColor(193,229,252);
	$pdf->SetLineHeight(5);
	$pdf->SetAligns(Array('','','','','',''));
	$pdf->SetFont('ArialNarrowB','B',10);
	$pdf->Cell(10,5,"S.No.",1,0);
	$pdf->Cell(110,5,"Description",1,0);
	$pdf->Cell(18,5,"Quantity",1,0);
	$pdf->Cell(18,5,"Unit Price",1,0);
	$pdf->Cell(12,5,"GST %",1,0);
	$pdf->Cell(18,5,"Amount",1,0);
//add a new line
	$pdf->Ln();
//reset font
	$pdf->SetFont('ArialNarrow', 'B', 9);


	$query="SELECT ItemName, OfferRate, POQty, (OfferRate*POQty) as Amount FROM cyrusproject.offers
	join po_details on offers.OfferID=po_details.OfferID
	where POID=$POID;";
	$result = mysqli_query($con,$query);
	$d=0;
	while($arr=mysqli_fetch_assoc($result)){
		$d++;

		$pdf->Row(Array(
			$d,

			$arr['ItemName'],
			$arr['POQty'],
			$arr['OfferRate'],
			18,
			$arr['Amount'],
		));

	}
	$Y=$pdf->GetY();
	if ($Y>260) {
		$pdf->AddPage();
	}

	$pdf->Ln();
	$pdf->SetFont('ArialNarrowB','B',10);
	$pdf->Cell(140);
	$pdf->Cell(20,2,'Total Taxable Value : ',0,0,'L');
	$pdf->Cell(2);
	$pdf->Cell(20,12,'Tax : ',0,0,'L');
	$pdf->Cell(-27);
	$pdf->Cell(20,22,'Shipping : ');
	$pdf->Cell(-15);
	$pdf->Cell(20,32,'Other : ');


	$pdf->Ln();
	$Y=$pdf->GetY();
	$pdf->MultiCell(200,5,'Payment Terms : '.$PaymentTerms,'','L',false);
	$pdf->MultiCell(200,5,'Warranty Terms : '.$WarrantyTerms,'','L',false);
	$pdf->MultiCell(200,5,'Delivery Terms : '.$DeliveryTerms,'','L',false);
	if (!empty($OtherTerms)) {
		$pdf->MultiCell(200,5,'If you have any questions about this purchase order, please contact
			Siddharth Anand, 08577877771, purchase@cyruselectronics.co.in : '.$OtherTerms,'','L',false);
	}
	$pdf->Ln();
	$pdf->Cell(40);
	$pdf->MultiCell(100,5,'If you have any questions about this purchase order, please contact Siddharth Anand, 08577877771, purchase@cyruselectronics.co.in','','L',false);
	//$pdf->Cell(160,135,"",0,0);
	$Y= $pdf->GetY();

	
	$pdf->Output();


}


?>