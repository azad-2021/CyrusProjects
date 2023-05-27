<?php 
include"connection.php";
include"session.php";
include"query.php";

?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>Site Survey</title>
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
                            <h4 class="mb-0">Pending sites for survey</h4>
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
                                <table id="" class="table table-centered table-nowrap mb-0 table-bordered display">
                                    <thead class="thead-light">
                                        <tr>
                                            <th>Organization</th>
                                            <th>Zone / Division</th>
                                            <th>Order ID</th>
                                            <th>Order Date</th>
                                            <th>Site</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <?php 
                                        $query="SELECT * FROM cyrusproject.siteorders
                                        inner join division on siteorders.DivisionCode=division.DivisionCode
                                        inner join orders on siteorders.DivisionOrderID=orders.OrderID
                                        inner join site on siteorders.SiteCode=site.SiteCode
                                        inner join organization on division.OrganizationCode=organization.OrganizationCode WHERE Status=1;";
                                        $result=mysqli_query($con,$query);
                                        if (mysqli_num_rows($result)>0)
                                        {

                                            while ($row=mysqli_fetch_assoc($result))
                                            {


                                                print '<td>'.$row["Organization"]."</td>";
                                                print '<td>'.$row["DivisionName"]."</td>";
                                                print '<td>'.$row["OrderID"]."</td>";
                                                print '<td><span class="d-none">'.$row["OrderDate"].'</span>'.date('d-M-Y',strtotime($row["OrderDate"]))."</td>";
                                                print '<td>'.$row["SiteName"]."</td>";

                                                print '<td><a href="SiteSurvey.php?SiteCode='.base64_encode($row["SiteCode"]).'&OrderID='.base64_encode($row["OrderID"]).'">Enter Survey Details</a></td>';
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