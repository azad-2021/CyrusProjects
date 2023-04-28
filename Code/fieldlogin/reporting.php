<?php 
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
$query="SELECT MaterialName, sitework.SiteCode, Work, Unit, sitework.Qty, sitework.OrderID, sitework.WorkTypeID  FROM cyrusproject.sitework
join worktype on sitework.WorkTypeID=worktype.WorkTypeID
join demand_details on sitework.MaterialID=demand_details.MaterialID WHERE WorkID=$WorkID";
$result=mysqli_query($con,$query);
if (mysqli_num_rows($result)>0)
{
    $row=mysqli_fetch_assoc($result);
    $MaterialWork=$row["MaterialName"];
    $SiteCode=$row["SiteCode"];
    $Work=$row["Work"];
    $Unit=$row["Unit"];
    $WQty=$row["Qty"];
    $OrderID=$row["OrderID"];
    $WorkTypeID=$row["WorkTypeID"];
}

$VQty=0;
$LeftQty=$WQty;
$query="SELECT sum(Qty) FROM cyrusproject.work_verification WHERE WorkID=$WorkID";
$result=mysqli_query($con,$query);
if (mysqli_num_rows($result)>0)
{
    $row=mysqli_fetch_assoc($result);
    $VQty=$row["sum(Qty)"];
}

if ($VQty>0) {

    $LeftQty=$WQty-$VQty;
    
}

if (isset($_POST['submit'])) {
    $errors='';
    $home=1;
    $WorkQty=$_POST['WorkQty'];

    if (isset($_POST['Expense'])) {
        $file_name = $_FILES['FileEx']['name'];
        $file_size =$_FILES['FileEx']['size'];
        $file_tmp =$_FILES['FileEx']['tmp_name'];
        $file_type=$_FILES['FileEx']['type'];
        $tmp = explode('.', $_FILES['FileEx']['name']);
        $file_ext = strtolower(end($tmp));    

        $extensions= array("pdf");

        if(in_array($file_ext,$extensions)=== false){
            $errors ='<script>alert("File must be pdf")</script>';
            $home=0;
        }elseif($file_size > 2097152){
            $errors ='<script>alert("File must be less than 2MB")</script>';
        }elseif($file_size == 0){
            $errors ='<script>alert("File must be less than 2MB")</script>';
            $home=0;
        }
    }

    $query="SELECT * FROM work_verification WHERE WorkID=$WorkID and WorkDate='$Date' and Closed=0";
    $result=mysqli_query($con,$query);
    if (mysqli_num_rows($result)>0)
    {
        $errors ='<script>alert("Entry already exist")</script>';
        $home=0;
    }


    if (empty($errors)==true) {

        $sql = "INSERT INTO work_verification (EmployeeCode, SiteCode, OrderID, WorkID, WorkTypeID, Qty, WorkDate)
        VALUES ($EmployeeCode, $SiteCode, $OrderID, $WorkID, $WorkTypeID, $WorkQty, '$Date')";

        if ($con->query($sql) === TRUE) {
            $VID=$con->insert_id;


            if (isset($_POST['Consumed'])) {
                $query="SELECT * FROM tempconsumed WHERE WorkID=$WorkID";
                $result=mysqli_query($con,$query);
                if (mysqli_num_rows($result)>0)
                {
                    while ($row=mysqli_fetch_assoc($result))
                    {
                        $MaterialID=$row["MaterialID"];
                        $Qty=$row["CQty"];


                        $sql2 = "INSERT INTO `material consumed` (VerificationID, MaterialID, Qty)
                        VALUES ($VID, $MaterialID, $Qty)";

                        if ($con->query($sql2) === TRUE) {

                        } else {
                            $home=0;
                            echo "Error: " . $sql2 . "<br>" . $con->error;
                        }


                    }
                }

            }




            if (isset($_POST['Expense'])) {
                $ExFile=$VID.'_'.$FDate.".".$file_ext;   

                $Upload=move_uploaded_file($file_tmp,"expense/".$ExFile);


                if ($Upload==1) {

                    $query="SELECT * FROM tempexpense WHERE WorkID=$WorkID";
                    $result=mysqli_query($con,$query);
                    if (mysqli_num_rows($result)>0)
                    {

                        while ($row=mysqli_fetch_assoc($result))
                        {

                            $MaterialName=$row["MaterialName"];
                            $Qty=$row["Qty"];
                            $Rate=$row["Rate"];
                            $Unit=$row["Unit"];

                            $sql3 = "INSERT INTO `employee expense` (VerificationID, MaterialName, Rate, Qty, Unit)
                            VALUES ($VID, '$MaterialName', $Rate, $Qty, '$Unit')";

                            if ($con->query($sql3) === TRUE) {

                            } else {
                                $home=0;
                                echo "Error: " . $sql3 . "<br>" . $con->error;
                            }

                        }
                    }

                }
            }


            if (isset($_POST['MoreEmployees'])) {
                $query="SELECT * FROM tempemployee WHERE WorkID=$WorkID";
                $result=mysqli_query($con,$query);
                if (mysqli_num_rows($result)>0)
                {
                    while ($row=mysqli_fetch_assoc($result))
                    {
                        $EmployeeCodeA=$row["EmployeeCode"];

                        $sql4 = "INSERT INTO work_verification (EmployeeCode, SiteCode, OrderID, WorkID, WorkTypeID, Qty, WorkDate, AdditionalEmployee)
                        VALUES ($EmployeeCodeA, $SiteCode, $OrderID, $WorkID, $WorkTypeID, $WorkQty, '$Date', 1)";

                        if ($con->query($sql4) === TRUE) {

                        } else {
                            $home=0;
                            echo "Error: " . $sql4 . "<br>" . $con->error;
                        }


                    }
                }

            }

        }else{

            $home=0;
            echo "Error: " . $sql . "<br>" . $con->error;

        }


        $sql = "DELETE FROM tempemployee WHERE WorkID=$WorkID";

        if ($con->query($sql) === TRUE) {

        } else {
            $home=0;
            echo "Error: " . $sql . "<br>" . $con->error;
        }

        $sql = "DELETE FROM tempexpense WHERE WorkID=$WorkID";

        if ($con->query($sql) === TRUE) {

        } else {
            $home=0;
            echo "Error: " . $sql . "<br>" . $con->error;
        }

        $sql = "DELETE FROM tempconsumed WHERE WorkID=$WorkID";

        if ($con->query($sql) === TRUE) {

        } else {
            $home=0;
            echo "Error: " . $sql . "<br>" . $con->error;
        }


        if ($home==1){

            header("Location:index.php");
        }

    }else{
        echo $errors;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>Work Reporting</title>
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
                            <h4 class="mb-0">Reporting</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Cyrus</a></li>
                                    <li class="breadcrumb-item active">Reporting</li>
                                </ol>
                            </div>

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

                                        <div class="col-lg-12" style="margin-bottom:10px;">
                                            <label>Work Detail</label>
                                            <textarea class="form-control rounded-corner" disabled><?php echo $MaterialWork; ?></textarea>
                                        </div>
                                        <div class="col-lg-4">
                                            <label>Work</label>
                                            <input type="text" name="" id="" class="form-control rounded-corner" value="<?php echo $Work; ?>" disabled>
                                        </div>
                                        <div class="col-lg-2">
                                            <label>Maximum Quantity</label>
                                            <input type="number" name="" id="MaxQty" class="form-control rounded-corner" value="<?php echo $LeftQty; ?>" disabled>
                                        </div>
                                        <div class="col-lg-3">
                                            <label>Quantity</label>
                                            <input type="number" name="WorkQty" id="measurement" class="form-control rounded-corner"
                                            min=1 onkeydown="limit1(this);" onkeyup="limit1(this);" step=".001" required>
                                        </div>
                                        <div class="col-lg-3">
                                            <label>Unit</label>
                                            <input type="text" name="" id="Unit" class="form-control rounded-corner" value="<?php echo $Unit; ?>" disabled>
                                        </div>

                                        <!-- Consumed Material -->

                                        <h4 align="center" style="margin-top:15px;">
                                          <label class="form-check-label" for="flexCheckDefault">Material Consumed</label>
                                          <input class="form-check-input" type="checkbox" value="1" id="Consumed" name="Consumed">
                                      </h4>

                                      <div class="col-lg-4 MC">
                                        <label>Consumed Material</label>
                                        <select class="form-control rounded-corner2" id="MaterialConsumed" disabled>
                                            <option value="">Select</option>
                                            <?php
                                            $query="SELECT sitesurvey.MaterialID, MaterialName, sitesurvey.Qty FROM cyrusproject.sitesurvey
                                            join demand_details on sitesurvey.MaterialID=demand_details.MaterialID WHERE sitesurvey.SiteCode=$SiteCode";
                                            $result=mysqli_query($con,$query);
                                            if (mysqli_num_rows($result)>0)
                                            {
                                              while ($arr=mysqli_fetch_assoc($result))
                                              {
                                                ?>
                                                <option value="<?php echo $arr['MaterialID']; ?>"><?php echo $arr['MaterialName']; ?></option>
                                                <?php
                                            }}?>
                                        </select>
                                    </div>

                                    <div class="col-lg-2 MC">
                                        <label>Maximum Quantity</label>
                                        <input type="text" name="" id="MaxQtyMC" class="form-control rounded-corner" disabled>
                                    </div>
                                    <div class="col-lg-2 MC">
                                        <label>Quantity</label>
                                        <input type="number" name="" id="QtyMC" class="form-control rounded-corner" onkeydown="limit2(this);" onkeyup="limit2(this);" disabled>
                                    </div>
                                    <div class="col-lg-2 MC" style="margin-bottom: 20px;">
                                        <label>Unit</label>
                                        <input type="text" name="" id="UnitMC" class="form-control rounded-corner" disabled>
                                    </div>
                                    <div class="col-lg-2" style="margin-top:20px; margin-bottom: 28px;">

                                        <button type="button" class="btn btn-primary AddMC">Add</button>

                                    </div>
                                    <table class="table table-centered table-hover table-bordered border-primary display1" style="margin-top: 25px;">
                                        <thead>
                                            <th width="50%">Consumed Material</th>
                                            <th width="25%">Quantity</th>
                                            <th width="25%">Action</th>
                                        </thead>
                                        <tbody id="CMData"></tbody>

                                    </table>

                                    <!-- Expense -->
                                    <h4 align="center" style="margin-top:10px;">
                                        <label class="form-check-label" for="flexCheckDefault">Expense</label>
                                        <input class="form-check-input" type="checkbox" value="1" id="Expense" name="Expense">
                                    </h4>

                                    <div class="col-lg-3">
                                        <label>Expense Material</label>
                                        <input type="text" name="" id="MaterialEx" class="form-control rounded-corner" disabled>
                                    </div>
                                    <div class="col-lg-2">
                                        <label>Quantity</label>
                                        <input type="number" name="" id="QtyEx" class="form-control rounded-corner" disabled>
                                    </div>
                                    <div class="col-lg-2">
                                        <label>Unit</label>
                                        <select class="form-control rounded-corner" id="UnitEx" disabled>
                                            <option value="">Select</option>
                                            <?php
                                            $query="SELECT * FROM units";
                                            $result=mysqli_query($con,$query);
                                            if (mysqli_num_rows($result)>0)
                                            {
                                              while ($arr=mysqli_fetch_assoc($result))
                                              {
                                                ?>
                                                <option value="<?php echo $arr['Unit']; ?>"><?php echo $arr['Unit']; ?></option>
                                                <?php
                                            }}?>
                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <label>Rate</label>
                                        <input type="number" name="" id="RateEx" class="form-control rounded-corner" disabled>
                                    </div>

                                    <div class="col-lg-2" style="margin-top:20px; margin-bottom: 28px;">

                                        <button type="button" class="btn btn-primary AddEx">Add</button>

                                    </div>


                                    <table class="table table-centered table-hover table-bordered border-primary display2" style="margin-top: 25px;">
                                        <thead>
                                            <th width="28%">Expense Detail</th>
                                            <th width="18%">Quantity</th>
                                            <th width="18%">Rate</th>
                                            <th width="18%">Amount</th>
                                            <th width="18%">Action</th>
                                        </thead>
                                        <tbody id="ExData"></tbody>

                                    </table>
                                    <center>
                                        <div class="col-lg-3" >
                                            <label>Upload Receipt <br> (File must be pdf of size less tha 2MB)</label>
                                            <input type="file" name="FileEx" id="FileEx" class="form-control rounded-corner" disabled>
                                        </div>
                                    </center>

                                    <h4 align="center" style="margin-top:10px;">
                                        <label class="form-check-label" for="flexCheckDefault">More Employees</label>
                                        <input class="form-check-input" type="checkbox" value="1" id="MoreEmployees" name="MoreEmployees">
                                    </h4>
                                    <center>

                                        <div class="col-lg-3">
                                            <label>Select Employee</label>
                                            <select class="form-control rounded-corner" id="Employees" disabled>
                                                <option value="">Select</option>
                                                <?php
                                                $query="SELECT EmployeeCode, EmployeeName FROM cyrusproject.employees WHERE DesignationID=2 and Active=1 and EmployeeCode!=$EmployeeCode";
                                                $result=mysqli_query($con,$query);
                                                if (mysqli_num_rows($result)>0)
                                                {
                                                  while ($arr=mysqli_fetch_assoc($result))
                                                  {
                                                    $d = array("EmployeeCode"=>$arr['EmployeeCode'], "EmployeeName"=>$arr['EmployeeName']);
                                                    $data=json_encode($d);

                                                    ?>
                                                    <option value='<?php print_r($data) ?>'><?php echo $arr['EmployeeName']; ?></option>
                                                    <?php
                                                }}?>
                                            </select>
                                        </div>

                                        <table class="table table-centered table-hover table-bordered border-primary display3" style="margin-top: 20px;">
                                            <thead>
                                                <th >Employee Name</th>
                                                <th>Action</th>
                                            </thead>
                                            <tbody id="EmData"></tbody>

                                        </table>


                                        <div class="col-lg-3" style="margin-top:20px;">
                                            <button type="submit" name="submit" class="btn btn-primary">Submit</button>
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
//

var WorkID=<?php echo $WorkID ?>;
//alert(SimNo.toString().length);
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

  //Type=$(this).val();
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


</script>
</body>

</html>