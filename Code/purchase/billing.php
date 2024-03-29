<?php 
include"connection.php";
include"session.php";
include"query.php";

$UserID=1;
date_default_timezone_set('Asia/Calcutta');
$timestamp =date('y-m-d H:i:s');
$Date = date('Y-m-d',strtotime($timestamp));

#$Date2 = date('d.m.y',strtotime($timestamp));

if (isset($_POST['submit'])) {
    $errors='';
    $VendorID=$_POST['VendorOFH'];
    $PaymentTerm=$_POST['Payment'];
    $DeliveryTerm=$_POST['Delivery'];
    $WarrantyTerm=$_POST['Warranty'];

    $OfferDate=date('d.m.Y',strtotime($_POST['OfferDate']));
    $OFD=$_POST['OfferDate'];
    $file_name = $_FILES['OfferFile']['name'];
    $file_size =$_FILES['OfferFile']['size'];
    $file_tmp =$_FILES['OfferFile']['tmp_name'];
    $file_type=$_FILES['OfferFile']['type'];
    $tmp = explode('.', $_FILES['OfferFile']['name']);
    $file_ext = strtolower(end($tmp));    

    $extensions= array("pdf");

    

    if(in_array($file_ext,$extensions)=== false){
        $errors ='<script>alert("File must be in pdf format")</script>';
    }else if (empty($VendorID)==true) {
        $errors ='<script>alert("Please select vendor")</script>';
    }

    if (empty($errors)==true) {

        $query="SELECT OrderID FROM vendors WHERE VendorID=$VendorID";
        $result=mysqli_query($con,$query);
        if (mysqli_num_rows($result)>0)
        {
            $row=mysqli_fetch_assoc($result);
            $OrderID=$row["OrderID"];
            $OfferFile=$OrderID.'_'.$VendorID.'_'.$OfferDate.".".$file_ext;
            $Upload=move_uploaded_file($file_tmp,"offer_letter/".$OfferFile);

        }

        if ($Upload==1) {

            $sql = "INSERT INTO cyrusproject.`offer terms` (PaymentTerms, WarrantyTerms, DeliveryTerms)
            VALUES ('$PaymentTerm', '$WarrantyTerm', '$DeliveryTerm')";
            if ($con->query($sql) === TRUE) {

                $TermID=$con->insert_id;
            } else {

                echo "Error: " . $sql . "<br>" . $con->error;
            }


            $query="SELECT * FROM tempoffer WHERE VendorID=$VendorID";
            $result=mysqli_query($con,$query);
            if (mysqli_num_rows($result)>0)
            {
                $err=0;
                while ($row=mysqli_fetch_assoc($result))
                {
                    $MaterialID=$row["MaterialID"];
                    $ItemName=$row["ItemName"];
                    $Rate=$row["Rate"];
                    $Qty=$row["Qty"];
                    $Inspection=$row["Inspection"];
                    $ModalNo=$row["ModalNo"];
                    $GST=$row["GST"];

                    $sql = "INSERT INTO offers (TermID, OrderID, MaterialID, VendorID,  ItemName, OfferRate, Qty, InspectionAt, OfferDate, ModalNo, GST)
                    VALUES ($TermID, $OrderID, $MaterialID, $VendorID, '$ItemName', $Rate, $Qty, '$Inspection', '$OFD', '$ModalNo', $GST)";

                    if ($con->query($sql) === TRUE) {


                        $sql2 = "UPDATE demand_details set Status=2 WHERE MaterialID=$MaterialID";

                        if ($con->query($sql2) === TRUE) {


                            $sql3 = "DELETE FROM tempoffer WHERE MaterialID=$MaterialID";

                            if ($con->query($sql3) === TRUE) {

                               //echo "<meta http-equiv='refresh' content='0'>";
                            } else {

                                echo "Error: " . $sql3 . "<br>" . $con->error;
                            }



                        } else {

                            echo "Error: " . $sql2 . "<br>" . $con->error;
                        }


                    } else {
                        $err=1;
                        echo "Error: " . $sql . "<br>" . $con->error;
                        break;

                    }
                }


            }
        }

        if ($err==0) {
            echo "<meta http-equiv='refresh' content='0'>";
        }

    }else{
        echo $errors;
    }


}
?>

<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8" />
    <title>Billing</title>
    <?php include"head.php" ?>

    <link href="assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css">
    <link href="assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <link href="assets/libs/spectrum-colorpicker2/spectrum.min.css" rel="stylesheet" type="text/css">
    <link href="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet">
    <style type="text/css">


       table.dataTable tbody td {
        word-break: break-word;
        vertical-align: top;
    }
    .errorClass { border:  1px solid red; }

</style>

</head>

<body data-sidebar="dark" data-topbar="dark">

    <!-- <body data-layout="horizontal" data-topbar="dark"> -->

        <!-- Begin page -->
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
                                <h4 class="mb-0">Billing</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Cyrus</a></li>
                                        <li class="breadcrumb-item active">Billing</li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <form class="form-control rounded-corner" action = "" method = "POST">
                        <div class="row">
                            <div class="col-lg-3">
                                <label for="recipient-name" class="col-form-label">Select Organization</label>

                                <select class="form-control rounded-corner" id="OrgCodeB" required>
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
                                <select class="form-select form-control rounded-corner" id="DivisionCodeB">
                                    <option value="" required>Select</option>

                                </select>
                            </div>
                            <div class="col-lg-3">
                                <label for="recipient-name" class="col-form-label">Select Order ID</label>
                                <select class="form-select form-control rounded-corner" name="OrderID" id="OrderIDB" required>
                                    <option value="">Select</option>

                                </select>
                            </div>
                            <div class="col-lg-3">
                                <label for="recipient-name" class="col-form-label">Billing Authority</label>
                                <input type="text" name="" id="BillingAuth" class="form-control rounded-corner" disabled>
                            </div>
                            <center>
                                <div class="col-lg-3">
                                    <label for="recipient-name" class="col-form-label">GST No</label>
                                    <input type="text" name="" id="GSTNo" class="form-control rounded-corner" disabled>
                                </div>
                            </center>

                        </div>

                    </form>


                    <form class="form-control rounded-corner" style="margin-top: 20px;" id="FB">
                        <h4 align="center">Enter Details</h4>
                        <div class="row">
                            <div class="col-lg-4">
                                <label for="recipient-name" class="col-form-label">Select material</label>

                                <select class="form-control rounded-corner2" id="MaterialB" required>
                                    <option value="" style="text-align: center;">Select</option>
                                </select>
                            </div>

                            <div class="col-lg-2">
                                <label for="recipient-name" class="col-form-label">Avialable Quantity</label>
                                <input type="text" class="form-control rounded-corner" name="AQtyB" id="AQtyB" disabled>
                            </div>
                            <div class="col-lg-2">
                                <label for="recipient-name" class="col-form-label">Enter Qty</label>
                                <input type="number" class="form-control rounded-corner" name="QtyB" id="QtyB">
                            </div>
                            <div class="col-lg-2">
                                <label for="recipient-name" class="col-form-label">Rate</label>
                                <input type="text" class="form-control rounded-corner" name="RateB" id="RateB" disabled>
                            </div>
                            <div class="col-lg-2">
                                <label>Billing Type</label>
                                <select class="form-control rounded-corner" id="BillingType" required>
                                    <option value="">Select</option>
                                    <?php

                                    $Query="SELECT * FROM cyrusproject.billingtype";
                                    $result=mysqli_query($con,$Query);
                                    if (mysqli_num_rows($result)>0)
                                    {
                                      while ($arr=mysqli_fetch_assoc($result))
                                      {
                                        ?>
                                        <option value="<?php echo $arr['ID']; ?>"><?php echo $arr['Type']; ?></option>
                                        <?php
                                    }}?>
                                </select>
                            </div>
                            <center>
                                <div class="col-lg-2">
                                    <label for="recipient-name" class="col-form-label">% Billing</label>
                                    <input type="number" class="form-control rounded-corner" name="Pbilling" id="Pbilling">
                                </div>
                                <div class="col-lg-3">
                                    <label>GST Category</label>
                                    <select class="form-control rounded-corner" id="GST" required>
                                        <option value="">Select</option>
                                        <?php

                                        $Query="SELECT * FROM cyrusproject.`gst rates`";
                                        $result=mysqli_query($con,$Query);
                                        if (mysqli_num_rows($result)>0)
                                        {
                                          while ($arr=mysqli_fetch_assoc($result))
                                          {
                                            $d = array("HSNCode "=>$arr['HSNCode'], "GSTRate"=>$arr['Rate'], "FullHSNCode "=>$arr['FullHSNCode ']);
                                            $data=json_encode($d);
                                            ?>
                                            <option value='<?php echo $data; ?>'><?php echo $arr['CatagoryName']; ?></option>
                                            <?php
                                        }}?>
                                    </select>
                                </div>
                            </div>

                            <button type="button" class="btn btn-primary AddMaterial" style="margin-top: 20px; margin-bottom: 20px;">Add</button>
                        </center>


                        <br>
                        <table class="table table-centered table-hover table-bordered border-primary  displayOF" style="margin-top: 10px;" width="100%">
                            <thead>
                                <th style="min-width: 200px">Material Name</th>
                                <th style="min-width: 60px">Quantity</th>
                                <th style="min-width: 40px">Rate</th>
                                <th style="min-width: 60px">Billing Type</th>
                                <th style="min-width: 60px">Billing %</th>
                                <th style="min-width: 70px">HSN Code</th>
                                <th style="min-width: 40px">GST</th>
                                <th style="min-width: 120px">GST Category</th>
                                <th style="min-width: 80px">Action</th>
                            </thead>
                            <tbody id="MaterialdataOF">

                            </tbody>
                        </table>
                    </div>

                </form>
            </div>



        </div><!-- end col -->

    </div><!-- end col -->

</div>
<!-- End Page-content -->
<?php include "footer.php"; ?>
<script type="text/javascript">


    $(document).ready(function () {
        $('table.displayOF').DataTable({

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





    $(document).on('change', '#OrgCodeB', function(){

        var OrgCode=$(this).val();
        if(OrgCode){
            $.ajax({
              type:'POST',
              url:'select.php',
              data:{'OrgCode':OrgCode},
              success:function(result){
                $('#DivisionCodeB').html(result);

            }
        }); 
        }else{
            $('#DivisionCodeB').html('<option value="">Division</option>');
        }
    });

    $(document).on('change', '#DivisionCodeB', function(){

        var DivisionCode=$(this).val();
        if(DivisionCode){
            $.ajax({
              type:'POST',
              url:'select.php',
              data:{'DivCodeOrderB':DivisionCode},
              success:function(result){
                $('#OrderIDB').html(result);

            }
        });  

            $.ajax({
              type:'POST',
              url:'select.php',
              data:{'GetGST':DivisionCode},
              success:function(result){
                 document.getElementById("GSTNo").value=result;

             }
         });  
        }else{
         document.getElementById("GSTNo").value=null;
         $('#OrderIDB').html('<option value="">Select</option>');
         
     }
 });



    $(document).on('change', '#OrderIDB', function(){

        var OrderID=$(this).val();
        if(OrderID){
            $.ajax({
              type:'POST',
              url:'select.php',
              data:{'OrderIDB':OrderID},
              success:function(result){
                document.getElementById("BillingAuth").value=result;
            }
        }); 

            $.ajax({
              type:'POST',
              url:'select.php',
              data:{'OrderIDB':OrderID},
              success:function(result){
                $('#MaterialB').html(result);
            }
        }); 


        }else{
            document.getElementById("BillingAuth").value=null;
            $('#MaterialB').html('<option value="">Select</option>');
        }
    });



    $(document).on('change', '#VendorOF', function(){

        var VendorID=$(this).val();
        if(VendorID){
            document.getElementById("VendorOFH").value=VendorID;
            $.ajax({
              type:'POST',
              url:'select.php',
              data:{'VendorOF':VendorID},
              success:function(result){
                $('#MaterialOF').html(result);

            }
        }); 


            $.ajax({
              type:'POST',
              url:'select.php',
              data:{'MaterialdataOF':VendorID},
              success:function(result){
               $('.displayOF').DataTable().clear();
               $('.displayOF').DataTable().destroy();
               $('#MaterialdataOF').html(result);

               $('table.displayOF').DataTable( {

                   scrollY: '200px',
                   scrollCollapse: true,
                   paging: false,
                   scrollX: true,

               } );


           }
       });


        }else{
            $('#MaterialOF').html('<option value="">Select</option>');
        }
    });

    $(document).on('change', '#MaterialOF', function(){

        var MaterialID=$(this).val();
        if(MaterialID){
            $.ajax({
              type:'POST',
              url:'select.php',
              data:{'GetQtyOF':MaterialID},
              success:function(result){
               document.getElementById("TotalQtyOF").value=result;
           }
       }); 

            $.ajax({
              type:'POST',
              url:'select.php',
              data:{'GetUnitOF':MaterialID},
              success:function(result){
               document.getElementById("UnitOF").value=result;
           }
       }); 

        }else{
            document.getElementById("TotalQtyOF").value=0;
        }
    });



    $(document).on('click', '.AddMaterial', function(){


        var MaterialID=document.getElementById("MaterialOF").value;
        var Modal=document.getElementById("ModalNameOF").value;
        Modal = Modal.replace(/\\/g, "/");

        var ModalNo=document.getElementById("ModalNoOF").value;
        ModalNo = ModalNo.replace(/\\/g, "/");

        var Qty=document.getElementById("QtyOF").value;
        var Rate=document.getElementById("RateOF").value;
        var GST=document.getElementById("GSTOF").value;
        var VendorID =document.getElementById("VendorOF").value;
        var inspection=$('input[name="inspection"]:checked').val();

        if (!MaterialID) {
            $("#MaterialOF").addClass('errorClass');
        }else if (!Modal) {
            $("#ModalNameOF").addClass('errorClass');
        }else if (!ModalNo) {
            $("#ModalNoOF").addClass('errorClass');
        }else if (!Rate) {
            $("#RateOF").addClass('errorClass');
        }else if (!GST) {
            $("#GSTOF").addClass('errorClass');
        }else if (!Qty) {
            $("#QtyOF").addClass('errorClass');
        }


        if (MaterialID) {
            $("#MaterialOF").removeClass('errorClass');
        }
        if (Modal) {
            $("#ModalNameOF").removeClass('errorClass');
        }
        if (Qty) {
            $("#QtyOF").removeClass('errorClass');
        }
        if (Rate) {
            $("#RateOF").removeClass('errorClass');
        }if (ModalNo) {
            $("#ModalNoOF").removeClass('errorClass');
        }if (GST) {
            $("#GSTOF").removeClass('errorClass');
        }



        if(MaterialID && Modal && Qty && Rate){

            if((Modal.indexOf("/") > -1)){
                err("Do not use forwardslash or backslash in Item name");
            }else if((ModalNo.indexOf("/") > -1)){
                err("Do not use forwardslash or backslash in ModalNo name");
            }else if(!inspection){
                err("Please select inspection option");
            } else{

              $.ajax({
                  type:'POST',
                  url:'insert.php',
                  data:{'MaterialIDOF':MaterialID, 'Modal':Modal, 'QtyOF':Qty, 'RateOF':Rate, 'inspection':inspection, 'VendorOF':VendorID, 'GSTOF':GST, 'ModalNoOF':ModalNo},
                  success:function(result){


                    if (result==1) {
                        $('#FM').trigger("reset");



                        $.ajax({
                          type:'POST',
                          url:'select.php',
                          data:{'MaterialdataOF':VendorID},
                          success:function(result){
                           $('.displayOF').DataTable().clear();
                           $('.displayOF').DataTable().destroy();
                           $('#MaterialdataOF').html(result);

                           $('table.displayOF').DataTable( {

                               scrollY: '200px',
                               scrollCollapse: true,
                               paging: false,
                               scrollX: true,

                           } );


                       }
                   });
                    //    
                        $.ajax({
                            type:'POST',
                            url:'select.php',
                            data:{'MaterialdataOF':VendorID},
                            success:function(result){
                                $('#MaterialdataOF').html(result);

                            }
                        });

                    }else{
                        err(result);
                    }
                }

            });
          }

      }else if (VarErr==0) {
        err("Please enter all fields");
    }

});

//
    $(document).on('click', '.DeleteMaterialOF', function(){

        var ID=$(this).attr("id");

        var VendorID=document.getElementById("VendorOF").value;
        if(ID && VendorID){
            $.ajax({
              type:'POST',
              url:'insert.php',
              data:{'DelOF':ID},
              success:function(result){

                if (result==1) {

                    $.ajax({
                      type:'POST',
                      url:'select.php',
                      data:{'MaterialdataOF':VendorID},
                      success:function(result){
                       $('.displayOF').DataTable().clear();
                       $('.displayOF').DataTable().destroy();
                       $('#MaterialdataOF').html(result);

                       $('table.displayOF').DataTable( {

                           scrollY: '200px',
                           scrollCollapse: true,
                           paging: false,
                           scrollX: true,

                       } );


                   }
               });

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