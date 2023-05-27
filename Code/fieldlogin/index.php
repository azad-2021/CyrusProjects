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
                            <h4 class="mb-0">Dashboard</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-xl-12">
                        <div class="row h-100">
                            <div class="col-md-6 col-xl-6">
                                <div class="card overflow-hidden card-h-100">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between">
                                            <h5 class="font-size-15 text-uppercase mb-0">Pending Work</h5>
                                            <div class="avatar-xs">
                                                <span class="avatar-title rounded bg-soft-danger font-size-20 mini-stat-icon">
                                                    <i class="ri-file-list-fill text-danger"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <h3 class="font-size-24"><?php echo $PendingOrder; ?></h3>
                                    </div><!-- end card-body -->

                                </div><!-- end card -->
                            </div><!-- end col-->

                            <div class="col-md-6 col-xl-6">
                                <div class="card overflow-hidden card-h-100">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between">
                                            <h5 class="font-size-15 text-uppercase mb-0">Pending Verification</h5>
                                            <div class="avatar-xs">
                                                <span class="avatar-title rounded bg-soft-danger font-size-20 mini-stat-icon">
                                                    <i class="ri-file-list-fill text-danger"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <h3 class="font-size-24">0 </h3>

                                    </div><!-- end card-body -->

                                </div><!-- end card -->
                            </div><!-- end col-->

                            <!--
                            <div class="col-xl-4">
                                <div class="card overflow-hidden card-h-100">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between">
                                            <h5 class="font-size-15 text-uppercase mb-0">Pending Payment / Total Billing</h5>
                                            <div class="avatar-xs">
                                                <span class="avatar-title rounded bg-soft-success font-size-20 mini-stat-icon">
                                                    <i class="ri-funds-fill text-success"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <h3 class="font-size-24">2048/100000</h3>

                                    </div>

                                </div>
                            </div> end col -->
                        </div><!-- end row -->
                    </div><!-- end col -->

                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title mb-4">Orders</h4>

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
                                                    <th style="min-width:80px;">Start Date</th>
                                                    <th style="min-width:80px;">End Date</th>
                                                    <th style="min-width:80px;">Assign Date</th>
                                                    <th style="min-width:60px;">Left Days</th>
                                                    <th style="min-width:100px;">Action</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <?php 
                                                $query="SELECT * FROM cyrusproject.vpendingwork WHERE EmployeeCode=$EmployeeCode";
                                                $result=mysqli_query($con,$query);
                                                if (mysqli_num_rows($result)>0)
                                                {

                                                    while ($row=mysqli_fetch_assoc($result))
                                                    {
                                                        if($row["LeftDays"]<5){

                                                            $tr='<tr class="badge-soft-warning">';
                                                        }else{
                                                            $tr='<tr>';
                                                        }
                                                        $WorkID=base64_encode($row["WorkID"]);
                                                        print($tr);


                                                        print '<td>'.$row["Organization"]."</td>";
                                                        print '<td>'.$row["DivisionName"]."</td>";
                                                        print '<td>'.$row["SiteName"]."</td>";
                                                        print '<td>'.$row["WorkID"]."</td>";
                                                        print '<td>'.$row["Work"]."</td>";
                                                        print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
                                                        print '<td><span class="d-none">'.$row["StartDate"].'</span>'.date('d-M-Y',strtotime($row["StartDate"]))."</td>";
                                                        print '<td><span class="d-none">'.$row["EndDate"].'</span>'.date('d-M-Y',strtotime($row["EndDate"]))."</td>";
                                                        print '<td><span class="d-none">'.$row["StartDate"].'</span>'.date('d-M-Y',strtotime($row["AssignDate"]))."</td>";
                                                        print '<td>'.$row["LeftDays"]."</td>";
                                                        print '<td><a href="reporting.php?WorkID='.$WorkID.'">Enter Details</a></td>';
                                                        print '</tr>';
                                                    }

                                                }
                                                ?>
                                            </tbody>
                                        </table>
                                    </div> 

                                    <h4 class="card-title mb-4">Office Work</h4>

                                    <div class="table-responsive">
                                        <table id="" class="table table-hover table-centered table-bordered border-primary display" width="100%">
                                            <thead class="thead-light" style="text-align:center;">
                                                <tr>
                                                    <th style="min-width:150px;">Organization</th>
                                                    <th style="min-width:150px;">Division</th>
                                                    <th style="min-width:150px;">Site</th>
                                                    <th style="min-width:60px;">Work ID</th>
                                                    <th style="min-width:120px;">Work</th>
                                                    <th style="min-width:80px;">Assign Date</th>
                                                    <th style="min-width:100px;">Action</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <?php 
                                                $query="SELECT Organization, DivisionName, SiteName, WorkID, Work, OrderID, site.SiteCode, AssignDate FROM cyrusproject.site_ofice_work
                                                inner join site on site_ofice_work.SiteCode=site.SiteCode
                                                inner join organization_details on site.DivisionCode=organization_details.DivisionCode WHERE Closed=0
                                                and EmployeeCode=$EmployeeCode";
                                                $result=mysqli_query($con,$query);
                                                if (mysqli_num_rows($result)>0)
                                                {

                                                    while ($row=mysqli_fetch_assoc($result))
                                                    {
                 
                                                        $WorkID=base64_encode($row["WorkID"]);
                                                        print($tr);


                                                        print '<td>'.$row["Organization"]."</td>";
                                                        print '<td>'.$row["DivisionName"]."</td>";
                                                        print '<td>'.$row["SiteName"]."</td>";
                                                        print '<td>'.$row["WorkID"]."</td>";
                                                        print '<td>'.$row["Work"]."</td>";
                                                        print '<td><span class="d-none">'.$row["AssignDate"].'</span>'.date('d-M-Y',strtotime($row["AssignDate"]))."</td>";
                                                        print '<td><a href="officereporting.php?WorkID='.$WorkID.'">Enter Details</a></td>';
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
        $(document).ready(function () {
            $('table.display').DataTable({
                responsive: true
            });
        });

        $(document).ready(function () {
            $('table.display').DataTable();
        });

        function err(msg){
            Swal.fire({
                title: 'error!',
                text: msg,
                icon: 'error',

            })
        }

    </script>
</body>

</html>