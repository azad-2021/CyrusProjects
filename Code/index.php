<?php 
include"connection.php";
include"session.php";
include"query.php";

?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>Home</title>
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
                <!--
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
                                    </div>

                                </div>
                            </div>

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

                                    </div>

                                </div>
                            </div>

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

                                    </div>


                                </div>
                            </div> 
                        </div> end row -->
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
                                                    <th>Left Days</th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <?php 
                                                $query="SELECT Organization, DivisionName, OrderID, LOADate, CompletionDate, datediff(CompletionDate, current_date()) as LeftDays  FROM cyrusproject.orders join division on orders.DivisionCode=division.DivisionCode
                                                join organization on division.OrganizationCode=organization.OrganizationCode
                                                WHERE datediff(CompletionDate, current_date())<30;";
                                                $result=mysqli_query($con,$query);
                                                if (mysqli_num_rows($result)>0)
                                                {

                                                    while ($row=mysqli_fetch_assoc($result))
                                                    {
                                                        if($row["LeftDays"]<0){

                                                            $tr='<tr class="badge-soft-danger">';
                                                        }else{
                                                            $tr='<tr class="badge-soft-warning">';
                                                        }
                                                        print($tr);
                                                        
                                                        
                                                        print '<td>'.$row["Organization"]."</td>";
                                                        print '<td>'.$row["DivisionName"]."</td>";
                                                        print '<td>'.$row["OrderID"]."</td>";
                                                        print '<td><span class="d-none">'.$row["LOADate"].'</span>'.date('d-M-Y',strtotime($row["LOADate"]))."</td>";
                                                        print '<td><span class="d-none">'.$row["CompletionDate"].'</span>'.date('d-M-Y',strtotime($row["CompletionDate"]))."</td>";
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
                                                    <th>Left Days</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <?php 
                                                $query="SELECT Organization, DivisionName, OrderID, LOADate, CompletionDate, BGAmount, BGDate, datediff(BGDate, current_date()) as LeftDays  FROM cyrusproject.orders join division on orders.DivisionCode=division.DivisionCode join organization on division.OrganizationCode=organization.OrganizationCode WHERE datediff(BGDate, current_date())<30;";
                                                $result=mysqli_query($con,$query);
                                                if (mysqli_num_rows($result)>0)
                                                {

                                                    while ($row=mysqli_fetch_assoc($result))
                                                    {
                                                        if($row["LeftDays"]<0){

                                                            $tr='<tr class="badge-soft-danger">';
                                                        }else{
                                                            $tr='<tr class="badge-soft-warning">';
                                                        }
                                                        print($tr);
                                                        
                                                        
                                                        print '<td>'.$row["Organization"]."</td>";
                                                        print '<td>'.$row["DivisionName"]."</td>";
                                                        print '<td>'.$row["OrderID"]."</td>";
                                                        print '<td><span class="d-none">'.$row["LOADate"].'</span>'.date('d-M-Y',strtotime($row["LOADate"]))."</td>";
                                                        print '<td><span class="d-none">'.$row["CompletionDate"].'</span>'.date('d-M-Y',strtotime($row["CompletionDate"]))."</td>";
                                                        print '<td>'.$row["BGAmount"]."</td>";
                                                        print '<td><span class="d-none">'.$row["BGDate"].'</span>'.date('d-M-Y',strtotime($row["BGDate"]))."</td>";
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

                            <!--<div class="col-xl-12">
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
                                    </div> 
                                </div>
                            </div> end col -->
                        </div><!-- end col -->
                    </div><!-- end row -->
                </div>
                <!-- End Page-content -->


                <!-- Right bar overlay-->


                <?php include "footer.php"; ?>
                <script type="text/javascript">

                    $(document).ready(function () {
                        $('table.sitedisplay').DataTable();
                    });

                    $(document).ready(function () {
                        $('table.display').DataTable();
                    });


                </script>
            </body>

            </html>