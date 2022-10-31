<?php 
include"connection.php";
include"session.php";
include"query.php";

$UserID=1;
date_default_timezone_set('Asia/Calcutta');
$timestamp =date('y-m-d H:i:s');
$Date = date('Y-m-d',strtotime($timestamp));


?>

<!doctype html>
    <html lang="en">

    <head>

        <meta charset="utf-8" />
        <title>Finalizing Vendor</title>
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
                                    <h4 class="mb-0">Finalizing Vendor</h4>

                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Cyrus</a></li>
                                            <li class="breadcrumb-item active">Finalizing Vendor</li>
                                        </ol>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <form class="form-control rounded-corner" action = "" method = "POST" enctype = "multipart/form-data">

                            <div class="row" style="margin-bottom: 30px;">
                                <div class="col-lg-3">
                                    <label for="recipient-name" class="col-form-label">Select Organization</label>

                                    <select class="form-control rounded-corner" id="OrgCodeFV" required>
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
                                    <select class="form-select form-control rounded-corner" id="DivisionCodeFV">
                                        <option value="" required>Select</option>

                                    </select>
                                </div>
                                <div class="col-lg-3">
                                    <label for="recipient-name" class="col-form-label">Select Order ID</label>
                                    <select class="form-select form-control rounded-corner" name="OrderIDFV" id="OrderIDFV" required>
                                        <option value="">Select</option>

                                    </select>
                                </div>
                                <div class="col-lg-3">
                                    <label for="recipient-name" class="col-form-label">Select Material</label>
                                    <select class="form-select form-control rounded-corner" name="MaterialFV" id="MaterialFV" required>
                                        <option value="">Select</option>
                                    </select>
                                </div>


                            </div>


                            <div class="table-responsive">
                                <table class="table table-centered table-hover table-bordered border-primary  displayFV" style="margin-top: 30px;" width="100%">
                                    <thead>

                                        <th style="min-width: 200px">Vendor Name</th>
                                        <th style="min-width: 200px">Item Name</th>
                                        <th style="min-width: 150px">Modal No</th>
                                        <th style="min-width: 100px">Offer Quantity</th>
                                        <th style="min-width: 80px">Offer Rate</th>
                                        <th style="min-width: 80px">GST %</th>
                                        <th style="min-width: 200px">Payment Terms</th>
                                        <th style="min-width: 200px">Warranty Terms</th>
                                        <th style="min-width: 200px">Delivery Terms</th>
                                        <th style="min-width: 100px">Offer Date</th>
                                        <th style="min-width: 100px">Offer Document</th>
                                        <th style="min-width: 60px">Select</th>
                                    </thead>
                                    <tbody id="MaterialDataFV">

                                    </tbody>
                                </table>
                            </div>


                            <center>
                                <button type="button" class="btn btn-lg btn-primary Finalized" id="Finalized" style="margin-top: 20px; margin-bottom: 20px;">Finalized</button>
                            </center> 

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

//
$(document).ready(function () {
    $('table.displayFV').DataTable({

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




$(document).on('change', '#OrgCodeFV', function(){

    var OrgCode=$(this).val();
    if(OrgCode){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'OrgCode':OrgCode},
          success:function(result){
            $('#DivisionCodeFV').html(result);

        }
    }); 
    }else{
        $('#DivisionCodeFV').html('<option value="">Division</option>');
    }
});


$(document).on('change', '#DivisionCodeFV', function(){

    var DivisionCode=$(this).val();
    if(DivisionCode){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'DivisionCodeFV':DivisionCode},
          success:function(result){
                    //alert(result);
                    $('#OrderIDFV').html(result);

                }
            }); 
    }else{
        $('#OrderIDFV').html('<option value="">Order ID</option>');
    }
});


$(document).on('change', '#OrderIDFV', function(){

    var OrderID=$(this).val();
    if(OrderID){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'OrderIDFV':OrderID},
          success:function(result){

            $('#MaterialFV').html(result);

        }
    });

        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'VendorFV':OrderID},
          success:function(result){
            $('.displayFV').DataTable().clear();
            $('.displayFV').DataTable().destroy();
            $('#MaterialDataFV').html(result);

            $('table.displayFV').DataTable( {

               scrollY: '200px',
               scrollCollapse: true,
               paging: false,
               scrollX: true,

           } );

        }
    });

    }
});



$(document).on('change', '#MaterialFV', function(){

    var MaterialID=$(this).val();
    if(MaterialID){

        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'MaterialIDFV':MaterialID},
          success:function(result){
            $('.displayFV').DataTable().clear();
            $('.displayFV').DataTable().destroy();
            $('#MaterialDataFV').html(result);

            $('table.displayFV').DataTable();

        }
    });

    }
});


$('.Finalized').on('click', function() {
    var OfferID = [];

    $("input:checkbox[name=select]:checked").each(function() {
        OfferID.push($(this).val());
    });

    if (OfferID.length==0) {
      err("No Item Selected");
  }else{
      var element = document.getElementById("Finalized");
      //element.classList.add("d-none");

      $.ajax({
        type:'POST',
        url:'insert.php',
        data:{'FinalizedID':OfferID},
        success:function(result){

          var delayInMilliseconds = 2000; 
          //alert(result);
          if (result==1) {
              setTimeout(function() {
                location.reload();
            }, delayInMilliseconds);

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