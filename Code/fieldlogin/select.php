<?php 
include"connection.php";
include"session.php";

$GetLeftQty=!empty($_POST['GetLeftQty'])?$_POST['GetLeftQty']:'';
if (!empty($GetLeftQty))
{
	$Query="SELECT (sitesurvey.Qty-(sum(`material consumed`.Qty))) as leftQty FROM cyrusproject.sitesurvey
	join cyrusproject.`material consumed` on `material consumed`.MaterialID=sitesurvey.MaterialID WHERE sitesurvey.MaterialID=$GetLeftQty";
	$result=mysqli_query($con,$Query);
	$arr=mysqli_fetch_assoc($result);

	$Query2="SELECT Qty FROM sitesurvey WHERE MaterialID=$GetLeftQty";
	$result2=mysqli_query($con,$Query2);
	$arr2=mysqli_fetch_assoc($result2);
	if (!empty($arr['leftQty'])) {
		echo $arr['leftQty'];
	}else{
		echo $arr2['Qty'];
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


$WorkIDMC=!empty($_POST['WorkIDMC'])?$_POST['WorkIDMC']:'';

if (!empty($WorkIDMC))
{   

	$query="SELECT MaterialName, CQty, ID FROM tempconsumed
	join demand_details on tempconsumed.MaterialID=demand_details.MaterialID
	WHERE WorkID=$WorkIDMC";
	$result=mysqli_query($con,$query);
	if (mysqli_num_rows($result)>0)
	{

		while ($row=mysqli_fetch_assoc($result))
		{
			
			print "<tr>";
			print '<td>'.$row["MaterialName"]."</td>";
			print '<td>'.$row["CQty"].' '.$row["Unit"]."</td>";
			print '<td><button type="button" class="btn btn-danger DeleteMC" id="'.$row["ID"].'">Delete</button></td>';
			print '</tr>';
		}

	}
}

$WorkIDEX=!empty($_POST['WorkIDEX'])?$_POST['WorkIDEX']:'';

if (!empty($WorkIDEX))
{   

	$query="SELECT * FROM tempexpense WHERE WorkID=$WorkIDEX";
	$result=mysqli_query($con,$query);
	if (mysqli_num_rows($result)>0)
	{

		while ($row=mysqli_fetch_assoc($result))
		{
			
			print "<tr>";
			print '<td>'.$row["MaterialName"]."</td>";
			print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
			print '<td>'.$row["Rate"]."</td>";
			print '<td>'.$row["Rate"]*$row["Qty"]."</td>";
			print '<td><button type="button" class="btn btn-danger DeleteEx" id="'.$row["ID"].'">Delete</button></td>';
			print '</tr>';
		}

	}
}

$WorkIDAE=!empty($_POST['WorkIDAE'])?$_POST['WorkIDAE']:'';

if (!empty($WorkIDAE))
{   

	$query="SELECT * FROM tempemployee WHERE WorkID=$WorkIDAE";
	$result=mysqli_query($con,$query);
	if (mysqli_num_rows($result)>0)
	{

		while ($row=mysqli_fetch_assoc($result))
		{
			
			print "<tr>";
			print '<td>'.$row["EmployeeName"]."</td>";
			print '<td><button type="button" class="btn btn-danger DeleteAE" id="'.$row["ID"].'">Delete</button></td>';
			print '</tr>';
		}

	}
}



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
			
			print "<tr>";
			print '<td>'.$row["MaterialName"]."</td>";
			print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
			print '<td>'.$row["Rate"]."</td>";
			print '<td>'.$row["Qty"]*$row["Rate"]."</td>";
			print '</tr>';
		}

	}
}