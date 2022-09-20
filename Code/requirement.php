<?php 
include"connection.php";
include"query.php";
?>

<!doctype html>
    <html lang="en">

    <head>

        <meta charset="utf-8" />
        <title>Material Requirement</title>
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
        <link href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />

        <link href="assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css">
        <link href="assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
        <link href="assets/libs/spectrum-colorpicker2/spectrum.min.css" rel="stylesheet" type="text/css">
        <link href="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet">
        <style type="text/css">



        </style>

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
                                    <h4 class="mb-0">Material Requirement</h4>

                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Cyrus</a></li>
                                            <li class="breadcrumb-item active">Material Requirement</li>
                                        </ol>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <form class="form-control rounded-corner">
                            <h4 align="center">Select Details</h4>
                            <div class="row">
                                <div class="col-lg-3">
                                    <label for="recipient-name" class="col-form-label">Select Organization</label>

                                    <select class="form-control rounded-corner" id="OrgCodeRequirement">
                                        <option value="">Select</option>
                                        <?php

                                        $result=mysqli_query($con,$QueryOrg);
                                        if (mysqli_num_rows($result)>0)
                                        {
                                          while ($arr=mysqli_fetch_assoc($result))
                                          {
                                            ?>
                                            <option value="<?php echo $arr['OrganizationCode']; ?>"><?php echo $arr['Organization']; ?></option>
                                            <?php
                                        }}?>
                                    </select>
                                </div>
                                <div class="col-lg-3">
                                    <label for="recipient-name" class="col-form-label">Select Division</label>
                                    <select class="form-select form-control rounded-corner" id="DivisionCodeRequirement">
                                        <option value="">Select</option>

                                    </select>
                                </div>
                                <div class="col-lg-3">
                                    <label for="recipient-name" class="col-form-label">Select Order ID</label>
                                    <select class="form-select form-control rounded-corner" id="OrderIDRequirement">
                                        <option value="">Select</option>

                                    </select>
                                </div>
                                <div class="col-lg-3">
                                    <label for="recipient-name" class="col-form-label">Type</label>
                                    <select class="form-select form-control rounded-corner" id="Type">
                                        <option value="">Select</option>
                                        <option value="Regular">Regular</option>
                                        <option value="Variation">Variation</option>
                                    </select>
                                </div>

                                <center>
                                    <div class="col-lg-4 d-none" id="TypeDiv">
                                        <label for="recipient-name" class="col-form-label">Upload Variation Document </label>
                                        <i class="ri-file-upload-fill"></i>
                                        <input type="file" class="form-control rounded-corner" name="VrDocument" id="VrDocument">
                                    </div>
                                </center>


                                <div class="col-lg-12" style="margin-top:20px;">
                                    <textarea class="form-control rounded-corner" id="OrderDesc" disabled placeholder="Order Discription"></textarea>
                                </div>

                            </div>

                        </form>


                        <form class="form-control rounded-corner" style="margin-top: 20px;">
                            <h4 align="center">Enter Material Details</h4>
                            <div class="row">
                                <div class="col-lg-3">
                                    <label for="recipient-name" class="col-form-label">Sr No (Schedule for Railways)</label>
                                    <input type="text" class="form-control rounded-corner" name="ScheduleName" id="Schedule">
                                </div>
                                <div class="col-lg-7">
                                    <label for="recipient-name" class="col-form-label">Material Name</label>
                                    <input type="text" class="form-control rounded-corner" name="MaterialName" id="MaterialName">
                                </div>
                                <div class="col-lg-2">
                                    <label for="recipient-name" class="col-form-label">Quantity</label>
                                    <input type="number" class="form-control rounded-corner" name="Qty" id="Qty">
                                </div>
                                <div class="col-lg-4">
                                    <label for="recipient-name" class="col-form-label">Unit</label>
                                    <select class="form-control rounded-corner" id="Unit">
                                        <option value="">Select</option>
                                        <?php

                                        $result=mysqli_query($con,$QueryUnit);
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
                                <div class="col-lg-4">
                                    <label for="recipient-name" class="col-form-label">Rate</label>
                                    <input type="number" class="form-control rounded-corner" name="Rate" id="Rate">
                                </div>
                                <div class="col-lg-4">
                                    <label for="recipient-name" class="col-form-label">Inspection Authority</label>
                                    <input type="text" class="form-control rounded-corner" name="IAuth" id="IAuth">
                                </div>
                            </div>
                            
                            <center>
                                <input class="form-check-input" type="checkbox" id="Labour" style="margin-top: 25px;">
                                <label class="form-check-label" for="formCheck1" style="margin-top: 20px;">
                                    Labour Work
                                </label>
                            </center>
                            
                            <center>
                                <button type="button" class="btn btn-primary AddMaterial" style="margin-top: 10px;">Add</button>
                            </center>

                            <div class=" ">
                                <table class="table table-centered table-hover table-bordered border-primary  display" style="margin-top: 10px;">
                                    <thead>
                                        <th style="min-width: 100px">Sr. No</th>
                                        <th style="min-width: 400px;">Material Name</th>
                                        <th style="min-width: 100px">Quantity</th>
                                        <th style="min-width: 100px">Rate</th>
                                        <th style="min-width: 150px">Amount</th>
                                        <th style="min-width: 150px">Inspecting Authority</th>
                                        <th style="min-width: 150px">Labour Work</th>
                                        <th style="min-width: 100px">Action</th>
                                    </thead>
                                    <tbody id="MaterialData">

                                    </tbody>
                                </table>
                            </div>


                        </form>

                    </div><!-- end col -->

                </div><!-- end col -->

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
    <script src="assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript">


        $(document).ready(function () {
            $('table.display').DataTable({

                scrollY: '200px',
                scrollCollapse: true,
                paging: false,
                scrollX: true,
            });

        });



        function err(msg){
            Swal.fire({
                title: 'error!',
                text: msg,
                icon: 'error',

            })
        }




        $(document).on('change', '#OrgCodeRequirement', function(){

            var OrgCode=$(this).val();
            if(OrgCode){
                $.ajax({
                  type:'POST',
                  url:'select.php',
                  data:{'OrgCode':OrgCode},
                  success:function(result){
                    $('#DivisionCodeRequirement').html(result);

                }
            }); 
            }else{
                $('#DivisionCodeRequirement').html('<option value="">Division</option>');
            }
        });


        $(document).on('change', '#DivisionCodeRequirement', function(){

            var DivisionCode=$(this).val();
            if(DivisionCode){
                $.ajax({
                  type:'POST',
                  url:'select.php',
                  data:{'DivisionCodeRequirement':DivisionCode},
                  success:function(result){
                    //alert(result);
                    $('#OrderIDRequirement').html(result);

                }
            }); 
            }else{
                $('#OrderIDRequirement').html('<option value="">Order ID</option>');
            }
        });


        $(document).on('change', '#OrderIDRequirement', function(){

            var OrderID=$(this).val();
            if(OrderID){
                $.ajax({
                  type:'POST',
                  url:'select.php',
                  data:{'OrderIDRequirement':OrderID},
                  success:function(result){
                    //alert(result);
                    document.getElementById("OrderDesc").value=result;
                    //$('#OrderIDRequirement').html(result);

                }
            }); 
            }
        });

        $(document).on('click', '.AddMaterial', function(){

            var VarErr=0;
            var Type=document.getElementById("Type").value;

            if (Type=='Variation') {
               var file_data = $('#VrDocument').prop('files')[0];   
               var form_data = new FormData();                  
               form_data.append('file', file_data);

               if(file_data){

                var filename = file_data.name;
                var extension = filename.split('.').pop().toLowerCase();
                if (jQuery.inArray(extension,['pdf','']) == -1) {

                    err("Invalid file format");
                    VarErr=1;
                }

            }else{
                err("Please select document file");
                VarErr=1;
            }
        }



        var OrderID=document.getElementById("OrderIDRequirement").value;
        var Schedule=document.getElementById("Schedule").value;
        var MaterialName=document.getElementById("MaterialName").value;
        var Qty=document.getElementById("Qty").value;
        var Unit=document.getElementById("Unit").value;
        var IAuth=document.getElementById("IAuth").value;
        var Rate=document.getElementById("Rate").value;
        

        if ($('#Labour').is(':checked')) {
            Labour=1;
        }else{
            Labour=0;
        }


        if(OrderID && Schedule && MaterialName && Qty && Unit && IAuth && Rate && Labour && VarErr==0){

            $.ajax({
              type:'POST',
              url:'insert.php',
              data:{'OrderIDRequirement':OrderID, 'Schedule':Schedule, 'MaterialName':MaterialName, 'RequirementQty':Qty, 'UnitRequirement':Unit, 'IAuth':IAuth, 'RequirementRate':Rate, 'Labour':Labour},
              success:function(result){


                if (result==1) {
                    $('.display').DataTable().clear();
                    $('.display').DataTable().destroy();

                    $.ajax({
                      type:'POST',
                      url:'select.php',
                      data:{'RTemp':OrderID},
                      success:function(result){

                        $('#MaterialData').html(result);

                        $('table.display').DataTable( {

                           scrollY: '200px',
                           scrollCollapse: true,
                           paging: false,
                           scrollX: true,

                       } );


                    }
                });



                }else{
                    err(result);
                }

            }
        }); 
        }else if (VarErr==0) {
            err("Please enter all fields");
        }

    });

        $(document).on('change', '#Type', function(){

            var DcType=$(this).val();
            if(DcType=='Variation'){
             $("#TypeDiv").removeClass("d-none");
         }else{
            $('#TypeDiv').addClass("d-none");
        }
    });


</script>
</body>

</html>