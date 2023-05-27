<?php 
include"connection.php";
include"session.php";
include"query.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>Order Status</title>
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
                            <h4 class="mb-0">Order Status</h4>
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
                                                <th style="min-width:50px;">Order ID</th>
                                                <th style="min-width:200px;">Order Date</th>
                                                <th style="min-width:40px;">Completion Date</th>
                                                <th style="min-width:60px;">Status</th>
                                            </tr>
                                        </thead>

                                        <tbody>

                                            <?php 
                                            $query="SELECT Organization, DivisionName, OrderID, OrderDate, CompletionDate, Status FROM cyrusproject.orders
                                            inner join division on orders.DivisionCode=division.DivisionCode
                                            inner join organization on division.OrganizationCode=organization.OrganizationCode
                                            inner join orderstatus on orders.OrderStatusID=orderstatus.StatusID;";
                                            $result=mysqli_query($con,$query);
                                            if (mysqli_num_rows($result)>0)
                                            {

                                                while ($row=mysqli_fetch_assoc($result))
                                                {

                                                 print'<tr>'; 
                                                 print '<td>'.$row["Organization"]."</td>";
                                                 print '<td>'.$row["DivisionName"]."</td>";
                                                 print '<td>'.$row["OrderID"]."</td>";
                                                 print '<td><span class="d-none">'.$row["OrderDate"].'</span>'.date('d-M-Y',strtotime($row["OrderDate"]))."</td>";
                                                 print '<td><span class="d-none">'.$row["CompletionDate"].'</span>'.date('d-M-Y',strtotime($row["CompletionDate"]))."</td>";

                                                 print '<td>'.$row["Status"]."</td>";

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