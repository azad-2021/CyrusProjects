<?php 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include"connection.php";
include"session.php";
date_default_timezone_set('Asia/Calcutta');
$timestamp =date('y-m-d H:i:s');
$Date = date('Y-m-d',strtotime($timestamp));

$FDate = date('d-m-Y',strtotime($timestamp));
$WorkID=base64_decode($_GET['WorkID']);

$Hour = date('G');
//echo $_SESSION['user'];

$user=$_SESSION['username'];

if ( $Hour >= 1 && $Hour <= 11 ) {
	$wish= "Good Morning ".$_SESSION['username'];
} else if ( $Hour >= 12 && $Hour <= 15 ) {
	$wish= "Good Afternoon ".$_SESSION['username'];
} else if ( $Hour >= 19 || $Hour <= 23 ) {
	$wish= "Good Evening ".$_SESSION['username'];
}

$EmployeeCode=$_SESSION['userid'];
$query="SELECT Organization, DivisionName, SiteName, Work, OrderID, AssignDate, site.SiteCode FROM cyrusproject.site_ofice_work
inner join site on site_ofice_work.SiteCode=site.SiteCode 
inner join organization_details on site.DivisionCode=organization_details.DivisionCode WHERE WorkID=$WorkID";
$result=mysqli_query($con,$query);
if (mysqli_num_rows($result)>0)
{
	$row=mysqli_fetch_assoc($result);
	$Organization=$row["Organization"];
	$DivisionName=$row["DivisionName"];
	$SiteName=$row["SiteName"];
	$SiteCode=$row["SiteCode"];
	$Work=$row["Work"];
	$OrderID=$row["OrderID"];
	$AssignDate=$row["AssignDate"];
}


if (isset($_POST['submit'])) {
	$errors='';
	$EmployeeRemark=$_POST['EmployeeRemark'];
	$EntryDate=$_POST['EntryDate'];



	$query="SELECT * FROM office_work_verification WHERE WorkID=$WorkID and WorkDate='$EntryDate' and VerificationRemark not like '%Rejected%' and Closed=0";
	$result=mysqli_query($con,$query);
	if (mysqli_num_rows($result)>0)
	{
		$errors ='<script>alert("Entry already exist")</script>';
	}


	if (empty($errors)==true) {


		$sql = "INSERT INTO office_work_verification (EmployeeCode, SiteCode, WorkID, WorkDate, EmployeeRemark)
		VALUES ($EmployeeCode, $SiteCode, $WorkID, '$EntryDate', '$EmployeeRemark')";

		
		if ($con->query($sql) === TRUE) {

			header("Location:index.php");

		}else{
			echo $errors;
		}
	}
}
?>

<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="utf-8" />
	<title>Office Work Reporting</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta content="" name="description" />
	<meta content="Anant Singh" name="author" />
	<!-- App favicon -->
	<link rel="shortcut icon" href="../assets/images/cyruslogo.png">

	<!-- jquery.vectormap css -->
	<link href="../assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />

	<!-- Bootstrap Css -->
	<link href="../assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
	<!-- Icons Css -->
	<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
	<!-- App Css-->
	<link href="../assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

	<link href="../assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />


	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.3.0/js/responsive.bootstrap5.min.js">

	<style type="text/css">
		th,td{
			align-items: center;
		}
	</style>
</head>
<body data-sidebar="dark" data-topbar="dark">

	<?php 

	include"header.php";
	include"sidebar.php";
    //include"modals.php";

	?>
	<!-- ============================================================== -->
	<!-- Start right Content here -->
	<!-- ============================================================== -->
	<div class="main-content">

		<div class="page-content">
			<div class="container-fluid">

				<!-- start page title -->
				<div class="row">
					<div class="col-12">
						<div class="page-title-box d-flex align-items-center justify-content-between">
							<h4 class="mb-0">Office Work Reporting of <?php echo $Organization ?>, <?php echo $DivisionName ?>, <?php echo $SiteName ?></h4>

						</div>
					</div>
				</div>
				<!-- end page title -->



				<div class="row">
					<div class="col-xl-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title mb-4">Enter Details</h4>
								<form class="form-control rounded-corner" method="POST" action="" enctype = "multipart/form-data">
									<div class="row">

										<div class="col-lg-6" style="margin-bottom:10px;">
											<label>Work Detail</label>
											<textarea class="form-control rounded-corner" disabled><?php echo $Work; ?></textarea>
										</div>
										<div class="col-lg-6" style="margin-bottom:10px;">
											<label>Enter Details</label>
											<textarea class="form-control rounded-corner" name="EmployeeRemark" type="text" maxlength="250"></textarea>
										</div>
										<center>
											<div class="col-lg-3" style="margin-top:20px;">
												<label>Enter Work Date</label>
												<input type="date" min="<?php echo $AssignDate ?>" max="<?php echo $Date ?>" class="form-control rounded-corner" name="EntryDate" required>
											</div>

											<div class="col-lg-3" style="margin-top:20px;">
												<button type="submit" name="submit"  class="btn btn-primary">Submit</button>
											</div>
										</center>


									</div>
								</form>

							</div><!-- end card-body -->
						</div><!-- end card -->
					</div><!-- end col -->
				</div><!-- end col -->
			</div><!-- end row -->
		</div>
		<!-- End Page-content -->

		<footer class="footer">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">
						<script>document.write(new Date().getFullYear())</script> © Cyrus Electronics.
					</div>

				</div>
			</div>
		</footer>

	</div>
	<!-- end main content-->

</div>
<!-- END layout-wrapper -->
</div>



<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<!-- JAVASCRIPT -->
<script src="../assets/libs/jquery/jquery.min.js"></script>
<script src="../assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../assets/libs/metismenu/metisMenu.min.js"></script>
<script src="../assets/libs/simplebar/simplebar.min.js"></script>
<script src="../assets/libs/node-waves/waves.min.js"></script>


<script src="../assets/libs/select2/js/select2.min.js"></script>
<script src="../assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script src="../assets/libs/spectrum-colorpicker2/spectrum.min.js"></script>
<script src="../assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
<script src="../assets/libs/admin-resources/bootstrap-filestyle/bootstrap-filestyle.min.js"></script>
<script src="../assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>

<script src="../assets/js/pages/form-advanced.init.js"></script>


<!-- jquery.vectormap map -->
<script src="../assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../assets/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-us-merc-en.js"></script>

<script src="../assets/js/pages/dashboard.init.js"></script>
<script src="../assets/libs/sweetalert2/sweetalert2.min.js"></script>
<!-- App js -->
<script src="../assets/js/app.js"></script>


<!-- Required datatable js -->
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.3.0/js/responsive.bootstrap5.min.js"></script>


<script type="text/javascript">


	var WorkID=<?php echo $WorkID ?>;

	$(document).ready(function () {
		$.ajax({
			type:'POST',
			url:'select.php',
			data:{'WorkIDMC':WorkID},
			success:function(result){

				$('.display1').DataTable().clear();
				$('.display1').DataTable().destroy();
				$('#CMData').html(result);
				$(document).ready(function () {
					$('table.display1').DataTable({
						responsive: true
					});
				});

			}
		});


		$.ajax({
			type:'POST',
			url:'select.php',
			data:{'WorkIDEX':WorkID},
			success:function(result){

				$('.display2').DataTable().clear();
				$('.display2').DataTable().destroy();
				$('#ExData').html(result);
				$(document).ready(function () {
					$('table.display2').DataTable({
						responsive: true
					});
				});

			}
		});

		$.ajax({
			type:'POST',
			url:'select.php',
			data:{'WorkIDAE':WorkID},
			success:function(result){

				$('.display3').DataTable().clear();
				$('.display3').DataTable().destroy();
				$('#EmData').html(result);
				$(document).ready(function () {
					$('table.display3').DataTable({
						responsive: true
					});
				});

			}
		});

	});


	function err(msg){
		Swal.fire({
			title: 'error!',
			text: msg,
			icon: 'error',

		})
	}


	$( "#Consumed" ).change(function() {

		if($('#Consumed').is(":checked")){
			$( "#MaterialConsumed" ).prop( "disabled", false );
			$( "#QtyMC" ).prop( "disabled", false );
        //$( "#MaterialConsumed" ).prop( "required", true );
        //$( "#QtyMC" ).prop( "required", true );

		}else{

			$( "#MaterialConsumed" ).prop( "disabled", true );
			$( "#QtyMC" ).prop( "disabled", true );
        //$( "#MaterialConsumed" ).prop( "required", false );
        //$( "#QtyMC" ).prop( "required", false );

		}
	});


	$( "#MaterialConsumed" ).change(function() {
		MaterialID=$(this).val();
		if(MaterialID){
			$.ajax({
				type:'POST',
				url:'select.php',
				data:{'GetLeftQty':MaterialID},
				success:function(result){
					document.getElementById("MaxQtyMC").value=result;
            //alert(result);

				}
			}); 

			$.ajax({
				type:'POST',
				url:'select.php',
				data:{'GetUnit':MaterialID},
				success:function(result){
					document.getElementById("UnitMC").value=result;

				}
			}); 


		}
	});


	$( "#Expense" ).change(function() {

		if($('#Expense').is(":checked")){

			$( "#MaterialEx" ).prop( "disabled", false );
			$( "#QtyEx" ).prop( "disabled", false );
			$( "#UnitEx" ).prop( "disabled", false );
			$( "#FileEx" ).prop( "disabled", false );
			$( "#RateEx" ).prop( "disabled", false );

			$( "#FileEx" ).prop( "required", true );

		}else{

			$( "#MaterialEx" ).prop( "disabled", true );
			$( "#QtyEx" ).prop( "disabled", true );
			$( "#UnitEx" ).prop( "disabled", true );
			$( "#FileEx" ).prop( "disabled", true );
			$( "#RateEx" ).prop( "disabled", true );

			$( "#FileEx" ).prop( "required", false );


		}
	});

	$( "#MoreEmployees" ).change(function() {

		if($('#MoreEmployees').is(":checked")){
			$( "#Employees" ).prop( "disabled", false );


		}else{

			$( "#Employees" ).prop( "disabled", true );

		}
	});



	$(document).on('click', '.AddMC', function(){

		var MaterialID=document.getElementById("MaterialConsumed").value;
		var Qty=document.getElementById("QtyMC").value;
		var Unit=document.getElementById("UnitMC").value;

		if(MaterialID && WorkID && Qty && Unit){
			$.ajax({
				type:'POST',
				url:'insert.php',
				data:{'MaterialID':MaterialID, 'WorkID':WorkID, 'Unit':Unit, 'Qty':Qty},
				success:function(result){
					if (result==1) {
						document.getElementById("QtyMC").value=null;
						document.getElementById("UnitMC").value=null;
						$('#MaterialConsumed').prop('selectedIndex',0);
						$.ajax({
							type:'POST',
							url:'select.php',
							data:{'WorkIDMC':WorkID},
							success:function(result){

								$('.display1').DataTable().clear();
								$('.display1').DataTable().destroy();
								$('#CMData').html(result);
								$(document).ready(function () {
									$('table.display1').DataTable({
										responsive: true
									});
								});

							}
						});

					}else{
						err(result);
					}
				}
			}); 
		}else{
			err("Please enter all fields");
		}
	});

	function limit1(element)
	{

		var Qty=document.getElementById("measurement").value;
		var MaxQty= document.getElementById("MaxQty").value;
		if(MaxQty==0){
			document.getElementById("measurement").value=null;
			document.getElementById("measurement").disabled=true;
		}else if (Qty>parseFloat(MaxQty)) {
			document.getElementById("measurement").value=(parseFloat(MaxQty)).toFixed(3);
		}

	}


	function limit2(element)
	{

		var Qty=document.getElementById("QtyMC").value;
		var MaxQty= document.getElementById("MaxQtyMC").value;
		if(MaxQty==0){
			document.getElementById("QtyMC").value=null;
			document.getElementById("QtyMC").disabled=true;
		}else if (Qty>parseInt(MaxQty)) {
			document.getElementById("QtyMC").value=(parseFloat(MaxQty)).toFixed(2);
		}

	}

	$(document).on('click', '.DeleteMC', function(){

		var ID=$(this).attr("id");
		if(ID){

			$.ajax({
				type:'POST',
				url:'insert.php',
				data:{'DelMC':ID},
				success:function(result){

					if (result==1) {

						$.ajax({
							type:'POST',
							url:'select.php',
							data:{'WorkIDMC':WorkID},
							success:function(result){

								$('.display1').DataTable().clear();
								$('.display1').DataTable().destroy();
								$('#CMData').html(result);
								$(document).ready(function () {
									$('table.display1').DataTable({
										responsive: true
									});
								});

							}
						});

					}else{
						err(result);
					}

				}
			});

		}
	});


	$(document).on('click', '.AddEx', function(){

		var Material=document.getElementById("MaterialEx").value;
		Material = Material.replace(/\\/g, "/");
		var Qty=document.getElementById("QtyEx").value;
		var Unit=document.getElementById("UnitEx").value;
		var Rate=document.getElementById("RateEx").value;

		if(Material && WorkID && Qty && Unit && Rate){

			if((Material.indexOf("/") > -1)){
				err("Do not use forwardslash or backslash in Material name");
			}else{
				$.ajax({
					type:'POST',
					url:'insert.php',
					data:{'MaterialEx':Material, 'WorkIDEx':WorkID, 'UnitEx':Unit, 'QtyEx':Qty, 'RateEx':Rate},
					success:function(result){
						if (result==1) {
							document.getElementById("QtyMC").value=null;
							document.getElementById("MaterialEx").value=null;
							document.getElementById("RateEx").value=null;
							$('#UnitEx').prop('selectedIndex',0);

							$.ajax({
								type:'POST',
								url:'select.php',
								data:{'WorkIDEX':WorkID},
								success:function(result){

									$('.display2').DataTable().clear();
									$('.display2').DataTable().destroy();
									$('#ExData').html(result);
									$(document).ready(function () {
										$('table.display2').DataTable({
											responsive: true
										});
									});

								}
							});

						}else{
							err(result);
						}
					}
				}); 
			}
		}else{
			err("Please enter all fields");
		}
	});



	$(document).on('click', '.DeleteEx', function(){

		var ID=$(this).attr("id");
		if(ID){

			$.ajax({
				type:'POST',
				url:'insert.php',
				data:{'DelEx':ID},
				success:function(result){

					if (result==1) {

						$.ajax({
							type:'POST',
							url:'select.php',
							data:{'WorkIDEX':WorkID},
							success:function(result){

								$('.display2').DataTable().clear();
								$('.display2').DataTable().destroy();
								$('#ExData').html(result);
								$(document).ready(function () {
									$('table.display2').DataTable({
										responsive: true
									});
								});

							}
						});
					}else{
						err(result);
					}

				}
			});

		}
	});


	$( "#Employees" ).change(function() {
		Data=[];
		Data=$(this).val();

		const obj = JSON.parse(Data);
		var EmployeeCode=obj.EmployeeCode;
		var EmployeeName=obj.EmployeeName;
    //alert(EmployeeName);
		if(EmployeeCode){


			Swal.fire({
				title: 'Are you sure?',
				text: "You want to add "+EmployeeName,
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Add'
			}).then((result) => {
				if (result.isConfirmed) {

					$.ajax({
						type:'POST',
						url:'insert.php',
						data:{'AddEmployee':EmployeeCode, 'WorkIDAE':WorkID, 'EmployeeNameAE':EmployeeName},
						success:function(result){

							if (result==1) {

								$.ajax({
									type:'POST',
									url:'select.php',
									data:{'WorkIDAE':WorkID},
									success:function(result){

										$('.display3').DataTable().clear();
										$('.display3').DataTable().destroy();
										$('#EmData').html(result);
										$(document).ready(function () {
											$('table.display3').DataTable({
												responsive: true
											});
										});

									}
								});
							}else{
								err(result);
							}

						}
					});

				}
			})
		}
	});

	$(document).on('click', '.DeleteAE', function(){

		var ID=$(this).attr("id");
		if(ID){

			$.ajax({
				type:'POST',
				url:'insert.php',
				data:{'DelAE':ID},
				success:function(result){

					if (result==1) {

						$.ajax({
							type:'POST',
							url:'select.php',
							data:{'WorkIDAE':WorkID},
							success:function(result){

								$('.display3').DataTable().clear();
								$('.display3').DataTable().destroy();
								$('#EmData').html(result);
								$(document).ready(function () {
									$('table.display3').DataTable({
										responsive: true
									});
								});

							}
						});

					}else{
						err(result);
					}

				}
			});

		}
	});

	$( "#Labour" ).change(function() {

		if($('#Labour').is(":checked")){
			$( "#LabourDetails" ).prop( "disabled", false );

			$( "#LabourQty" ).prop( "disabled", false );
		}else{

			$( "#LabourDetails" ).prop( "disabled", true );

			$( "#LabourQty" ).prop( "disabled", true );

		}
	});

</script>
</body>

</html>