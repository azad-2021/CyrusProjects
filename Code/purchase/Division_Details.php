<?php 
include"connection.php";
include"session.php";
include"query.php";

?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>Division Detail</title>
    <?php include"head.php" ?>
    <style type="text/css">
      #MaterialAV option {
          word-wrap: break-word;
      }
  </style>
</head>
<body data-sidebar="dark" data-topbar="dark">

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
                            <h4 class="mb-0">Division Detail</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->
                
            </div><!-- end col -->

            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <form class="form-control rounded-corner" style="margin-bottom: 50px;">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <label for="recipient-name" class="col-form-label">Select Organization</label>

                                            <select class="form-control rounded-corner" id="OrgCode">
                                                <option value="">Select</option>
                                                <?php

                                                $query="SELECT Organization, OrganizationCode FROM organization Order by Organization;";
                                                $result=mysqli_query($con,$query);
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
                                        <div class="col-lg-4">
                                            <label for="recipient-name" class="col-form-label">Select Division</label>
                                            <select class="form-select form-control rounded-corner" id="DivisionCode">
                                                <option value="">Select</option>

                                            </select>
                                        </div>
                                        <div class="col-lg-4">
                                            <label for="recipient-name" class="col-form-label">Select Site</label>
                                            <select class="form-select form-control rounded-corner" id="SiteCode">
                                                <option value="">Select</option>

                                            </select>
                                        </div>

                                        <div class="col-lg-4">
                                            <label for="recipient-name" class="col-form-label">Site Address</label>
                                            <textarea class="form-control rounded-corner" id="AddressSite" disabled></textarea>
                                        </div>

                                        <div class="col-lg-4">
                                            <label for="recipient-name" class="col-form-label">Site District</label>
                                            <input type="text" name="" id="DistrictSiteD" class="form-control rounded-corner" disabled>
                                        </div>

                                        <div class="col-lg-4">
                                            <label for="recipient-name" class="col-form-label">Consignee</label>
                                            <input type="text" name="" id="ConsigneeSite" class="form-control rounded-corner" disabled>
                                        </div>
                                    </div>
                                </form>  


                                <center><h4 class="mb-0">Zone/Division Order Detail</h4></center>
                                <div class="table-responsive">

                                    <table class="table table-centered table-hover table-bordered border-primary displayDetails" style="margin-top:20px" width="100%">
                                        <thead>
                                            <th style="min-width:90px;">Order ID</th>
                                            <th style="min-width:350px;">Description</th>
                                            <th style="min-width:150px;">Order No.</th>
                                            <th style="min-width:90px;">Order Date</th>
                                            <th style="min-width:90px;">Completion Date</th>
                                            <th>PG Amount</th>
                                            <th>PG Type</th>
                                            <th style="min-width:90px;">PG Date</th>
                                            <th style="min-width:90px;">PG Valid Till Date</th>
                                            <th>Odering Authority</th>
                                            <th>Billing Authority</th>
                                            <th>AMC</th>
                                            <th>Order Status</th>
                                        </thead>
                                        <tbody id="OrderDetail">

                                        </tbody>
                                    </table>
                                </div>
                            </div><!-- end card-body -->
                        </div><!-- end card -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div>
            <!-- End Page-content -->


            <!-- Right bar overlay-->


            <?php include "footer.php"; ?>
            <script type="text/javascript">

                $(document).on('change', '#SiteCode', function(){

                    var SiteCode=$(this).val();
                    if(SiteCode){
                        $.ajax({
                          type:'POST',
                          url:'select.php',
                          data:{'GetSiteAddress':SiteCode},
                          success:function(result){
                            $('#AddressSite').html(result);

                        }
                    }); 

                        $.ajax({
                          type:'POST',
                          url:'select.php',
                          data:{'GetSiteDistrict':SiteCode},
                          success:function(result){

                            $('#DistrictSiteD').val(result);

                        }
                    });

                        $.ajax({
                          type:'POST',
                          url:'select.php',
                          data:{'GetSiteConsignee':SiteCode},
                          success:function(result){

                            $('#ConsigneeSite').val(result);

                        }
                    });

                    }
                });

            </script>
        </body>

        </html>