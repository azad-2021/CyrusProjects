<?php 
include"connection.php";
include"session.php";
include"query.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>Material Status</title>
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
                            <h4 class="mb-0">Material Status</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Cyrus</a></li>
                                    <li class="breadcrumb-item active">Material Status</li>
                                </ol>
                            </div>

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
                                                <th style="min-width:200px;">Material</th>
                                                <th style="min-width:40px;">Quantity</th>
                                                <th style="min-width:80px;">Requirement Date</th>
                                                <th style="min-width:120px;">Purchase Status</th>
                                                <!--<th style="min-width:120px;">Site survey Status</th>
                                                <th style="min-width:120px;">Work Status</th>
                                            -->
                                            </tr>
                                        </thead>

                                        <tbody>

                                            <?php 
                                            $query="SELECT * FROM cyrusproject.vmaterialstatus";
                                            $result=mysqli_query($con,$query);
                                            if (mysqli_num_rows($result)>0)
                                            {

                                                while ($row=mysqli_fetch_assoc($result))
                                                {   

                                                    if ($row["Type"]=='Labour Work') {
                                                        $PS='Not is purchase';
                                                    }else{
                                                        $PS=$row["Status"];
                                                    }
                                                    print'<tr>'; 
                                                    print '<td>'.$row["Organization"]."</td>";
                                                    print '<td>'.$row["DivisionName"]."</td>";
                                                    print '<td>'.$row["OrderID"]."</td>";
                                                    print '<td>'.$row["MaterialName"]."</td>";
                                                    print '<td>'.$row["Qty"].' '.$row["Unit"]."</td>";
                                                    print '<td><span class="d-none">'.$row["DemandDate"].'</span>'.date('d-M-Y',strtotime($row["DemandDate"]))."</td>";
                                                    print '<td>'.$PS."</td>";

                                                    //print '<td><button type="button" class="btn btn-primary SiteSurveyStatus" data-bs-toggle="modal" data-bs-target="#SiteSurveyStatus" id="'.$row["MaterialID"].'">See Detail</button></td>';
                                                    //print '<td><button type="button" class="btn btn-primary WorkStatus" data-bs-toggle="modal" data-bs-target="#WorkStatus" id="'.$row["MaterialID"].'">See Detail</button></td>';

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

        </script>
    </body>

    </html>