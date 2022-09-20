<?php 
include"connection.php";
include"query.php";
?>

<!doctype html>
    <html lang="en">

    <head>

        <meta charset="utf-8" />
        <title>Home</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="" name="description" />
        <meta content="Anant Singh" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/cyrus logo.png">

        <!-- jquery.vectormap css -->
        <link href="assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />

        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
        <!-- App Css-->
        <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

        <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css">


        <!-- DataTables -->
        <link href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/datatables.net-select-bs4/css//select.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    </head>

    <body data-sidebar="dark" data-topbar="dark">

        <!-- <body data-layout="horizontal" data-topbar="dark"> -->

            <!-- Begin page -->
            <?php 

            include"header.php";
            include"sidebar.php";
            include"modals.php";

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

                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Cyrus</a></li>
                                            <li class="breadcrumb-item active">Dashboard</li>
                                        </ol>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row">
                            <div class="col-xl-12">
                                <div class="row h-100">
                                    <div class="col-md-6 col-xl-4">
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
                                                <h3 class="font-size-24">26 </h3>

                                            </div><!-- end card-body -->

                                                <!-- Project chart 
                                                    <div id="project-chart"></div>-->
                                                </div><!-- end card -->
                                            </div><!-- end col-->

                                            <div class="col-md-6 col-xl-4">
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
                                                        <h3 class="font-size-24">46 </h3>

                                                    </div><!-- end card-body -->

                                                <!-- user chart 
                                                    <div id="user-chart"></div>-->
                                                </div><!-- end card -->
                                            </div><!-- end col-->

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
                                                        
                                                    </div><!-- end card-body -->

                                                    <!-- order chart 
                                                        <div id="order-chart"></div>-->
                                                    </div><!-- end card -->
                                                </div><!-- end col -->
                                            </div><!-- end row -->
                                        </div><!-- end col -->

                                        <div class="row">
                                            <div class="col-xl-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h4 class="card-title mb-4">Orders Completition less than 30 days</h4>

                                                        <div class="table-responsive">
                                                            <table id="" class="table table-centered table-nowrap mb-0 table-bordered display">
                                                                <thead class="thead-light">
                                                                    <tr>
                                                                        <th>Organization</th>
                                                                        <th>Division</th>
                                                                        <th>Order ID</th>
                                                                        <th>LOA Date</th>
                                                                        <th>Completion Date</th>
                                                                    </tr>
                                                                </thead>

                                                                <tbody>
                                                                    <tr class="badge-soft-danger">
                                                                        <td>
                                                                            <div class="d-flex align-items-center">

                                                                                <div class="flex-grow-1 ms-3">
                                                                                    <div>Org 1</div>
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                        <td>Division 1</td>
                                                                        <td>1234</td>
                                                                        <td>17 Sep 2022</td>
                                                                        <td>17 Sep 2023</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>                        
                                                    </div><!-- end card-body -->
                                                </div><!-- end card -->
                                            </div><!-- end col -->

                                            <div class="col-xl-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h4 class="card-title mb-4">BG Completition less than 30 days</h4>

                                                        <div class="table-responsive">
                                                            <table class="table table-centered table-nowrap mb-0 table-bordered display">
                                                                <thead class="thead-light">
                                                                    <tr>
                                                                        <th>Organization</th>
                                                                        <th>Division</th>
                                                                        <th>Order ID</th>
                                                                        <th>LOA Date</th>
                                                                        <th>Completion Date</th>
                                                                        <th>BG Amount</th>
                                                                        <th>BG Date</th>
                                                                    </tr>
                                                                </thead>

                                                                <tbody>
                                                                    <tr class="badge-soft-danger">
                                                                        <td>
                                                                            <div class="d-flex align-items-center">

                                                                                <div class="flex-grow-1 ms-3">
                                                                                    <div>Org 1</div>
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                        <td>Division 1</td>
                                                                        <td>1234</td>
                                                                        <td>17 Sep 2022</td>
                                                                        <td>17 Sep 2023</td>
                                                                        <th>200000</th>
                                                                        <td>17 Mar 2023</td>
                                                                    </tr>

                                                                </tbody>
                                                            </table>
                                                        </div>                        
                                                    </div><!-- end card-body -->
                                                </div><!-- end card -->

                                                <div class="col-xl-12">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <h4 class="card-title mb-4">Pending Orders for material requirement</h4>

                                                            <div class="table-responsive">
                                                                <table class="table table-centered table-nowrap mb-0 table-bordered display">
                                                                    <thead class="thead-light">
                                                                        <tr>
                                                                            <th>Organization</th>
                                                                            <th>Division</th>
                                                                            <th>Order ID</th>
                                                                            <th>LOA Date</th>
                                                                            <th>Completion Date</th>
                                                                            <th>BG Amount</th>
                                                                            <th>BG Date</th>
                                                                        </tr>
                                                                    </thead>

                                                                    <tbody>
                                                                        <tr class="badge-soft-danger">
                                                                            <td>
                                                                                <div class="d-flex align-items-center">

                                                                                    <div class="flex-grow-1 ms-3">
                                                                                        <div>Org 1</div>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                            <td>Division 1</td>
                                                                            <td>1234</td>
                                                                            <td>17 Sep 2022</td>
                                                                            <td>17 Sep 2023</td>
                                                                            <th>200000</th>
                                                                            <td>17 Mar 2023</td>
                                                                        </tr>

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



                            <!-- Right bar overlay-->
                            <div class="rightbar-overlay"></div>

                            <!-- JAVASCRIPT -->
                            <script src="assets/libs/jquery/jquery.min.js"></script>
                            <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
                            <script src="assets/libs/metismenu/metisMenu.min.js"></script>
                            <script src="assets/libs/simplebar/simplebar.min.js"></script>
                            <script src="assets/libs/node-waves/waves.min.js"></script>
                            <script src="assets/libs/select2/js/select2.min.js"></script>

                            <!-- apexcharts -->

                            <!-- jquery.vectormap map -->
                            <script src="assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js"></script>
                            <script src="assets/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-us-merc-en.js"></script>

                            <!-- App js -->
                            <script src="assets/js/app.js"></script>
                            <script src="assets/libs/admin-resources/bootstrap-filestyle/bootstrap-filestyle.min.js"></script>

                            <!-- Required datatable js -->
                            <script src="assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
                            <script src="assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
                            <!-- Datatable init js -->
                            <script src="assets/js/pages/datatables.init.js"></script>
                            <script type="text/javascript">
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

                                $(document).on('click', '.SaveOrg', function(){

                                  var Org=document.getElementById("neworg").value;
                                  if (Org) {
                                      $.ajax({
                                        url:"insert.php",
                                        method:"POST",
                                        data:{'NewOrg':Org},
                                        success:function(result){
                                            if(result==1){
                                                Swal.fire({
                                                    title: 'success',
                                                    text: 'Organization Created',
                                                    icon: 'success',
                                                });
                                                $('#NewOrg').modal("hide");
                                                $('#FAddOrg').trigger("reset");
                                            }else{
                                                err(result);
                                            }
                                        }
                                    });
                                  }
                              });


                                $(document).on('click', '.SaveDiv', function(){

                                  var OrgCode=document.getElementById("OrgCodeNDiv").value;
                                  var Division=document.getElementById("newdiv").value;
                                  if (OrgCode && Division) {
                                      $.ajax({
                                        url:"insert.php",
                                        method:"POST",
                                        data:{'NewDiv':Division, 'OrgCodeNDiv':OrgCode},
                                        success:function(result){
                                            if(result==1){
                                                Swal.fire({
                                                    title: 'success',
                                                    text: 'Organization Created',
                                                    icon: 'success',
                                                });
                                                $('#NewDivision').modal("hide");
                                                $('#FAddDiv').trigger("reset");
                                            }else{
                                                err(result);
                                            }
                                        }
                                    });
                                  }else{
                                    err("Please enter all fields");
                                }
                            });

                                $(document).on('change', '#OrgCode', function(){

                                    var OrgCode=$(this).val();
                                    if(OrgCode){
                                        $.ajax({
                                          type:'POST',
                                          url:'select.php',
                                          data:{'OrgCode':OrgCode},
                                          success:function(result){
                                            $('#DivisionCode').html(result);

                                        }
                                    }); 
                                    }else{
                                        $('#DivisionCode').html('<option value="">Division</option>');
                                    }
                                });

                                $(document).on('change', '#OrgCodeSite', function(){

                                    var OrgCode=$(this).val();
                                    if(OrgCode){
                                        $.ajax({
                                          type:'POST',
                                          url:'select.php',
                                          data:{'OrgCode':OrgCode},
                                          success:function(result){
                                            $('#DivisionCodeSite').html(result);

                                        }
                                    }); 
                                    }else{
                                        $('#DivisionCodeSite').html('<option value="">Division</option>');
                                    }
                                });

                                $(document).on('click', '.SaveOrder', function(){

                                    var file_data = $('#LOAFile').prop('files')[0];   
                                    var form_data = new FormData();                  
                                    form_data.append('file', file_data);

                                    var filename = file_data.name;
                                    var extension = filename.split('.').pop().toLowerCase();

                                    if(jQuery.inArray(extension,['pdf','']) == -1){
                                      alert("Invalid LOA file");
                                  }else{


                                      var DivisionCode=document.getElementById("DivisionCode").value;
                                      var LOADate=document.getElementById("LOADate").value;
                                      var Completion=document.getElementById("Completion").value;
                                      var BGAmount=document.getElementById("BGAmount").value;
                                      var BGDate=document.getElementById("BGDate").value;
                                      var Warranty=document.getElementById("Warranty").value;
                                      var OderingAuth=document.getElementById("OderingAuth").value;
                                      var BillingAuth=document.getElementById("BillingAuth").value;
                                      var LOANumber=document.getElementById("LOANumber").value;
                                      var Description=document.getElementById("Description").value;

                                      if (DivisionCode && LOADate && Completion && BGAmount && BGDate && Warranty && OderingAuth && BillingAuth && Description && file_data) {
                                          $.ajax({
                                            url:"insert.php",
                                            method:"POST",
                                            data:{'DivisionCodeO':DivisionCode, 'LOADate':LOADate, 'Completion':Completion, 'BGAmount':BGAmount, 'BGDate':BGDate, 'Warranty':Warranty, 'OderingAuth':OderingAuth, 'BillingAuth':BillingAuth, 'LOANumber':LOANumber, 'Description':Description},
                                            success:function(result){
                                                if(result==1){

                                                    $.ajax({
                                                        url: 'upload.php',
                                                        dataType: 'text',
                                                        cache: false,
                                                        contentType: false,
                                                        processData: false,
                                                        data: form_data,                         
                                                        type: 'post',
                                                        success: function(result){

                                                        }
                                                    });


                                                    Swal.fire({
                                                        title: 'success',
                                                        text: 'Order Registered',
                                                        icon: 'success',
                                                    });
                //$('#NewOrder').modal("hide");
                //$('#FAddOrder').trigger("reset");
            }else{
                err(result);
            }
        }
    });
                                      }
                                  }
                              });

                          </script>
                      </body>

                      </html>