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
    <?php include"head.php" ?>

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
        <?php include "footer.php"; ?>
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