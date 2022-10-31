<?php 
include"connection.php";
include"session.php";
include"query.php";

$UserID=1;
date_default_timezone_set('Asia/Calcutta');
$timestamp =date('y-m-d H:i:s');
$Date = date('Y-m-d',strtotime($timestamp));



$OfferID=$_GET['offerid'];
$Qty=$_GET['Qty'];
$Rate=$_GET['Offerrate'];
$VendorID=$_GET['VendorPO'];


$query="SELECT * FROM cyrusproject.offers
join `offer terms` on offers.TermID=`offer terms`.TermID
WHERE OfferID=$OfferID[0]";
$result=mysqli_query($con,$query);
$row=mysqli_fetch_assoc($result);
$Payment=$row["PaymentTerms"];
$Warranty=$row["WarrantyTerms"];
$Delivery=$row["DeliveryTerms"];
$OrderID=$row["OrderID"];

$ShippedTo="Cyrus House
B44/69 Sector Q
Aliganj, Lucknow -24
Phone (0522) 4026916, 2746916";

$query="SELECT * FROM cyrusproject.vendors WHERE VendorID=$VendorID";
$result=mysqli_query($con,$query);
$row=mysqli_fetch_assoc($result);
$VendorName=$row["VendorName"];
$VAddress=$row["Address"];
$Mobile=$row["Contact"];
$Email=$row["Email"];
$GSTNo=$row["GSTNo"];

$VDetails=$VendorName.', '.$VAddress.'
'.$GSTNo.', '.$Mobile.', '.$Email;


if (isset($_POST['submit'])) {
    $errors='';
    $VendorID=$_POST['VendorOFH'];
    $PaymentTerm=$_POST['Payment'];
    $DeliveryTerm=$_POST['Delivery'];
    $WarrantyTerm=$_POST['Warranty'];

}
?>

<!doctype html>
    <html lang="en">

    <head>

        <meta charset="utf-8" />
        <title>Place PO</title>
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
                                <h4 class="mb-0">Generate PO</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Cyrus</a></li>
                                        <li class="breadcrumb-item active">Generate PO</li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <form class="form-control rounded-corner" action = "" method = "POST" >

                        <div class="row" style="margin-bottom: 30px;">
                            <div class="col-lg-6">
                                <textarea type="text" class="form-control rounded-corner2" name="BilledTo" placeholder="Billed To" disabled><?php echo $VDetails; ?></textarea>
                            </div>
                            <div class="col-lg-6">
                                <textarea type="text" class="form-control rounded-corner" name="Shipping" id="Shipping" placeholder="Shipping Address" required><?php echo $ShippedTo; ?></textarea>
                            </div>
                            <br>
                            <div class="col-lg-3">
                                <label>Payment Terms</label>
                                <textarea type="text" class="form-control rounded-corner" name="Payment" id="Payment" required><?php echo $Payment; ?></textarea>
                            </div>
                            <div class="col-lg-3">
                                <label>Warranty Terms</label>
                                <textarea type="text" class="form-control rounded-corner" name="Warranty" id="WarrantyGenPO" required><?php echo $Warranty; ?></textarea>
                            </div>

                            <div class="col-lg-3">
                                <label>Delivery Terms</label>
                                <textarea type="text" class="form-control rounded-corner" name="Delivery" id="Delivery" required><?php echo $Delivery; ?></textarea>
                            </div>
                            <div class="col-lg-3">
                                <label>Other Terms</label>
                                <textarea type="text" class="form-control rounded-corner" name="Other" id="Other"></textarea>
                            </div>

                        </div>


                        <div class="table-responsive">
                            <table class="table table-centered table-hover table-bordered border-primary  displayPO" style="margin-top: 30px;" width="100%">
                                <thead>

                                    <th style="min-width: 200px">Modal Name</th>
                                    <th style="min-width: 70px">Offer Rate</th>
                                    <th style="min-width: 100px">Placed Quantity</th>
                                </thead>
                                <tbody>
                                    <?php 
                                    
                                    for ($i=0; $i < count($OfferID); $i++) { 
                                        $query="SELECT * FROM cyrusproject.offers WHERE OfferID=$OfferID[$i]";
                                        $result=mysqli_query($con,$query);
                                        $row=mysqli_fetch_assoc($result);

                                        print "<tr>";
                                        print '<td>'.$row["ItemName"]."</td>";
                                        print '<td>'.$row["OfferRate"]."</td>";
                                        print '<td>'.$Qty[$i].' '.$row["Unit"]."</td>";
                                        print '</tr>';
                                    }

                                    ?>
                                </tbody>
                            </table>
                        </div>

                        <center>
                            <button type="button" class="btn btn-lg btn-primary GeneratePO" name="submit" style="margin-top: 20px; margin-bottom: 20px;">Place PO</button>
                        </center> 

                    </form>



                </div><!-- end col -->

            </div><!-- end col -->

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


    $(document).ready(function () {
        $('table.displayPO').DataTable({

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


    var OrderID=<?php echo $OrderID ?>;
    var OfferID=<?php print_r(json_encode($OfferID)) ?>;
    var POQty=<?php print_r(json_encode($Qty)) ?>;
    $(document).on('click', '.GeneratePO', function(){

        var Shipping=document.getElementById("Shipping").value;
        var Payment=document.getElementById("Payment").value;
        var Warranty=document.getElementById("WarrantyGenPO").value;
        var Delivery=document.getElementById("Delivery").value;
        var Other=document.getElementById("Other").value;
        
        alert(Warranty+' '+Delivery);
        if(Shipping && Payment && Warranty && Delivery){
            $.ajax({
              type:'POST',
              url:'insert.php',
              data:{'Shipping':Shipping, 'Payment':Payment, 'Warranty':Warranty, 'Delivery':Delivery, 'Other':Other, 'POQty':POQty, 'OrderIDGenPO':OrderID, 'OfferIDGenPO':OfferID},
              success:function(result){

                if (result==1) {
                    window.open('printpo.php', '_blank').focus();
                    window.location.reload();
                }else{
                    err(result);
                }

            }
        });

        }else{
            err("Please enter all fields");
        }
    });
</script>
</body>

</html>