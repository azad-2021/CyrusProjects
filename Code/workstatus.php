<?php 
include"connection.php";
include"session.php";
include"query.php";
$_SESSION["NewOrderID"]=0;
?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>Work Status</title>
    <?php include"head.php" ?>

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
                            <h4 class="mb-0">Work Status</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->


                <div class="row">
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="" class="table table-hover table-centered table-bordered border-primary display" style="width:100%">
                                        <thead class="thead-light">
                                            <tr>
                                                <th style="min-width:70px;">Organization</th>
                                                <th style="min-width:100px;">Division</th>
                                                <th style="min-width:100px;">Site</th>
                                                <th style="min-width:50px;">Order ID</th>
                                                <th style="min-width:50px;">Work ID</th>
                                                <th style="min-width:150px;">Work</th>
                                                <th style="min-width:40px;">Start Date</th>
                                                <th style="min-width:40px;">End Date</th>
                                                <th style="min-width:150px;">Completed Quantity / Total Quantity</th>
                                                <th style="min-width:60px;">Assign To</th>
                                                <th style="min-width:60px;">Assign Date</th>
                                                <th style="min-width:60px;">Left Days</th>
                                            </tr>
                                        </thead>

                                        <tbody>

                                            <?php 
                                            $query="SELECT * FROM vpendingwork";
                                            $result=mysqli_query($con,$query);
                                            if (mysqli_num_rows($result)>0)
                                            {

                                                while ($row=mysqli_fetch_assoc($result))
                                                {

                                                 print'<tr>'; 
                                                 print '<td>'.$row["Organization"]."</td>";
                                                 print '<td>'.$row["DivisionName"]."</td>";
                                                 print '<td>'.$row["SiteName"]."</td>";
                                                 print '<td>'.$row["OrderID"]."</td>";
                                                 print '<td>'.$row["WorkID"]."</td>";
                                                 print '<td>'.$row["Work"]."</td>";
                                                 print '<td><span class="d-none">'.$row["StartDate"].'</span>'.date('d-M-Y',strtotime($row["StartDate"]))."</td>";
                                                 print '<td><span class="d-none">'.$row["EndDate"].'</span>'.date('d-M-Y',strtotime($row["EndDate"]))."</td>";
                                                 print '<td>'.'0 Meter / '.$row["Qty"].' '.$row["Unit"]."</td>";
                                                 print '<td>'.$row["EmployeeName"]."</td>";
                                                 print '<td><span class="d-none">'.$row["AssignDate"].'</span>'.date('d-M-Y',strtotime($row["AssignDate"]))."</td>";
                                                 print '<td>'.$row["LeftDays"]."</td>";
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

     <?php include "footer.php"; ?>

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


    </script>
</body>

</html>