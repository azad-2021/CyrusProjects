<?php 
include"connection.php";
include"session.php";
include"query.php";

date_default_timezone_set('Asia/Calcutta');
$timestamp =date('y-m-d H:i:s');
$Date = date('Y-m-d',strtotime($timestamp));
$m=date('m',strtotime($timestamp));
$y=date('y',strtotime($timestamp));
$EmployeeCode=$_SESSION['userid'];


if (isset($_POST['submit'])) {

    if (count($_POST['SiteCodeO'])>0) {

        $SiteCode=$_POST['SiteCodeO'];
        $DivisionCodeO=!empty($_POST['Division'])?$_POST['Division']:'';
        $LOADate=!empty($_POST['LOADate'])?$_POST['LOADate']:'';

        $Completion=!empty($_POST['Completion'])?$_POST['Completion']:'';
        $BGAmount=!empty($_POST['BGAmount'])?$_POST['BGAmount']:'';
        $BGDate=!empty($_POST['BGDate'])?$_POST['BGDate']:'';
        $Warranty=!empty($_POST['Warranty'])?$_POST['Warranty']:'';
        $OderingAuth=!empty($_POST['OderingAuth'])?$_POST['OderingAuth']:'';
        $BillingAuth=!empty($_POST['BillingAuth'])?$_POST['BillingAuth']:'';
        $LOANumber=!empty($_POST['LOANumber'])?$_POST['LOANumber']:'';
        $Description=!empty($_POST['Description'])?$_POST['Description']:'';
        $PGType=!empty($_POST['PGType'])?$_POST['PGType']:'';
        $AMCIncludedMonth=!empty($_POST['AMCIncludedMonth'])?$_POST['AMCIncludedMonth']:'';
        $ValidTillDate=!empty($_POST['ValidTillDate'])?$_POST['ValidTillDate']:'';

        if (!empty($AMCIncludedMonth)) {
            $sql = "INSERT INTO $orders (DivisionCode, Description, OrderNo, OrderDate, CompletionDate, PGAmount, PGDate, Warranty, OrderingAuth, BillingAuth, PGTypeID, AMCIncluded, AMCPeriod, PGValidDate)
            VALUES ($DivisionCodeO, '$Description', '$LOANumber', '$LOADate', '$Completion', $BGAmount, '$BGDate', $Warranty, '$OderingAuth', '$BillingAuth', $PGType, 1, $AMCIncludedMonth, '$ValidTillDate')";
        }else{

            $sql = "INSERT INTO orders (DivisionCode, Description, OrderNo, OrderDate, CompletionDate, PGAmount, PGDate, Warranty, OrderingAuth, BillingAuth, PGTypeID, PGValidDate)
            VALUES ($DivisionCodeO, '$Description', '$LOANumber', '$LOADate', '$Completion', $BGAmount, '$BGDate', $Warranty, '$OderingAuth', '$BillingAuth', $PGType, '$ValidTillDate')";
        }
        if ($con->query($sql) === TRUE) {

            $OrderID=$con->insert_id;

            $file_name = $_FILES['LOAFile']['name'];

            $file_size =$_FILES['LOAFile']['size'];
            $file_tmp =$_FILES['LOAFile']['tmp_name'];
            $file_type=$_FILES['LOAFile']['type'];
            $tmp = explode('.', $_FILES['LOAFile']['name']);
            $file_ext = strtolower(end($tmp));    
            $newfilename=$OrderID.'.'.$file_ext;         
            move_uploaded_file($file_tmp, 'LOA/' . $newfilename);

            $sql2 = "INSERT INTO $demands (OrderID, OrderDate, StatusID)
            VALUES ($OrderID, '$Date', 1)";

            if ($con->query($sql2) === TRUE) {

                for ($i=0; $i < count($SiteCode); $i++) { 

                    $sql3 = "INSERT INTO siteorders (DivisionOrderID, DivisionCode, SiteCode)
                    VALUES ($OrderID, $DivisionCodeO, $SiteCode[$i])";
                    if ($con->query($sql3) === TRUE) {


                    }else {
                        echo "Error: " . $sql3 . "<br>" . $con->error;
                    }


                }

            } else {
                echo "Error: " . $sql2 . "<br>" . $con->error;
            }

        } else {
            echo "Error: " . $sql . "<br>";
        }

        header("location:index.php");

    }else{
        echo '<script>alert("No Site Selected")</script>';
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>New Order</title>
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
                            <h4 class="mb-0">New Order</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <form class="form-control rounded-corner" method="POST" action="" id="FAddOrder" enctype = "multipart/form-data">
                    <div class="row">
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Organization</label>
                            <select class="form-select form-control rounded-corner" id="OrgCode">
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
                                }
                            }
                            ?>
                        </select>
                    </div>
                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">Select Zone / Division</label>
                        <select class="form-select form-control rounded-corner" id="DivisionCode" name="Division" required>
                            <option value="">Select</option>
                        </select>
                    </div>
                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">Order Date</label>
                        <input type="date" class="form-control rounded-corner" name="LOADate" id="LOADate" required>
                    </div>
                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">Completion Date</label>
                        <input type="date" class="form-control rounded-corner" name="Completion" id="Completion" required>
                    </div>
                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">Performance Guarantee Amount</label>
                        <input type="number" min="0" class="form-control rounded-corner" name="BGAmount" required>
                    </div>
                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">Performance Guarantee Type</label>
                        <select class="form-select form-control rounded-corner" name="PGType" required>
                            <option value="">Select</option>
                            <?php
                            $query="SELECT * FROM pgtype Order By PGType";
                            $result=mysqli_query($con,$query);
                            if (mysqli_num_rows($result)>0)
                            {
                              while ($arr=mysqli_fetch_assoc($result))
                              {
                                ?>
                                <option value="<?php echo $arr['PGTypeID']; ?>"><?php echo $arr['PGType']; ?></option>
                                <?php
                            }
                        }
                        ?>
                    </select>
                </div>
                <div class="col-lg-3">
                    <label for="recipient-name" class="col-form-label">Issue Date</label>
                    <input type="date" class="form-control rounded-corner" id="BGDate" name="BGDate" required>
                </div>
                <div class="col-lg-3">
                    <label for="recipient-name" class="col-form-label">Valid Till Date</label>
                    <input type="date" class="form-control rounded-corner" name="ValidTillDate" required>
                </div>
                <div class="col-lg-3">
                    <label for="recipient-name" class="col-form-label">Warranty in months</label>
                    <input type="number" min="0" class="form-control rounded-corner" name="Warranty" required>
                </div>
                <div class="col-lg-3">
                    <label for="recipient-name" class="col-form-label">Ordering Authority</label>
                    <input type="text" maxlength="150" class="form-control rounded-corner" name="OderingAuth" required>
                </div>
                <div class="col-lg-3">
                    <label for="recipient-name" class="col-form-label">Billing Authority</label>
                    <input type="text" maxlength="150" class="form-control rounded-corner" name="BillingAuth" required>
                </div>

                <div class="col-lg-3">
                    <label for="recipient-name" class="col-form-label">Order Number</label>
                    <input type="text" maxlength="200" class="form-control rounded-corner" name="LOANumber" required>
                </div>
                <center>
                    <div class="col-lg-3" style="margin-top: 20px; margin-left:20px;">
                        <div class="form-check">
                          <input class="form-check-input" style="margin-left:50px;" type="checkbox" value="1" name="AMCIncluded" id="AMCIncluded">
                          <label style="margin-left:5px;" class="form-check-label" for="flexCheckDefault">
                            AMC Included
                        </label>
                    </div>
                </div>

                <div class="col-lg-3 d-none" id="amcd">
                    <label for="recipient-name" class="col-form-label">AMC Duration in months</label>
                    <input type="number" min="0" class="form-control rounded-corner" id="AMCIncludedMonth">
                </div>

            </center>
            <div class="col-lg-12">
                <label for="recipient-name" class="col-form-label">Description</label>
                <textarea class="form-control rounded-corner" type="text" maxlength="1000" name="Description" required></textarea>
            </div>
            <center>
                <div class="col-lg-4">
                    <label for="recipient-name" class="col-form-label">Upload Order </label>
                    <i class="ri-file-upload-fill"></i>
                    <input type="file" class="form-control rounded-corner" name="LOAFile" required>
                </div>
            </center>
        </div>

        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="" class="table table-hover table-centered table-bordered border-primary sitedisplay" style="width:100%">
                                <h4 style="margin-top:10px;">Select Site</h4>
                                <thead class="thead-light">
                                    <tr>
                                        <th style="min-width:70px;">Site</th>
                                        <th style="min-width:100px;">Address</th>
                                        <th style="min-width:50px;">District</th>
                                        <th style="min-width:60px;">Select</th>
                                    </tr>
                                </thead>

                                <tbody id="SiteO">


                                </tbody>
                            </table>
                        </div>  
                        <button type="submit" name="submit" class="btn btn-primary">Save</button>          
                    </form>
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


    function err(msg){
        Swal.fire({
            title: 'error!',
            text: msg,
            icon: 'error',

        })
    }


</script>
</body>

</html>