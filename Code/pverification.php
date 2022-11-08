<?php 
include"connection.php";
include"session.php";
date_default_timezone_set('Asia/Calcutta');
$timestamp =date('y-m-d H:i:s');
$Date = date('Y-m-d',strtotime($timestamp));


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
$query="SELECT count(WorkID) FROM cyrusproject.vpendingwork WHERE EmployeeCode=$EmployeeCode";
$result=mysqli_query($con,$query);
if (mysqli_num_rows($result)>0)
{
    $row=mysqli_fetch_assoc($result);
    $PendingOrder=$row["count(WorkID)"];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="" name="description" />
    <meta content="Anant Singh" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/cyruslogo.png">

    <!-- jquery.vectormap css -->
    <link href="assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />

    <!-- Bootstrap Css -->
    <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <!-- App Css-->
    <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

    <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />


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
    <div class="modal fade" id="ConsumedMaterail" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
            <div class="modal-content rounded-corner">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Consumed Material Details</h5>

                </div>
                <div class="modal-body">

                    <table class="table table-hover table-bordered border-primary CDisplay" style="margin-top:45px" width="100%">
                        <thead>
                            <th width="75%">Material Name</th>
                            <th width="25%">Quantity</th>
                        </thead>
                        <tbody id="ConsumedData">

                        </tbody>
                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ExpenseModal" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
            <div class="modal-content rounded-corner">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Expense Details</h5>

                </div>
                <div class="modal-body">

                    <table class="table table-hover table-bordered border-primary ExDisplay" style="margin-top:45px" width="100%">
                        <thead>
                            <th width="30%">Material Name</th>
                            <th width="20%">Quantity</th>
                            <th width="20%">Rate</th>
                            <th width="20%">Amount</th>
                            <th width="10%">Document</th>
                        </thead>
                        <tbody id="ExpenseData">

                        </tbody>
                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="Verify" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
            <div class="modal-content rounded-corner">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Work Verification</h5>

                </div>
                <div class="modal-body">

                    <div class="row">

                        <div class="col-lg-12">
                            <label>Enter Verification Remark</label>
                            <textarea class="form-control rounded-corner" id="VRemark" type="text"></textarea>
                            
                        </div>

                        <div class="col-lg-12" style="margin-top:42px;">
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" type="radio" name="Verification" value="Verified" >
                              <label class="form-check-label" for="flexRadioDefault1">Verified</label>
                              <div class="form-check form-check-inline">
                                  <input class="form-check-input" type="radio" name="Verification" value="Rejected">
                                  <label class="form-check-label" for="flexRadioDefault1">
                                    Rejected
                                </label>
                            </div>
                            <input type="text" name="" id="VID" class="d-none">
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary SaveVerification">Save</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>

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
                        <h4 class="mb-0">Pending Verification</h4>

                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Cyrus</a></li>
                                <li class="breadcrumb-item active">Pending Verification</li>
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
                            <div class="table-responsive">
                                <table id="" class="table table-hover table-centered table-bordered border-primary display" width="100%">
                                    <thead class="thead-light" style="text-align:center;">
                                        <tr>
                                            <th style="min-width:150px;">Organization</th>
                                            <th style="min-width:150px;">Division</th>
                                            <th style="min-width:150px;">Site</th>
                                            <th style="min-width:60px;">Work ID</th>
                                            <th style="min-width:120px;">Work</th>
                                            <th style="min-width:80px;">Quantity</th>
                                            <th style="min-width:80px;">Entry Date</th>
                                            <th style="min-width:60px;">Material Consumed</th>
                                            <th style="min-width:60px;">Expense</th>
                                            <th style="min-width:100px;">Addtitional Employee</th>
                                            <th style="min-width:100px;">Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <?php 
                                        $query="SELECT * FROM cyrusproject.vpending_verification";
                                        $result=mysqli_query($con,$query);
                                        if (mysqli_num_rows($result)>0)
                                        {

                                            while ($row=mysqli_fetch_assoc($result))
                                            {
                                                $VID=$row["VerificationID"];

                                                $Additional='No';
                                                if ($row["AdditionalEmployee"]==1) {
                                                    $Additional='Yes';

                                                }

                                                $Material='No';
                                                $Expense='No';
                                                $query1="SELECT * FROM `material consumed` WHERE VerificationID=$VID";
                                                $result1=mysqli_query($con,$query1);
                                                if (mysqli_num_rows($result1)>0)
                                                {
                                                 $Material='<a href="" data-bs-toggle="modal" data-bs-target="#ConsumedMaterail" id="'.$VID.'" class="ShowConsumed">Yes</a>'; 
                                             }

                                             $query2="SELECT * FROM `employee expense` WHERE VerificationID=$VID";
                                             $result2=mysqli_query($con,$query2);
                                             if (mysqli_num_rows($result2)>0)
                                             {
                                                $Expense='<a href="" data-bs-toggle="modal" data-bs-target="#ExpenseModal" id="'.$VID.'" class="ShowExpense">Yes</a>';
                                            }
                                            print'<tr class="badge-soft-success">';
                                            print '<td>'.$row["Organization"]."</td>";
                                            print '<td>'.$row["DivisionName"]."</td>";
                                            print '<td>'.$row["SiteName"]."</td>";
                                            print '<td>'.$row["WorkID"]."</td>";
                                            print '<td>'.$row["Work"]."</td>";
                                            print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
                                            print '<td><span class="d-none">'.$row["WorkDate"].'</span>'.date('d-M-Y',strtotime($row["WorkDate"]))."</td>";

                                            print '<td>'.$Material.'</td>';
                                            print '<td>'.$Expense.'</td>';
                                            print '<td>'.$Additional.'</td>';
                                            print '<td><a href="" data-bs-toggle="modal" data-bs-target="#Verify" id="'.$VID.'" class="VerifyWork">Verify</a></td>';
                                            print '</tr>';
                                        }

                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>                        
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
<script src="assets/libs/jquery/jquery.min.js"></script>
<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/libs/metismenu/metisMenu.min.js"></script>
<script src="assets/libs/simplebar/simplebar.min.js"></script>
<script src="assets/libs/node-waves/waves.min.js"></script>


<script src="assets/libs/select2/js/select2.min.js"></script>
<script src="assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script src="assets/libs/spectrum-colorpicker2/spectrum.min.js"></script>
<script src="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
<script src="assets/libs/admin-resources/bootstrap-filestyle/bootstrap-filestyle.min.js"></script>
<script src="assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>

<script src="assets/js/pages/form-advanced.init.js"></script>


<!-- jquery.vectormap map -->
<script src="assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="assets/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-us-merc-en.js"></script>

<script src="assets/js/pages/dashboard.init.js"></script>
<script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>
<!-- App js -->
<script src="assets/js/app.js"></script>


<!-- Required datatable js -->
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.3.0/js/responsive.bootstrap5.min.js"></script>


<script type="text/javascript">
//
$(document).ready(function () {
    $('table.display').DataTable({
        responsive: true
    });
});


function err(msg){
    Swal.fire({
        title: 'error!',
        text: msg,
        icon: 'error',

    })
}


$(document).on('click', '.SaveVerification', function(){

    var Vremark=document.getElementById("VRemark").value;
    var VID=document.getElementById("VID").value;
    var Verification=$('input[name="Verification"]:checked').val();

    if(Vremark && VID && Verification){
        $.ajax({
          type:'POST',
          url:'insert.php',
          data:{'Vremark':Vremark, 'VRID':VID, 'Verification':Verification},
          success:function(result){

            if (result==1) {
                location.reload();
            }else{
                err(result);
            }
        }
    });
        
    }else{
        $('.CDisplay').DataTable().clear();
        $('.CDisplay').DataTable().destroy();
    }
});


$(document).on('click', '.ShowExpense', function(){

    var VID=$(this).attr("id");

    if(VID){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'VIDExpense':VID},
          success:function(result){

            $('.ExDisplay').DataTable().clear();
            $('.ExDisplay').DataTable().destroy();
            $('#ExpenseData').html(result);
            $(document).ready(function () {
                $('table.ExDisplay').DataTable({
                    responsive: true
                });
            });
        }
    });
        
    }else{
        $('.ExDisplay').DataTable().clear();
        $('.ExDisplay').DataTable().destroy();
    }
});


$(document).on('click', '.ShowConsumed', function(){

    var VID=$(this).attr("id");

    if(VID){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'VIDConsumed':VID},
          success:function(result){

            $('.CDisplay').DataTable().clear();
            $('.CDisplay').DataTable().destroy();
            $('#ConsumedData').html(result);
            $(document).ready(function () {
                $('table.CDisplay').DataTable({
                    responsive: true
                });
            });
        }
    });
        
    }else{
        $('.CDisplay').DataTable().clear();
        $('.CDisplay').DataTable().destroy();
    }
});

$(document).on('click', '.VerifyWork', function(){
    var VID=$(this).attr("id");
    var VID=document.getElementById("VID").value=VID;


});

</script>
</body>

</html>