<?php 
include"connection.php";
include"session.php";
include"query.php";

?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>Work Report</title>
    <?php include"head.php" ?>
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
                            <h4 class="mb-0">Work Report</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->


                <form class="form-control rounded-corner" style="margin-bottom: 50px;">
                    <center>
                        <br>

                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" id="ReportType" value="EmployeeType" name="ReportType">
                          <label class="form-check-label" for="inlineCheckbox1">Employee</label>
                      </div>
                      <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" id="ReportType" value="SiteType" name="ReportType">
                          <label class="form-check-label" for="inlineCheckbox2">Site/Station</label>
                      </div>
                  </center>
                  <div class="row">
                    <div class="col-lg-4 Site d-none">
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
                    <div class="col-lg-4 Site d-none">
                        <label for="recipient-name" class="col-form-label">Select Division</label>
                        <select class="form-select form-control rounded-corner" id="DivisionCodeW">
                            <option value="">Select</option>

                        </select>
                    </div>
                    <div class="col-lg-4 Site d-none">
                        <label for="recipient-name" class="col-form-label">Select Site</label>
                        <select class="form-select form-control rounded-corner" id="SiteCodeW">
                            <option value="">Select</option>

                        </select>
                    </div>

                    <div class="col-lg-4 Employee d-none">
                        <label for="recipient-name" class="col-form-label">Select Employee</label>

                        <select class="form-control rounded-corner" id="EmployeeReport">
                            <option value="">Select</option>
                            
                            <?php

                            $query="SELECT * FROM cyrusproject.employees WHERE Active=1 order by EmployeeName";

                            $result=mysqli_query($con,$query);
                            if (mysqli_num_rows($result)>0)
                            {
                              while ($arr=mysqli_fetch_assoc($result))
                              {
                                ?>
                                <option value="<?php echo $arr['EmployeeCode']; ?>"><?php echo $arr['EmployeeName']; ?></option>
                                <?php
                            }}?>
                        </select>
                    </div>
                    <div class="col-lg-4 Employee d-none">
                        <label for="recipient-name" class="col-form-label">Start Date</label>
                        <input type="date" class="form-control rounded-corner" id="Sdate">
                    </div>
                    <div class="col-lg-4 Employee d-none">
                        <label for="recipient-name" class="col-form-label">End Date</label>
                        <input type="date" class="form-control rounded-corner" id="Edate">
                    </div>
                    <center>
                        <div class="col-lg-2" style="margin-top: 35px;">
                            <button type="button" class="bt btn-lg btn-primary ViewWorkReport">View</button>
                        </div>
                    </center>

                </div>
            </form>



            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title mb-4">Work Report</h4>

                            <div class="table-responsive">
                                <table class="table table-centered table-bordered displayEmployeeWork Employee d-none">
                                    <thead class="thead-light">
                                        <tr>
                                            <th style="min-width: 110px">Organization</th>
                                            <th style="min-width: 110px">Zone/Division</th>
                                            <th style="min-width: 120px">Site/Station</th>
                                            <th style="min-width: 120px">Work</th>
                                            <th style="min-width: 60px">Quantity</th>
                                            <th style="min-width: 60px">Order ID</th>
                                            <th style="min-width: 80px">Work Date</th>
                                            <th style="min-width: 100px" class="d-none">Employee</th>
                                            <th style="min-width: 80px">Labour</th>
                                            <th style="min-width: 80px">No. of labours</th>
                                        </tr>
                                    </thead>

                                    <tbody id="EmployeeWorkReport">

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
            $('table.displayUWork').DataTable({

                scrollY: '200px',
                scrollCollapse: true,
                paging: false,
                scrollX: true,
            });
        });


        $(document).on('change', '#ReportType', function(){

            var ReportType=$(this).val();
            if(ReportType=='EmployeeType'){
                $( ".Employee" ).removeClass( "d-none" );
                $( ".Site" ).addClass( "d-none" );

            }else if(ReportType=='SiteType'){

                $( ".Site" ).removeClass( "d-none" );
                $( ".Employee" ).addClass( "d-none" );
                
            }
        });

        $(document).on('click', '.ViewWorkReport', function(){

            var EmployeeCode=$("#EmployeeReport").val();
            var Edate=$("#Edate").val();
            var Sdate=$("#Sdate").val();
            if(EmployeeCode && Sdate && Edate){
                $.ajax({
                  type:'POST',
                  url:'select.php',
                  data:{'EmployeeReport':EmployeeCode, 'EdateEReport':Edate, 'SdateEReport':Sdate},
                  success:function(result){

                     $('.displayEmployeeWork').DataTable().clear();
                     $('.displayEmployeeWork').DataTable().destroy();
                     $('#EmployeeWorkReport').html(result);
                     $('table.displayEmployeeWork').DataTable({

                         dom: 'Bfrtip',
                         buttons: [
                            'excel'
                            ]

                     });


                 }
             }); 
            }else{
                err("Please enter all fields");
            }
        });

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



            }else{
                $('#MaterialW').html('<option value="">Select</option>');
            }

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
              document.getElementById("QtyW").value=parseFloat(MaxQty);
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