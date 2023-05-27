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
                                    <h4 class="card-title mb-4">Orders having DOC less than 30 days</h4>

                                    <div class="table-responsive">
                                        <table id="" class="table table-centered table-nowrap mb-0 table-bordered display">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>Organization</th>
                                                    <th>Zone / Division</th>
                                                    <th>Order ID</th>
                                                    <th>Order Date</th>
                                                    <th>Completion Date</th>
                                                    <th>Left Days</th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <?php 
                                                $query="SELECT Organization, DivisionName, OrderID, OrderDate, CompletionDate, datediff(CompletionDate, current_date()) as LeftDays  FROM cyrusproject.orders join division on orders.DivisionCode=division.DivisionCode
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
                                                        print '<td><span class="d-none">'.$row["OrderDate"].'</span>'.date('d-M-Y',strtotime($row["OrderDate"]))."</td>";

                                                        print '<td style="cursor: pointer; color:blue;"><span class="d-none">'.$row["CompletionDate"].'</span> <span class="ChangeDoc" id2="'.$row["OrderID"].'">'.date('d-M-Y',strtotime($row["CompletionDate"])).'</span> <input type="file" style="margin-bottom:15px;" name="DOCFile" id="D'.$row["OrderID"].'" class="form-control rounded-corner d-none"> <input type="date" class="form-control rounded-corner d-none ChangeDoc1" id2="'.$row["CompletionDate"].'" id="'.$row["OrderID"].'"> </td>';

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
                                    <h4 class="card-title mb-4">Performance Guarantee expiry less than 90 days</h4>

                                    <div class="table-responsive">
                                        <table class="table table-centered table-nowrap mb-0 table-bordered display">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>Organization</th>
                                                    <th>Division</th>
                                                    <th>Order ID</th>
                                                    <th>Order Date</th>
                                                    <th>Completion Date</th>
                                                    <th>PG Amount</th>
                                                    <th>PG Date</th>
                                                    <th>PG Valid Till Date</th>
                                                    <th>Left Days</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <?php 
                                                $query="SELECT Organization, DivisionName, OrderID, OrderDate, CompletionDate, PGAmount, PGDate, PGValidDate, datediff(PGValidDate, current_date()) as LeftDays  FROM cyrusproject.orders join division on orders.DivisionCode=division.DivisionCode join organization on division.OrganizationCode=organization.OrganizationCode WHERE datediff(PGValidDate, current_date())<90;";
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
                                                        print '<td><span class="d-none">'.$row["OrderDate"].'</span>'.date('d-M-Y',strtotime($row["OrderDate"]))."</td>";
                                                        print '<td><span class="d-none">'.$row["CompletionDate"].'</span>'.date('d-M-Y',strtotime($row["CompletionDate"]))."</td>";
                                                        print '<td>'.$row["PGAmount"]."</td>";

                                                        print '<td><span class="d-none">'.$row["PGDate"].'</span>'.date('d-M-Y',strtotime($row["PGDate"]))."</td>";
                                                        
                                                        print '<td style="cursor: pointer; color:blue;"><span class="d-none">'.$row["PGValidDate"].'</span> <span class="ChangePG" id2="'.$row["OrderID"].'">'.date('d-M-Y',strtotime($row["PGValidDate"])).'</span> <input type="file" style="margin-bottom:15px;" name="DOCFile" id="G'.$row["OrderID"].'" class="form-control rounded-corner d-none"> <input type="date" class="form-control rounded-corner d-none ChangePG1" id2="'.$row["PGValidDate"].'" id="P'.$row["OrderID"].'" id3="'.$row["OrderID"].'"></td>';

                                                        
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

                    $(document).on('dblclick','.ChangeDoc', function(){

                     $(this).addClass("d-none");
                     var OrderID=$(this).attr("id2");
                    // alert(OrderID);
                     $("#"+OrderID).removeClass("d-none");
                     $("#D"+OrderID).removeClass("d-none");
                 });


                    $(document).on('change', '.ChangeDoc1', function(){

                        var NewDOC=$(this).val();
                        var DOC=$(this).attr("id2");
                        var OrderID=$(this).attr("id");
                        
                        var file = $('#D'+OrderID)[0].files[0]; 
                        if (!file) {
                          err('Please choose a file.');
                          $(this).val(null);
                          return;
                      }


                      var fileSize = file.size; 
                      var fileType = file.type; 


                      if (fileSize > 2 * 1024 * 1024) {
                          err('File size must be less than 2MB.');
                          $(this).val(null);
                          return;
                      }


                      if (fileType != 'application/pdf') {
                          err('File must be in PDF format.');
                          $(this).val(null);
                          return;
                      }


                      if(NewDOC && DOC && file){

                        var formData = new FormData();
                        formData.append('file', file);
                        formData.append('NewDOC',NewDOC);
                        formData.append('DOC',DOC);
                        formData.append('OrderIDDOC',OrderID);

                        $.ajax({
                          type:'POST',
                          url:'insert.php',
                          data:formData,
                          async: false,
                          cache: false,
                          contentType: false,
                          processData: false,
                          success:function(result){
                            if (result==1) {

                                location.reload();
                            }else{

                                err(result);
                                location.reload();

                            }

                        }
                    }); 
                    }else{
                        err("Please enter all fields");
                    }
                });


                    $(document).on('dblclick','.ChangePG', function(){

                     $(this).addClass("d-none");
                     var OrderID=$(this).attr("id2");
                     //alert(OrderID);
                     $("#P"+OrderID).removeClass("d-none");
                     $("#G"+OrderID).removeClass("d-none");
                 });


                    $(document).on('change', '.ChangePG1', function(){

                        var NewPG=$(this).val();
                        var PG=$(this).attr("id2");
                        var OrderID=$(this).attr("id3");
                        
                        var file = $('#G'+OrderID)[0].files[0]; 
                        if (!file) {
                          err('Please choose a file.');
                          $(this).val(null);
                          return;
                      }


                      var fileSize = file.size; 
                      var fileType = file.type; 


                      if (fileSize > 2 * 1024 * 1024) {
                          err('File size must be less than 2MB.');
                          $(this).val(null);
                          return;
                      }


                      if (fileType != 'application/pdf') {
                          err('File must be in PDF format.');
                          $(this).val(null);
                          return;
                      }

                      if(NewPG && PG && file){

                        var formData = new FormData();
                        formData.append('file2', file);
                        formData.append('NewPG',NewPG);
                        formData.append('PG',PG);
                        formData.append('OrderIDPG',OrderID);

                        $.ajax({
                          type:'POST',
                          url:'insert.php',
                          data:formData,
                          async: false,
                          cache: false,
                          contentType: false,
                          processData: false,
                          success:function(result){
                            if (result==1) {

                                location.reload();
                            }else{

                                err(result);
                                //location.reload();

                            }

                        }
                    }); 
                    }
                });


            </script>
        </body>

        </html>