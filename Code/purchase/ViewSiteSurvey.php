<?php 
include"connection.php";
include"session.php";
include"query.php";

?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>Site Survey Details</title>
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
                            <h4 class="mb-0">Enter site survey of detail</h4>
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
                                        <div class="col-lg-4">
                                            <label for="recipient-name" class="col-form-label">Select Organization</label>

                                            <select class="form-control rounded-corner" id="OrgCodeSurvey">
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
                                            <select class="form-select form-control rounded-corner" id="DivisionCodeSurvey">
                                                <option value="">Select</option>

                                            </select>
                                        </div>
                                        <div class="col-lg-4">
                                            <label for="recipient-name" class="col-form-label">Select Site</label>
                                            <select class="form-select form-control rounded-corner" id="SiteCodeSurveyD">
                                                <option value="">Select</option>

                                            </select>
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