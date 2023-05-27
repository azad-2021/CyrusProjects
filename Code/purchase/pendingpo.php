<?php 
include"connection.php";
include"session.php";
include"query.php";

?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>Pending PO</title>
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
                            <h4 class="mb-0">Pending Purchase Orders</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Cyrus</a></li>
                                    <li class="breadcrumb-item active">Pending Purchase Orders</li>
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
                                    <table class="table table-centered table-nowrap mb-0 table-bordered displayPO">
                                        <thead class="thead-light">
                                            <tr>
                                                <th>Organization</th>
                                                <th>Division</th>
                                                <th>Order ID</th>
                                                <th>Vendor</th>
                                                <th>PO Date</th>
                                                <th>PO No</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <?php 
                                        $query="SELECT * FROM cyrusproject.pending_po;";
                                        $result=mysqli_query($con,$query);
                                        if (mysqli_num_rows($result)>0)
                                        {

                                            while ($row=mysqli_fetch_assoc($result))
                                            {
                                                $EnPONo=base64_encode($row["PONo"]);
                                                print "<tr>";
                                                print '<td>'.$row["Organization"]."</td>";
                                                print '<td>'.$row["DivisionName"]."</td>";
                                                print '<td>'.$row["OrderID"]."</td>";
                                                print '<td>'.$row["VendorName"]."</td>";
                                                print '<td><span class="d-none">'.$row["PODate"].'</span>'.date('d-M-Y',strtotime($row["PODate"]))."</td>";
                                                print '<td><a href="printpo.php?PONo='.$EnPONo.'" target="_blank">'.$row["PONo"].'</a></td>';
                                                print '<td><button type="button" class="btn btn-primary podata" data-bs-toggle="modal" data-bs-target="#pendingpo" id="'.$row["POID"].'">PO Detail</button></td>';
                                                print '</tr>';
                                            }

                                        }

                                        ?>
                                        <tbody>

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

            $(document).ready(function () {
                $('table.displayPO').DataTable();
            });

            function err(msg){
                Swal.fire({
                    title: 'error!',
                    text: msg,
                    icon: 'error',

                })
            }

            function success(msg){
                Swal.fire({
                    title: 'success!',
                    text: msg,
                    icon: 'success',

                })
            }

            $(document).on('click', '.podata', function(){

                var PONo=$(this).attr("id");
                if(PONo){
                    $.ajax({
                      type:'POST',
                      url:'select.php',
                      data:{'PONoPending':PONo},
                      success:function(result){

                         $('.pendingpod').DataTable().clear();
                         $('.pendingpod').DataTable().destroy();
                         $('#podata').html(result);
                         $('table.pendingpod').DataTable();

                     }
                 }); 
                }else{
                    $('.pendingpodetails').DataTable().clear();
                    $('.pendingpodetails').DataTable().destroy();
                }
            });


            $(document).on('dblclick', '.ReadyQtyE', function(){

                ID=$(this).attr("id");
                document.getElementById(ID).disabled=false;
            });

            $(document).on('change', '.ReadyQtyE', function(){

                var ReadyQtyE=$(this).val();
                var ID=$(this).attr("id");
    //alert(ID);
                if(ReadyQtyE && ID){
                    $.ajax({
                      type:'POST',
                      url:'insert.php',
                      data:{'ReadyQtyE':ReadyQtyE, 'ID':ID},
                      success:function(result){

                         if (result=1) {
                            document.getElementById(ID).type="text";
                            document.getElementById(ID).value=ReadyQtyE;
                            document.getElementById(ID).type="number";
                            document.getElementById(ID).disabled=true;
                            success("Updated");
                        }else{
                            err(result);
                        }

                    }
                }); 
                }
            });
        </script>