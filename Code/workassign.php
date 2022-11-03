<?php 
include"connection.php";
include"session.php";
include"query.php";

?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>Work Assigning</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="" name="description" />
    <meta content="Anant Singh" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/cyrus logo.png">

    <!-- jquery.vectormap css -->
    <link href="assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />

    <!-- Bootstrap Css -->
    <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <!-- App Css-->
    <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

    <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />

    <link href="assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css">
    <link href="assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <link href="assets/libs/spectrum-colorpicker2/spectrum.min.css" rel="stylesheet" type="text/css">
    <link href="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet">
    <style type="text/css">
       table.dataTable tbody td {
        word-break: break-word;
        vertical-align: top;
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
                            <h4 class="mb-0">Site Work</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Cyrus</a></li>
                                    <li class="breadcrumb-item active">Site Work</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end page title -->


                <form class="form-control rounded-corner" style="margin-bottom: 50px;" id="SurveyF">
                    <div class="row">
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Organization</label>

                            <select class="form-control rounded-corner" id="OrgCodeW">
                                <option value="">Select</option>
                                <?php

                                $result=mysqli_query($con,$QueryOrg);
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
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Division</label>
                            <select class="form-select form-control rounded-corner" id="DivisionCodeW">
                                <option value="">Select</option>

                            </select>
                        </div>
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Site</label>
                            <select class="form-select form-control rounded-corner" id="SiteCodeW">
                                <option value="">Select</option>

                            </select>
                        </div>

                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Order ID</label>
                            <select class="form-select form-control rounded-corner" id="OrderIDW">
                                <option value="">Select</option>

                            </select>
                        </div>

                        <div class="col-lg-6">
                            <label for="recipient-name" class="col-form-label">Select Material</label>
                            <select class="form-select form-control rounded-corner2" id="MaterialW">
                                <option value="">Select</option>

                            </select>
                        </div>

                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Work</label>

                            <select class="form-control rounded-corner" id="WorkType">
                                <option value="">Select</option>
                                <?php

                                $query="SELECT * FROM cyrusproject.worktype";

                                $result=mysqli_query($con,$query);
                                if (mysqli_num_rows($result)>0)
                                {
                                  while ($arr=mysqli_fetch_assoc($result))
                                  {
                                    ?>
                                    <option value="<?php echo $arr['WorkTypeID']; ?>"><?php echo $arr['Work']; ?></option>
                                    <?php
                                }}?>
                            </select>
                        </div>

                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Quantity</label>
                            <input type="number" class="form-control rounded-corner" name="Qty" id="QtyW" min=1 onkeydown="limitx(this);" onkeyup="limitx(this);">
                        </div>
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Left Quantity</label>
                            <input type="text" class="form-control rounded-corner" name="Qty" id="LeftQtyW" disabled>
                        </div>          
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Unit</label>
                            <input type="text" class="form-control rounded-corner" name="Unit" id="UnitW" disabled>
                        </div>

                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Start Date</label>
                            <input type="date" class="form-control rounded-corner" name="Unit" id="SDateW">
                        </div>
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">End Date</label>
                            <input type="date" class="form-control rounded-corner" name="Unit" id="EDateW">
                        </div>
                        <center>
                            <div class="col-lg-2" style="margin-top: 35px;">
                                <button type="button" class="bt btn-lg btn-primary AddWorkSite">Add Work</button>
                            </div>
                        </center>

                    </div>
                </form>


                
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title mb-4">Unassigned Work</h4>

                                
                                <table class="table table-centered table-bordered displayUWork">
                                    <thead class="thead-light">
                                        <tr>
                                            <th style="min-width: 150px">Work</th>
                                            <th style="min-width: 400px; max-width: 500px;">Description</th>
                                            <th style="min-width: 80px">Work ID</th>
                                            <th style="min-width: 80px">Quantity</th>
                                            <th style="min-width: 80px">Start Date</th>
                                            <th style="min-width: 80px">End Date</th>
                                            <th style="min-width: 120px">Assign To</th>
                                        </tr>
                                    </thead>

                                    <tbody id="UNWork">

                                    </tbody>
                                </table>

                            </div><!-- end card-body -->
                        </div><!-- end card -->
                    </div><!-- end col -->

                </div><!-- end col -->
            </div><!-- end row -->
        </div>
        <!-- End Page-content -->

        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <script>document.write(new Date().getFullYear())</script> © Cyrus Electronics.
                    </div>

                </div>
            </div>
        </footer>

    </div>
    <!-- end main content-->

</div>
<!-- END layout-wrapper -->
</div>



<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<!-- JAVASCRIPT -->
<script src="assets/libs/jquery/jquery.min.js"></script>
<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/libs/metismenu/metisMenu.min.js"></script>
<script src="assets/libs/simplebar/simplebar.min.js"></script>
<script src="assets/libs/node-waves/waves.min.js"></script>


<script src="assets/libs/select2/js/select2.min.js"></script>
<script src="assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script src="assets/libs/spectrum-colorpicker2/spectrum.min.js"></script>
<script src="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
<script src="assets/libs/admin-resources/bootstrap-filestyle/bootstrap-filestyle.min.js"></script>
<script src="assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>

<script src="assets/js/pages/form-advanced.init.js"></script>


<!-- jquery.vectormap map -->
<script src="assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="assets/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-us-merc-en.js"></script>

<script src="assets/js/pages/dashboard.init.js"></script>
<script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>
<!-- App js -->
<script src="assets/js/app.js"></script>


<!-- Required datatable js -->
<script src="assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript">
//
$(document).ready(function () {
    $('table.displayUWork').DataTable({

        scrollY: '200px',
        scrollCollapse: true,
        paging: false,
        scrollX: true,
    });
});



function err(msg){
    Swal.fire({
        title: 'error!',
        text: msg,
        icon: 'error',

    })
}


$(document).on('change', '#OrgCodeW', function(){

    var OrgCode=$(this).val();
    if(OrgCode){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'OrgCode':OrgCode},
          success:function(result){
            $('#DivisionCodeW').html(result);

        }
    }); 
    }else{
        $('#DivisionCodeW').html('<option value="">Division</option>');
    }
});

$(document).on('change', '#DivisionCodeW', function(){

    var DivisionCode=$(this).val();
    if(DivisionCode){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'DivisionCodeOrder':DivisionCode},
          success:function(result){
            $('#OrderIDW').html(result);

        }
    });

        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'DivisionCode':DivisionCode},
          success:function(result){
            $('#SiteCodeW').html(result);

        }
    }); 
    }else{
        $('#OrderIDW').html('<option value="">Select</option>');
        $('#SiteCodeW').html('<option value="">Select</option>');
    }
});



$(document).on('change', '#SiteCodeW', function(){

    var SiteCodeW=$(this).val();
    if(SiteCodeW){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'SiteCodeWM':SiteCodeW},
          success:function(result){
            $('#MaterialW').html(result);

        }
    });  

        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'SiteWork':SiteCodeW},
          success:function(result){

           $('.displayUWork').DataTable().clear();
           $('.displayUWork').DataTable().destroy();
           $('#UNWork').html(result);
           $('table.displayUWork').DataTable({

            scrollY: '200px',
            scrollCollapse: true,
            paging: false,
            scrollX: true,
        });

       }
   }); 

    }else{
        $('#MaterialW').html('<option value="">Select</option>');
    }
});

$(document).on('change', '#MaterialW', function(){

    var MaterialW=$(this).val();
    var SiteCode=document.getElementById("SiteCodeW").value;

    if(MaterialW){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'GetQtyW':MaterialW, 'SiteCodeW':SiteCode},
          success:function(result){
            document.getElementById("LeftQtyW").value=result;
        }
    }); 

        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'GetUnit':MaterialW},
          success:function(result){
            document.getElementById("UnitW").value=result;
        }
    });
        document.getElementById("QtyW").disabled=false;
    }
});


function limitx(element)
{

    var Qty=document.getElementById("QtyW").value;
    var MaxQty= document.getElementById("LeftQtyW").value;
    if(MaxQty==0){
        document.getElementById("QtyW").value=null;
        document.getElementById("QtyW").disabled=true;
    }else if (Qty>parseInt(MaxQty)) {
      document.getElementById("QtyW").value=parseInt(MaxQty);
  }

}


$(document).on('click', '.AddWorkSite', function(){

    var OrderID=document.getElementById("OrderIDW").value;
    var SiteCode=document.getElementById("SiteCodeW").value;
    var MaterialID=document.getElementById("MaterialW").value;
    var WorkType=document.getElementById("WorkType").value;
    var Qty=document.getElementById("QtyW").value;
    var SDate=document.getElementById("SDateW").value;
    var EDate=document.getElementById("EDateW").value;
    if(OrderID && SiteCode && MaterialID && WorkType && Qty && SDate && EDate){

        $.ajax({
          type:'POST',
          url:'insert.php',
          data:{'OrderIDAW':OrderID, 'SiteCodeAW':SiteCode, 'MaterialIDAW':MaterialID, 'QtyAW':Qty, 'SDateAW':SDate, 'EDateAW':EDate, 'WorkTypeAW':WorkType},
          success:function(result){
            if (result==1) {
                $('#MaterialW').prop('selectedIndex',0);
                $('#WorkType').prop('selectedIndex',0);
                document.getElementById("SDateW").value=null;
                document.getElementById("EDateW").value=null;

                document.getElementById("QtyW").value=null;
                document.getElementById("LeftQtyW").value=null;
                document.getElementById("UnitW").value=null;

                $.ajax({
                  type:'POST',
                  url:'select.php',
                  data:{'SiteCodeWM':SiteCode},
                  success:function(result){
                    $('#MaterialW').html(result);

                }
            });  

                $.ajax({
                  type:'POST',
                  url:'select.php',
                  data:{'SiteWork':SiteCode},
                  success:function(result){

                   $('.displayUWork').DataTable().clear();
                   $('.displayUWork').DataTable().destroy();
                   $('#UNWork').html(result);
                   $('table.displayUWork').DataTable({

                    scrollY: '200px',
                    scrollCollapse: true,
                    paging: false,
                    scrollX: true,
                });

               }
           }); 

            }else{
                err(result);
            }
        }
    });
    }else{
        err("Please enter all fields");
        //$('.displayUWork').DataTable().clear();
        //$('.displayUWork').DataTable().destroy();
    }
});


$(document).on('change', '#AssignTo', function(){

    var EmployeeCode=$(this).val();
    var WorkID=$(this).attr("id2");
    var SiteCode=document.getElementById("SiteCodeW").value;
    if(EmployeeCode && WorkID){
        Swal.fire({
          title: 'Do you want to save the changes?',
          showDenyButton: true,
          showCancelButton: false,
          confirmButtonText: 'Save',
          denyButtonText: `Don't save`,
      }).then((result) => {
          /* Read more about isConfirmed, isDenied below */
          if (result.isConfirmed) {
              $.ajax({
                  type:'POST',
                  url:'insert.php',
                  data:{'EmployeeAssign':EmployeeCode, 'WorkIDAssign':WorkID},
                  success:function(result){
                    if (result==1) {
                        Swal.fire('Saved!', '', 'success');

                        $.ajax({
                          type:'POST',
                          url:'select.php',
                          data:{'SiteWork':SiteCode},
                          success:function(result){

                           $('.displayUWork').DataTable().clear();
                           $('.displayUWork').DataTable().destroy();
                           $('#UNWork').html(result);
                           $('table.displayUWork').DataTable({

                            scrollY: '200px',
                            scrollCollapse: true,
                            paging: false,
                            scrollX: true,
                        });

                       }
                   });

                    }else{
                        err(result);
                    }

                }
            }); 

          } else if (result.isDenied) {
            Swal.fire('Changes are not saved', '', 'info')
            $('#AssignTo').prop('selectedIndex',0);
        }
    })

  }else{
    $('#AssignTo').html('<option value="">Select</option>');
}
});
</script>