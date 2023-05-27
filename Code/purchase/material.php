<?php 
include"connection.php";
include"session.php";
include"query.php";

$OrderID=base64_decode($_GET['OrderID']);

?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>Material Detail</title>
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
                            <h4 class="mb-0">Material Detail</h4>
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

                                <table class="table table-centered table-hover table-bordered border-primary displayDetailsM" style="margin-top:20px" width="100%">
                                    <thead>
                                        <th style="min-width:90px;">Sr. No./Schedule</th>
                                        <th style="min-width:350px;">Material Name</th>
                                        <th style="min-width:90px;">Quantity</th>
                                        <th style="min-width:90px;">Rate</th>
                                        <th style="min-width:100px;">Inspectiong Authority</th>
                                        <th style="min-width:90px;">Material Type</th>
                                        <th style="min-width:110px;">Demand Date</th>
                                    </thead>
                                    <tbody>
                                        <?php 
                                        $query="SELECT * FROM cyrusproject.demand_details inner join billingtype on demand_details.BillingType=billingtype.ID WHERE demand_details.BillingType<=3 and OrderID=$OrderID";
                                        $result=mysqli_query($con,$query);
                                        if (mysqli_num_rows($result)>0)
                                        {

                                            while ($row=mysqli_fetch_assoc($result))
                                            {

                                                print '<tr>';
                                                print '<td>'.$row["SrNo"]."</td>";
                                                print '<td>'.$row["MaterialName"]."</td>";
                                                print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
                                                print '<td>'.$row["Rate"]."</td>";
                                                print '<td>'.$row["InspectingAuth"]."</td>";
                                                print '<td>'.$row["Type"]."</td>";

                                                print '<td><span class="d-none">'.$row["DemandDate"].'</span>'.date('d-M-Y',strtotime($row["DemandDate"]))."</td>";
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


        <!-- Right bar overlay-->


        <?php include "footer.php"; ?>
        <script type="text/javascript">

           $(document).ready(function () {
            $('table.displayDetailsM').DataTable();
        });

    </script>
</body>

</html>