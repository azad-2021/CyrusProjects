<?php 
include"connection.php";
include"session.php";
include"query.php";

?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>Movement Control</title>
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
                            <h4 class="mb-0">Movement Control</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Cyrus</a></li>
                                    <li class="breadcrumb-item active">Movement Control</li>
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

                            <select class="form-control rounded-corner" id="OrgCodeM">
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
                            <select class="form-select form-control rounded-corner" id="DivisionCodeM">
                                <option value="">Select</option>

                            </select>
                        </div>


                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Order ID</label>
                            <select class="form-select form-control rounded-corner" id="OrderIDM">
                                <option value="">Select</option>

                            </select>
                        </div>

                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Vendor</label>
                            <select class="form-select form-control rounded-corner" id="VendorM">
                                <option value="">Select</option>

                            </select>
                        </div>

                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select State</label>

                            <select class="form-control rounded-corner" id="State">
                                <option value="">Select State</option>
                                <?php

                                $query="SELECT * FROM cyrusproject.states order by StateName";

                                $result=mysqli_query($con,$query);
                                if (mysqli_num_rows($result)>0)
                                {
                                  while ($arr=mysqli_fetch_assoc($result))
                                  {
                                    ?>
                                    <option value="<?php echo $arr['StateCode']; ?>"><?php echo $arr['StateName']; ?></option>
                                    <?php
                                }}?>
                            </select>
                        </div>

                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Movement</label>

                            <select class="form-control rounded-corner" id="Movement">
                                <option value="">Select</option>
                                <?php

                                $query="SELECT * FROM cyrusproject.movement";

                                $result=mysqli_query($con,$query);
                                if (mysqli_num_rows($result)>0)
                                {
                                  while ($arr=mysqli_fetch_assoc($result))
                                  {
                                    ?>
                                    <option value="<?php echo $arr['MovementID']; ?>"><?php echo $arr['Movement']; ?></option>
                                    <?php
                                }}?>
                            </select>
                        </div>
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Site</label>
                            <select class="form-select form-control rounded-corner" id="SiteCodeM">
                                <option value="">Select</option>

                            </select>
                        </div>
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Shipping Address</label>
                            <textarea class="form-control rounded-corner" id="InspectionOther"></textarea>
                        </div>


                    </div>
                </form>


                
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-centered table-nowrap mb-0 table-bordered displayC" style="text-align:center;">
                                        <thead class="thead-light">
                                            <tr>
                                                <th width="20%">Item Name</th>
                                                <th width="20%">Modal No</th>
                                                <th width="15%">PO Quantity</th>
                                                <th width="15%">Ready Qty</th>
                                                <th width="15%">Rate</th>
                                                <th width="15%">Select</th>
                                            </tr>
                                        </thead>

                                        <tbody id="CTable">

                                        </tbody>
                                    </table>
                                </div>  
                                <h4 align="right" style="margin: 30px;">Amount : <span id="AmountC">0</span></h4>                      
                            </div><!-- end card-body -->

                            <center>
                                <div class="col-lg-2" style="margin-top: 35px; margin-bottom: 20px;">
                                    <button type="button" class="bt btn-lg btn-primary GenerateChallan">Generate Challan</button>
                                </div>
                            </center>
                        </div><!-- end card -->
                    </div><!-- end col -->

                </div><!-- end col -->
            </div><!-- end row -->
        </div>
        <!-- End Page-content -->
        <?php include "footer.php"; ?>
        <script type="text/javascript">

            $(document).ready(function () {
                $('table.displayC').DataTable();
            });

            function err(msg){
                Swal.fire({
                    title: 'error!',
                    text: msg,
                    icon: 'error',

                })
            }


            $(document).on('change', '#OrgCodeM', function(){

                var OrgCode=$(this).val();
                if(OrgCode){
                    $.ajax({
                      type:'POST',
                      url:'select.php',
                      data:{'OrgCode':OrgCode},
                      success:function(result){
                        $('#DivisionCodeM').html(result);

                    }
                }); 
                }else{
                    $('#DivisionCodeM').html('<option value="">Division</option>');
                }
            });

            $(document).on('change', '#DivisionCodeM', function(){

                var DivisionCode=$(this).val();
                if(DivisionCode){
                    $.ajax({
                      type:'POST',
                      url:'select.php',
                      data:{'DivisionCodeM':DivisionCode},
                      success:function(result){
                        $('#OrderIDM').html(result);

                    }
                });  

                }else{
                    $('#OrderIDM').html('<option value="">Select</option>');
                    $('#VendorM').html('<option value="">Select</option>');
                }
            });



            $(document).on('change', '#OrderIDM', function(){

                var OrderIDM=$(this).val();
                if(OrderIDM){
                    $.ajax({
                      type:'POST',
                      url:'select.php',
                      data:{'OrderIDM':OrderIDM},
                      success:function(result){
                        $('#VendorM').html(result);

                    }
                });  

                }else{
                    $('#VendorM').html('<option value="">Select</option>');
                }
            });


            $(document).on('change', '#VendorM', function(){

                var VendorID=$(this).val();
                if(VendorID){

                    $.ajax({
                      type:'POST',
                      url:'select.php',
                      data:{'VendorM':VendorID},
                      success:function(result){
                         $('.displayC').DataTable().clear();
                         $('.displayC').DataTable().destroy();
                         $('#CTable').html(result);
                         $('table.displayC').DataTable();

                     }
                 });
                }else{
                    $('.displayC').DataTable().clear();
                    $('.displayC').DataTable().destroy();
                }
            });


            $(document).on('change', '#Movement', function(){

                var ID=$(this).val();
                document.getElementById("InspectionOther").value='';
                var DivisionCodeM = document.getElementById("DivisionCodeM").value;
                if(DivisionCodeM){
                    $.ajax({
                      type:'POST',
                      url:'select.php',
                      data:{'GestSiteM':DivisionCodeM},
                      success:function(result){
                        $('#SiteCodeM').html(result);
                        document.getElementById("SiteCodeM").disabled=false;
                    }
                }); 
                }else{
                    document.getElementById("SiteCodeM").disabled=true;
                    $('#SiteCodeM').html('<option value="">Site</option>');

                }
            });

            $(document).on('change', '#SiteCodeM', function(){

                var SiteCodeM=$(this).val();

                if(SiteCodeM){
                    $.ajax({
                      type:'POST',
                      url:'select.php',
                      data:{'SiteCodeM':SiteCodeM},
                      success:function(result){
                        document.getElementById("InspectionOther").value=result;
                        document.getElementById("InspectionOther").disabled=true;
                    }
                }); 
                }else{
                    document.getElementById("InspectionOther").value='';
                    document.getElementById("InspectionOther").disabled=false;
                }
            });


            $(document).on('change', '.CRate', function(){

                var arr = $('input[name="CRate[]"]').map(function () {

                    if (this.value) {

                        return this.value;
                    }else{
                        return 0;
                    }


                }).get();

                const sum = arr.reduce(add, 0);

                function add(accumulator, a) {
                  return accumulator + parseFloat(a);
              }
  //alert(sum);
              document.getElementById("AmountC").innerHTML=sum.toFixed(2);
          });


            var Ins=0;
            $(document).on('change', '.checkb', function(){

                var MaterialID=$(this).val();
                Ins=0;
                var Rate=document.getElementById(MaterialID).value;
    //alert(Rate);
                if (!Rate) {

                    err("Please enter rate");
                    $(this).prop('checked', false);
                }

                $("input:checkbox[name=select]:checked").each(function() {
                    InspectionAt=$(this).attr("id");
        //alert(InspectionAt);
                    if (InspectionAt=='Inspection at other place') {

                        Ins=1;
                    }

                });

                if (Ins==1) {
                    document.getElementById("InspectionOther").disabled=false;
                }else{
                    document.getElementById("InspectionOther").disabled=true;
                }


            });



            $(document).on('click', '.GenerateChallan', function(){

                var POID = [];
                var Rate=[];
                var OrderID=document.getElementById("OrderIDM").value;
                var MovementID=document.getElementById("Movement").value;
                var ShippingAddress=document.getElementById("InspectionOther").value;
                var StateCode=document.getElementById("State").value;
                var SiteCode=document.getElementById("SiteCodeM").value;

                $("input:checkbox[name=select]:checked").each(function() {
                    POID.push($(this).val());
                    Rate.push(document.getElementById($(this).val()).value);
                });

                if (POID.length==0) {
                    err("Please select Material");
                }else if(!StateCode){
                    err("Please select state");
                }else if(!ShippingAddress){
                    err("Please enter Shipping Address");
                }else if(!MovementID){
                    err("Please enter Movement");
                }else{

                    $.ajax({
                      type:'POST',
                      url:'insert.php',
                      data:{'POIDCH':POID, 'RateCH':Rate, 'OrderIDCH':OrderID, 'MovementIDCH':MovementID, 'ShippingAddressCH':ShippingAddress, 'StateCodeCH':StateCode, 'SiteCodeCH':SiteCode },
                      success:function(result){

                        if (result==1) {
                            window.open('printchallan.php', '_blank').focus();
                            window.location.reload();

                        }else{
                            err(result);
                        }

                    }
                }); 

                }


            });


        </script>