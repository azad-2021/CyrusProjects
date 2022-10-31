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
    <title>Home</title>
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
    <link href="assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css">


    <!-- DataTables -->
    <link href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/datatables.net-select-bs4/css//select.bootstrap4.min.css" rel="stylesheet" type="text/css" />
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
                                    </div><!-- end card-body -->

                                </div><!-- end card -->
                            </div><!-- end col-->

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

                                    </div><!-- end card-body -->

                                </div><!-- end card -->
                            </div><!-- end col-->

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

                                    </div><!-- end card-body -->


                                </div><!-- end card -->
                            </div><!-- end col -->
                        </div><!-- end row -->
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
                                                </tr>
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
                                </div><!-- end card-body -->
                            </div><!-- end card -->

                            <div class="col-xl-12">
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
    <script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>
    <!-- apexcharts -->

    <!-- jquery.vectormap map -->
    <script src="assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="assets/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-us-merc-en.js"></script>

    <!-- App js -->
    <script src="assets/js/app.js"></script>
    <script src="assets/libs/admin-resources/bootstrap-filestyle/bootstrap-filestyle.min.js"></script>

    <!-- Required datatable js -->
    <script src="assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <!-- Datatable init js -->
    <script src="assets/js/pages/datatables.init.js"></script>
    <script type="text/javascript">
//
$(document).ready(function () {
    $('table.sitedisplay').DataTable();
});


function err(msg){
    Swal.fire({
        title: 'error!',
        text: msg,
        icon: 'error',

    })
}

$(document).on('click', '.SaveOrg', function(){

  var Org=document.getElementById("neworg").value;
  if (Org) {
      $.ajax({
        url:"insert.php",
        method:"POST",
        data:{'NewOrg':Org},
        success:function(result){
            if(result==1){
                Swal.fire({
                    title: 'success',
                    text: 'Organization Created',
                    icon: 'success',
                });
                $('#NewOrg').modal("hide");
                $('#FAddOrg').trigger("reset");
            }else{
                err(result);
            }
        }
    });
  }
});

//Add Disision
$(document).on('click', '.SaveDiv', function(){

  var OrgCode=document.getElementById("OrgCodeNDiv").value;
  var Division=document.getElementById("newdiv").value;
  if (OrgCode && Division) {
      $.ajax({
        url:"insert.php",
        method:"POST",
        data:{'NewDiv':Division, 'OrgCodeNDiv':OrgCode},
        success:function(result){
            if(result==1){
                Swal.fire({
                    title: 'success',
                    text: 'Organization Created',
                    icon: 'success',
                });
                $('#NewDivision').modal("hide");
                $('#FAddDiv').trigger("reset");
            }else{
                err(result);
            }
        }
    });
  }else{
    err("Please enter all fields");
}
});

//Add Order
$(document).on('change', '#OrgCode', function(){

    var OrgCode=$(this).val();
    if(OrgCode){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'OrgCode':OrgCode},
          success:function(result){
            $('#DivisionCode').html(result);

        }
    }); 
    }else{
        $('#DivisionCode').html('<option value="">Division</option>');
    }
});

$(document).on('change', '#OrgCodeSite', function(){

    var OrgCode=$(this).val();
    if(OrgCode){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'OrgCode':OrgCode},
          success:function(result){
            $('#DivisionCodeSite').html(result);

        }
    }); 
    }else{
        $('#DivisionCodeSite').html('<option value="">Division</option>');
    }
});

$(document).on('change', '#LOADate', function(){

  var MinDate=$(this).val();
  $('#Completion').attr('min' , MinDate);
  $('#BGDate').attr('min' , MinDate);
});


//New Order

$(document).on('click', '.SaveOrder', function(){

    var file_data = $('#LOAFile').prop('files')[0];   
    var form_data = new FormData();                  
    form_data.append('file', file_data);

    var filename = file_data.name;
    var extension = filename.split('.').pop().toLowerCase();

    if(jQuery.inArray(extension,['pdf','']) == -1){
      err("Invalid file format");
  }else{


      var DivisionCode=document.getElementById("DivisionCode").value;
      var LOADate=document.getElementById("LOADate").value;
      var Completion=document.getElementById("Completion").value;
      var BGAmount=document.getElementById("BGAmount").value;
      var BGDate=document.getElementById("BGDate").value;
      var Warranty=document.getElementById("Warranty").value;
      var OderingAuth=document.getElementById("OderingAuth").value;
      var BillingAuth=document.getElementById("BillingAuth").value;
      var LOANumber=document.getElementById("LOANumber").value;
      var Description=document.getElementById("Description").value;

      if (DivisionCode && LOADate && Completion && BGAmount && BGDate && Warranty && OderingAuth && BillingAuth && Description && file_data) {
          $.ajax({
            url:"insert.php",
            method:"POST",
            data:{'DivisionCodeO':DivisionCode, 'LOADate':LOADate, 'Completion':Completion, 'BGAmount':BGAmount, 'BGDate':BGDate, 'Warranty':Warranty, 'OderingAuth':OderingAuth, 'BillingAuth':BillingAuth, 'LOANumber':LOANumber, 'Description':Description},
            success:function(result){
                if(result==1){

                    $.ajax({
                        url: 'upload.php',
                        dataType: 'text',
                        cache: false,
                        contentType: false,
                        processData: false,
                        data: form_data,                         
                        type: 'post',
                        success: function(result){

                        }
                    });


                    Swal.fire({
                        title: 'success',
                        text: 'Order ID : '+'<?php echo $_SESSION["NewOrderID"]; ?>',
                        icon: 'success',
                    });
                    $('#FAddOrder').trigger("reset");
                    $('#NewOrder').modal("hide");
                }else{
                    err(result);
                }
            }
        });
      }
  }
});

//Add Site

$(document).on('click', '.AddSite', function(){

    var DivisionCode=document.getElementById("DivisionCodeSite").value;
    var SiteName=document.getElementById("SiteName").value;
    var SiteAddress=document.getElementById("SiteAddress").value;
    var Consignee=document.getElementById("Consignee").value;

    if(DivisionCode && SiteName && SiteAddress && Consignee){
        $.ajax({
          type:'POST',
          url:'insert.php',
          data:{'DivisionCodeS':DivisionCode, 'SiteName':SiteName, 'SiteAddress':SiteAddress, 'Consignee':Consignee},
          success:function(result){
            if (result==1) {
                document.getElementById("SiteName").value='';
                document.getElementById("SiteAddress").value='';
                document.getElementById("Consignee").value='';

                $('.sitedisplay').DataTable().clear();
                $('.sitedisplay').DataTable().destroy();

                $.ajax({
                  type:'POST',
                  url:'select.php',
                  data:{'Sitedata':DivisionCode},
                  success:function(result){
                    $('#Sitedata').html(result);
                    $('table.sitedisplay').DataTable();

                }
            }); 
            }else{
                err(result);
            }
        }
    }); 
    }else{
        err("Please enter all fields");
    }
});


$(document).on('change', '#DivisionCodeSite', function(){

    var DivisionCode=$(this).val();
    if(DivisionCode){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'Sitedata':DivisionCode},
          success:function(result){
            $('.sitedisplay').DataTable().clear();
            $('.sitedisplay').DataTable().destroy();

            $.ajax({
              type:'POST',
              url:'select.php',
              data:{'Sitedata':DivisionCode},
              success:function(result){
                $('#Sitedata').html(result);
                $('table.sitedisplay').DataTable();

            }
        }); 

        }
    }); 
    }else{
        $('#DivisionCode').html('<option value="">Division</option>');
    }
});


$(document).on('click', '.DeleteSite', function(){

    var ID=$(this).attr("id");
    
    var DivisionCode=document.getElementById("DivisionCodeSite").value;
    if(ID && DivisionCode){
        $.ajax({
          type:'POST',
          url:'insert.php',
          data:{'DelSite':ID},
          success:function(result){

            if (result==1) {
                console.log("deleted");
            }else{
                err(result);
            }

        }
    });
        var delayInMilliseconds = 1000; 

        setTimeout(function() {
            $.ajax({
              type:'POST',
              url:'select.php',
              data:{'Sitedata':DivisionCode},
              success:function(result){
                $('.sitedisplay').DataTable().clear();
                $('.sitedisplay').DataTable().destroy();

                $.ajax({
                  type:'POST',
                  url:'select.php',
                  data:{'Sitedata':DivisionCode},
                  success:function(result){
                    $('#Sitedata').html(result);
                    $('table.sitedisplay').DataTable();

                }
            }); 

            }
        }); 
        }, delayInMilliseconds);

    }
});


//Accessing Vendor

$(document).on('change', '#OrgCodeAV', function(){

    var OrgCode=$(this).val();
    if(OrgCode){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'OrgCode':OrgCode},
          success:function(result){
            $('#DivisionCodeAV').html(result);

        }
    }); 
    }else{
        $('#DivisionCodeAV').html('<option value="">Division</option>');
    }
});

$(document).on('change', '#DivisionCodeAV', function(){

    var DivisionCode=$(this).val();
    if(DivisionCode){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'DivCodeOrderAV':DivisionCode},
          success:function(result){
            $('#OrderIDAV').html(result);

        }
    });  

    }else{
        $('#OrderIDAV').html('<option value="">Select</option>');
        $('#MaterialAV').html('<option value="">Select</option>');
    }
});


$(document).on('change', '#OrderIDAV', function(){

    var OrderID=$(this).val();
    if(OrderID){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'OrderIDAV':OrderID},
          success:function(result){
            $('#MaterialAV').html(result);

        }
    }); 

        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'VendorEAV':OrderID},
          success:function(result){
            $('.VendorEAV').html(result);

        }
    }); 


    }else{
        $('#MaterialAV').html('<option value="">Select</option>');
    }
});

$(document).on('change', '#MaterialAV', function(){

    var MaterialID=$(this).val();
    if(MaterialID){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'VendorList':MaterialID},
          success:function(result){

            $('.avdisplay').DataTable().clear();
            $('.avdisplay').DataTable().destroy();
            $('#VendorDataAV').html(result);
            $('table.avdisplay').DataTable();

        }
    }); 

    }
});



$( ".VendorType" ).change(function() {
  Type=$(this).val();
  if(Type=='New'){
    $("#EVendor").addClass('d-none');
    $("#NVendor").removeClass('d-none');
    //$(this).prev('li').prop('id', 'newId');
    document.getElementById("ContactAV").type="number";
    document.getElementById("AddressAV").disabled=false;
    document.getElementById("ContactAV").disabled=false;
    document.getElementById("EmailAV").disabled=false;
    document.getElementById("GSTNoAV").disabled=false;
}else if(Type=='Existing'){
    $("#NVendor").addClass('d-none');
    $("#EVendor").removeClass('d-none');
   // OrderID=document.getElementById("VendorNameAV").value;
   document.getElementById("ContactAV").type="text";
   document.getElementById("AddressAV").disabled=true;
   document.getElementById("ContactAV").disabled=true;
   document.getElementById("EmailAV").disabled=true;
   document.getElementById("GSTNoAV").disabled=true;
}
});


$(document).on('change', '#VendorNameAVE', function(){

    var VendorID=$(this).val();
    if(VendorID){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'VendorNameAVE':VendorID},
          success:function(result){
           // alert(result);
           const obj = JSON.parse(result);
           document.getElementById("AddressAV").value=obj.Address;
           document.getElementById("ContactAV").value=obj.Contact;
           document.getElementById("EmailAV").value=obj.Email;
           document.getElementById("GSTNoAV").value=obj.GST;


       }
   }); 

    }else{
        document.getElementById("AddressAV").value="";
        document.getElementById("ContactAV").value="";
        document.getElementById("EmailAV").value="";
        document.getElementById("GSTNoAV").value="";
    }
});




$(document).on('click', '.AddVendor', function(){
    var Type=$('input[name="VendorType"]:checked').val()
    var MaterialID=document.getElementById("MaterialAV").value;
    var OrderID=document.getElementById("OrderIDAV").value;
    if (Type=='New') {
        var Vendor=document.getElementById("VendorNameAVN").value;
    }else if(Type=='Existing'){
        var Vendor=document.getElementById("VendorNameAVE").value;
    }
    var Contact=document.getElementById("ContactAV").value;
    var Email=document.getElementById("EmailAV").value;

    var Address= document.getElementById("AddressAV").value;
    var GST=document.getElementById("GSTNoAV").value;

    if(MaterialID && OrderID && Vendor && Contact && Email && Type && Address && GST){
        $.ajax({
          type:'POST',
          url:'insert.php',
          data:{'MaterialIDAV':MaterialID, 'OrderIDAV':OrderID, 'VendorNameAV':Vendor, 'Contact':Contact, 'EmailAV':Email, 'AVType':Type, 'AddressAV':Address, 'GSTNoAV':GST},
          success:function(result){
            if (result==1) {
                document.getElementById("VendorNameAVN").value='';
                document.getElementById("ContactAV").value='';
                document.getElementById("EmailAV").value='';
                document.getElementById("AddressAV").value='';
                document.getElementById("GSTNoAV").value='';
                $.ajax({
                  type:'POST',
                  url:'select.php',
                  data:{'VendorList':MaterialID},
                  success:function(result){

                    $('.avdisplay').DataTable().clear();
                    $('.avdisplay').DataTable().destroy();
                    $('#VendorDataAV').html(result);
                    $('table.avdisplay').DataTable();

                }
            });

                $.ajax({
                  type:'POST',
                  url:'select.php',
                  data:{'VendorEAV':OrderID},
                  success:function(result){
                    $('.VendorEAV').html(result);

                }
            });     
            }else{
                err(result);
            }
        }
    }); 
    }else{
        err("Please enter all fields");
    }
});



$(document).on('click', '.DeleteVendor', function(){

    var ID=$(this).attr("id");
    
    var MaterialID=document.getElementById("MaterialAV").value;
    if(ID && MaterialID){
        $.ajax({
          type:'POST',
          url:'insert.php',
          data:{'DelAV':ID},
          success:function(result){

            if (result==1) {
                $.ajax({
                  type:'POST',
                  url:'select.php',
                  data:{'VendorList':MaterialID},
                  success:function(result){

                    $('.avdisplay').DataTable().clear();
                    $('.avdisplay').DataTable().destroy();
                    $('#VendorDataAV').html(result);
                    $('table.avdisplay').DataTable();

                }
            });
            }else{
                err(result);
            }

        }
    });

    }
});

//Site Survey

$(document).on('change', '#OrgCodeSurvey', function(){

    var OrgCode=$(this).val();
    if(OrgCode){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'OrgCode':OrgCode},
          success:function(result){
            $('#DivisionCodeSurvey').html(result);

        }
    }); 
    }else{
        $('#DivisionCodeSurvey').html('<option value="">Division</option>');
    }
});

$(document).on('change', '#DivisionCodeSurvey', function(){

    var DivisionCode=$(this).val();
    if(DivisionCode){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'DivisionCode':DivisionCode},
          success:function(result){
            $('#SiteCodeSurvey').html(result);

        }
    }); 

        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'DivisionCodeOrder':DivisionCode},
          success:function(result){
            $('#OrderIDSurvey').html(result);

        }
    }); 

    }else{
        $('#SiteCodeSurvey').html('<option value="">Site</option>');
        $('#OrderIDSurvey').html('<option value="">Order ID</option>');
    }
});


$(document).on('change', '#OrderIDSurvey', function(){

    var OrderID=$(this).val();
    if(OrderID){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'OrderIDSurvey':OrderID},
          success:function(result){
            $('#MaterialSurvey').html(result);

        }
    }); 

    }else{
        $('#MaterialSurvey').html('<option value="">Material</option>');
    }
});


$(document).on('change', '#MaterialSurvey', function(){

    var MaterialID=$(this).val();
    if(MaterialID){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'GetQtySurvey':MaterialID},
          success:function(result){
            //alert(result);
            document.getElementById("LeftQtySurve").value=result;
            document.getElementById("QtySurvey").max = result;

        }
    }); 

        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'GetUnit':MaterialID},
          success:function(result){

            document.getElementById("UnitSiteSurvey").value=result;

        }
    }); 



    }else{
        document.getElementById("LeftQtySurve").value=0;
        document.getElementById("UnitSiteSurvey").value=" ";
    }
});

function limit(element)
{

    var Qty=document.getElementById("QtySurvey").value;
    var MaxQty= document.getElementById("LeftQtySurve").value;

    if (Qty>parseInt(MaxQty)) {
      document.getElementById("QtySurvey").value=parseInt(MaxQty);
  }

}

$(document).on('click', '.AddSiteSurvey', function(){


    var MaterialID=document.getElementById("MaterialSurvey").value;
    var OrderID=document.getElementById("OrderIDSurvey").value;
    var Qty=document.getElementById("QtySurvey").value;
    var SiteCode=document.getElementById("SiteCodeSurvey").value;
    if(MaterialID && OrderID && Qty && SiteCode){
        $.ajax({
          type:'POST',
          url:'insert.php',
          data:{'MaterialSurvey':MaterialID, 'OrderIDSurvey':OrderID, 'QtySurvey':Qty, 'SiteCodeSurvey':SiteCode },
          success:function(result){

            if (result==1) {
                $.ajax({
                  type:'POST',
                  url:'select.php',
                  data:{'SurveydataE':SiteCode},
                  success:function(result){

                    $('.Surveydisplay').DataTable().clear();
                    $('.Surveydisplay').DataTable().destroy();
                    $('#Surveydata').html(result);
                    $('table.Surveydisplay').DataTable();

                }
            });
            }else{
                err(result);
            }

        }
    });

    }
});


$(document).on('change', '#SiteCodeSurvey', function(){

    var SiteCode=$(this).val();
    if(SiteCode){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'SurveydataE':SiteCode},
          success:function(result){

            $('.Surveydisplay').DataTable().clear();
            $('.Surveydisplay').DataTable().destroy();
            $('#Surveydata').html(result);
            $('table.Surveydisplay').DataTable();

        }
    });

    }else{
     $('.Surveydisplay').DataTable().clear();
     $('.Surveydisplay').DataTable().destroy();
 }
});


$(document).on('click', '.DeleteSurvey', function(){

    var ID=$(this).attr("id");
    
    var SiteCode=document.getElementById("SiteCodeSurvey").value;
    if(ID && SiteCode){
        $.ajax({
          type:'POST',
          url:'insert.php',
          data:{'DelSurvey':ID},
          success:function(result){

            if (result==1) {
                $.ajax({
                  type:'POST',
                  url:'select.php',
                  data:{'SurveydataE':SiteCode},
                  success:function(result){

                    $('.Surveydisplay').DataTable().clear();
                    $('.Surveydisplay').DataTable().destroy();
                    $('#Surveydata').html(result);
                    $('table.Surveydisplay').DataTable();

                }
            });
            }else{
                err(result);
            }

        }
    });

    }
});


$(document).on('click', '.SaveSurveyData', function(){

    var SiteCode=document.getElementById("SiteCodeSurvey").value;
    if(SiteCode){
        $.ajax({
          type:'POST',
          url:'insert.php',
          data:{'SaveSurveyData':SiteCode},
          success:function(result){

            if (result==1) {
                Swal.fire({
                    title: 'success',
                    text: 'Saved',
                    icon: 'success',
                });
                $('#SurveyF').trigger("reset");
                $('.Surveydisplay').DataTable().clear();
                $('.Surveydisplay').DataTable().destroy();
                

            }else{
                err(result);
            }

        }
    });

    }
});

//New Designation

$(document).on('click', '.NewDesignation', function(){

  var DesignationName=document.getElementById("DesignationName").value;
  if (DesignationName) {
      $.ajax({
        url:"insert.php",
        method:"POST",
        data:{'DesignationName':DesignationName},
        success:function(result){
            if(result==1){
                Swal.fire({
                    title: 'success',
                    text: 'Added',
                    icon: 'success',
                });
                $('#NewDesignation').modal("hide");
                $('#FNewDesignation').trigger("reset");
            }else{
                err(result);
            }
        }
    });
  }
});


$(document).on('click', '.SaveEmployee', function(){

  var EmployeeName=document.getElementById("EmployeeName").value;
  var DesignationCode=document.getElementById("DesignationCode").value;
  var EmployeeContact=document.getElementById("EmployeeContact").value;
  var EmployeeEmail=document.getElementById("EmployeeEmail").value;
  var EmployeeAddress=document.getElementById("EmployeeAddress").value;

  if (EmployeeName && DesignationCode && EmployeeContact && EmployeeEmail && EmployeeAddress) {
      $.ajax({
        url:"insert.php",
        method:"POST",
        data:{'EmployeeName':EmployeeName, 'DesignationCode':DesignationCode, 'EmployeeContact':EmployeeContact, 'EmployeeEmail':EmployeeEmail, 'EmployeeAddress':EmployeeAddress},
        success:function(result){
            if(result==1){
                Swal.fire({
                    title: 'success',
                    text: 'Added',
                    icon: 'success',
                });
                $('#NewEmployee').modal("hide");
                $('#EmployeeF').trigger("reset");
            }else{
                err(result);
            }
        }
    });
  }
});
</script>
</body>

</html>