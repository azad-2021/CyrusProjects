<?php 
include"connection.php";
include"session.php";
include"query.php";

$SiteCode=base64_decode($_GET['SiteCode']);

$query="SELECT * FROM cyrusproject.siteorders
inner join division on siteorders.DivisionCode=division.DivisionCode
inner join orders on siteorders.DivisionOrderID=orders.OrderID
inner join site on siteorders.SiteCode=site.SiteCode
inner join organization on division.OrganizationCode=organization.OrganizationCode WHERE siteorders.SiteCode=$SiteCode;";
$result=mysqli_query($con,$query);
if (mysqli_num_rows($result)>0)
{
    $row=mysqli_fetch_assoc($result);
    $OrderID=$row["OrderID"];
}


?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>Enter Site Survey Details</title>
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
                            <h4 class="mb-0">Enter site survey of details of <?php echo $row["Organization"].', '.$row["DivisionName"].', '.$row["SiteName"] ?> </h4>
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
                                <form class="form-control rounded-corner" style="margin-bottom: 50px;" id="SurveyF">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <label for="recipient-name" class="col-form-label">Select Organization</label>

                                            <select class="form-control rounded-corner" id="OrgCodeSurvey">
                                                <option value="<?php echo $row['OrganizationCode']; ?>"><?php echo $row['Organization']; ?></option>
                                            </select>
                                        </div>
                                        <div class="col-lg-3">
                                            <label for="recipient-name" class="col-form-label">Select Division</label>
                                            <select class="form-select form-control rounded-corner" id="DivisionCodeSurvey">
                                                <option value="<?php echo $row['DivisionCode']; ?>"><?php echo $row['DivisionName']; ?></option>

                                            </select>
                                        </div>
                                        <div class="col-lg-3">
                                            <label for="recipient-name" class="col-form-label">Select Site</label>
                                            <select class="form-select form-control rounded-corner" id="SiteCodeSurvey">
                                                <option value="<?php echo $row['SiteCode']; ?>"><?php echo $row['SiteName']; ?></option>

                                            </select>
                                        </div>

                                        <div class="col-lg-3">
                                            <label for="recipient-name" class="col-form-label">Select Order ID</label>
                                            <select class="form-select form-control rounded-corner" id="OrderIDSurvey">
                                                <option value="<?php echo $row['OrderID']; ?>"><?php echo $row['OrderID']; ?></option>

                                            </select>
                                        </div>

                                        <div class="col-lg-4">
                                            <label for="recipient-name" class="col-form-label">Select Material</label>
                                            <select class="form-select form-control rounded-corner2" id="MaterialSurvey">
                                                <option value="">Select</option>
                                                <?php

                                                $query="SELECT MaterialName, MaterialID FROM demand_details WHERE OrderID=$OrderID Order by MaterialName;";
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

                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <label for="recipient-name" class="col-form-label">Quantity</label>
                                        <input type="number" class="form-control rounded-corner" name="Qty" id="QtySurvey" min=1 onkeydown="limit(this);" onkeyup="limit(this);">
                                    </div>
                                    <div class="col-lg-2">
                                        <label for="recipient-name" class="col-form-label">Left Quantity</label>
                                        <input type="text" class="form-control rounded-corner" name="Unit" id="LeftQtySurve" disabled>
                                    </div>          
                                    <div class="col-lg-2">
                                        <label for="recipient-name" class="col-form-label">Unit</label>
                                        <input type="text" class="form-control rounded-corner" name="Unit" id="UnitSiteSurvey" disabled>
                                    </div>

                                    <div class="col-lg-2" style="margin-top: 35px;">
                                        <button type="button" class="bt btn-lg btn-primary AddSiteSurvey">Add</button>
                                    </div>

                                </div>
                            </form>  

                            <div class="table-responsive">
                                <table class="table table-centered table-hover table-bordered border-primary Surveydisplay" style="margin-top:45px" width="100%">
                                    <thead>
                                        <th width="65%">Material Name</th>
                                        <th width="5%">Quantity</th>
                                        <th width="5%">Action</th>
                                    </thead>
                                    <tbody id="Surveydata">

                                    </tbody>
                                </table>
                            </div>
                            <center>
                            <button type="button" class="btn btn-primary SaveSurveyData" data-bs-dismiss="modal">Save</button>
                        </center>
                        </div><!-- end card-body -->
                    </div><!-- end card -->
                </div><!-- end col -->
            </div><!-- end row -->
        </div>
        <!-- End Page-content -->


        <!-- Right bar overlay-->


        <?php include "footer.php"; ?>
        <script type="text/javascript">


        </script>
    </body>

    </html>