<?php
include ('connection.php');
include ('session.php');
include ('numbertowords.php');
//$_SESSION['BillNO']='2223CEUP26264';

if (isset($_GET['ChallanNo'])) {
	$ChallanNo=base64_decode($_GET['ChallanNo']);
}elseif(isset($_SESSION['ChallanNo'])){
	$ChallanNo=$_SESSION['ChallanNo'];
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
if (!empty($ChallanNo))
{	

	$Query="SELECT * FROM cyrusproject.deliverychallan
	join states on deliverychallan.StateCode=states.StateCode WHERE ChallanNo='$ChallanNo'";

	$result=mysqli_query($con,$Query);
	if (mysqli_num_rows($result)>0)
	{
		$arr=mysqli_fetch_assoc($result);

		$ShippingAddress=$arr['ShippingAddress'];
		$ChallanDate=date('d-M-Y',strtotime($arr['ChallanDate']));

		$MovementID=$arr['MovementID'];
		$State=$arr['StateName'];
		$SCode=$arr['StateCode'];
		$SiteCode=$arr['SiteCode'];

		if (!empty($SiteCode)) {

			$query="SELECT * FROM cyrusproject.organization_details
			join site on organization_details.DivisionCode=site.DivisionCode WHERE SiteCode=$SiteCode";
			$result = mysqli_query($con,$query);
			if(mysqli_num_rows($result)>0)
			{

				$row=mysqli_fetch_assoc($result);
				$Org = $row['Organization'];
				$Div=$row['DivisionName'];
				$Site=$row['SiteName'];

			}

		}

	}

	$query="SELECT count(ID) from `challan detail` WHERE ChallanNo='$ChallanNo'";
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
	$pdf->SetFont('ArialNarrowB', 'B', 9);
	$pdf->Cell(15,2,'Challan No.: '.$ChallanNo);
	$pdf->Cell(-15);
	$pdf->Cell(15,10,'Date : '.$ChallanDate);

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
	$pdf->Cell(100,10,'Delivery Challan',1,80,'C',0);
	//$pdf->Image($tempDir,170,18,30,0,'png');
	$pdf->SetXY(1,1);

	$pdf->SetFont('Arial', 'B', 9);
	$pdf->Cell(8);
	$pdf->Cell(10,105,'To : '.$Org.' '.$Div.' '.$Site);

	$pdf->Cell(115);
	$pdf->Cell(10,105,'State : '.$State);

	$pdf->Cell(30);
	$pdf->Cell(10,105,'State Code : '.$SCode);

	//$pdf->Cell(-175);
	//$pdf->Cell(10,125,'GSTIN '.' '.' '.' '.' : '.' '.$BranchGST);
	
	$pdf->SetXY(10,60);
	//Table

	$pdf->SetWidths(Array(10,134,15,15,15));
	$pdf->SetFillColor(193,229,252);
	$pdf->SetLineHeight(5);
	$pdf->SetAligns(Array('','','','','',''));
	$pdf->SetFont('ArialNarrowB','B',10);
	$pdf->Cell(10,5,"S.No.",1,0);
	$pdf->Cell(134,5,"Description",1,0);
	$pdf->Cell(15,5,"Rate",1,0);
	$pdf->Cell(15,5,"Quantity",1,0);
	$pdf->Cell(15,5,"Amount",1,0);

	$pdf->Ln();

	$pdf->SetFont('ArialNarrow', 'B', 9);


	$query="SELECT SrNo, MaterialName, ReadyQty, `challan detail`.Rate, (`challan detail`.Rate*ReadyQty) as Amount FROM cyrusproject.`challan detail`
	join demand_details on `challan detail`.MaterialID=demand_details.MaterialID
	where ChallanNo='$ChallanNo';";
	$result = mysqli_query($con,$query);
	$d=0;
	$AmountArr=array();

	while($arr=mysqli_fetch_assoc($result)){
		$AmountArr[]=$arr['Amount'];
		$d++;
		$pdf->Row(Array(			
			$d,
			$arr['MaterialName'].' '.$arr['SrNo'],
			$arr['Rate'],
			$arr['ReadyQty'],			
			$arr['Amount'],
		));

	}

	$Amount=array_sum($AmountArr);

	$Y=$pdf->GetY();
	if ($Y>260) {
		$pdf->AddPage();
	}

	$pdf->Ln();
	$pdf->SetFont('ArialNarrowB','B',10);
	$obj=new IndianCurrency(99999999);
	$pdf->MultiCell(130,5,'Total Amount in words: '.$obj->get_words(),'1','L',false);
	$pdf->Cell(156);
	//$pdf->Ln();
	$Y=$pdf->GetY();
	$pdf->Cell(20,$Y-90,'Total Amount: '.($Amount));
	$pdf->Ln();
		
	$pdf->SetFont('Arial', 'B', 10);

	$pdf->Cell(5,70,'Engineer in Reference');
	$pdf->Cell(-5);
	$pdf->Cell(5,90,'Engineer');
	$pdf->Cell(135);
	$pdf->Cell(5,70,'for Cyrus Electronics Pvt. Ltd.');
	$pdf->Cell(5,110,'Authorised Signatory.');
	
	$pdf->Output();


}


?>