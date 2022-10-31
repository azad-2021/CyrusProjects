<!-- modals -->
<div class="modal fade" data-bs-backdrop="static" id="NewOrg" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content rounded-corner">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">New Organization</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="form-control rounded-corner" id="FAddOrg">
                    <div class="lg-3">
                        <label for="recipient-name" class="col-form-label">Enter Organization Name</label>
                        <input type="text" class="form-control rounded-corner" id="neworg">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary SaveOrg">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" data-bs-backdrop="static" id="NewDivision" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content rounded-corner">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">New Division</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="form-control rounded-corner" id="FAddDiv">
                    <div class="lg-3">
                        <label for="recipient-name" class="col-form-label">Select Organization</label>
                        <select class="form-select form-control rounded-corner" id="OrgCodeNDiv">
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
                <div class="lg-3">
                    <label for="recipient-name" class="col-form-label">Enter Division Name</label>
                    <input type="text" class="form-control rounded-corner" id="newdiv">
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary SaveDiv">Save</button>
        </div>
    </div>
</div>
</div>

<div class="modal fade" data-easein="slideUpIn" id="NewOrder" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
        <div class="modal-content rounded-corner" data-tor="show(p):{rotateX.from(90) pull.down(half)} bounce perspective-self(4000px)">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">New Order</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="form-control rounded-corner" id="FAddOrder">
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
                        <label for="recipient-name" class="col-form-label">Select Division</label>
                        <select class="form-select form-control rounded-corner" id="DivisionCode">
                            <option value="">Select</option>
                        </select>
                    </div>
                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">LOA Date</label>
                        <input type="date" class="form-control rounded-corner" id="LOADate">
                    </div>
                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">Completion Date</label>
                        <input type="date" class="form-control rounded-corner" id="Completion">
                    </div>
                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">BG Amount</label>
                        <input type="number" min="0" class="form-control rounded-corner" id="BGAmount">
                    </div>
                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">BG Date</label>
                        <input type="date" class="form-control rounded-corner" id="BGDate">
                    </div>

                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">Warranty in months</label>
                        <input type="number" min="0" class="form-control rounded-corner" id="Warranty">
                    </div>
                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">Odering Authority</label>
                        <input type="text" maxlength="150" class="form-control rounded-corner" id="OderingAuth">
                    </div>
                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">Billing Authority</label>
                        <input type="text" maxlength="150" class="form-control rounded-corner" id="BillingAuth">
                    </div>

                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">LOA Number</label>
                        <input type="text" maxlength="200" class="form-control rounded-corner" id="LOANumber">
                    </div>
                    <div class="col-lg-6">
                        <label for="recipient-name" class="col-form-label">Description</label>
                        <textarea class="form-control rounded-corner" type="text" maxlength="750" id="Description"></textarea>
                    </div>
                    <center>
                        <div class="col-lg-4">
                            <label for="recipient-name" class="col-form-label">Upload LOA </label>
                            <i class="ri-file-upload-fill"></i>
                            <input type="file" class="form-control rounded-corner" id="LOAFile">
                        </div>
                    </center>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary SaveOrder">Save</button>
        </div>
    </div>
</div>
</div>


<div class="modal fade" id="NewSite" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content rounded-corner">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">New Site</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="form-control rounded-corner" style="margin-bottom: 50px;">
                    <div class="row">
                        <div class="col-lg-4">
                            <label for="recipient-name" class="col-form-label">Select Organization</label>
                            
                            <select class="form-control rounded-corner select2" id="OrgCodeSite">
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
                        <div class="col-lg-4">
                            <label for="recipient-name" class="col-form-label">Select Division</label>
                            <select class="form-select form-control rounded-corner" id="DivisionCodeSite">
                                <option value="">Select</option>

                            </select>
                        </div>
                        <div class="col-lg-4">
                            <label for="recipient-name" class="col-form-label">Site Name</label>
                            <input type="text" class="form-control rounded-corner" id="SiteName">
                        </div>
                        <div class="col-lg-6">
                            <label for="recipient-name" class="col-form-label">Address</label>
                            <textarea class="form-control rounded-corner" type="text" maxlength="180" id="SiteAddress"></textarea>
                        </div>
                        <div class="col-lg-4" style="margin-top: 10px;">
                            <label for="recipient-name" class="col-form-label">Consignee</label>
                            <input type="text" maxlength="130" class="form-control rounded-corner" id="Consignee">
                        </div>

                        <div class="col-lg-2" style="margin-top: 50px;">
                            <button type="button" class="bt btn-lg btn-primary AddSite">Add</button>
                        </div>

                    </div>
                </form>

                <table class="table table-responsive table-centered table-hover table-bordered border-primary sitedisplay" style="margin-top:45px" width="100%">
                    <thead>
                        <th width="25%">Site Name</th>
                        <th width="25%">Address</th>
                        <th width="25%">Consignee</th>
                        <th width="25%">Action</th>
                    </thead>
                    <tbody id="Sitedata">

                    </tbody>
                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                
            </div>
        </div>
    </div>
</div>


<div class="modal fade" data-bs-backdrop="static" id="NewDesignation" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content rounded-corner">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">New Designation</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="form-control rounded-corner" id="FNewDesignation">
                    <div class="lg-3">
                        <label for="recipient-name" class="col-form-label">Enter Designation Name</label>
                        <input type="text" class="form-control rounded-corner" id="DesignationName">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary NewDesignation">Save</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="NewEmployee" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
        <div class="modal-content rounded-corner">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel" align="center">New Employee</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="form-control rounded-corner" style="margin-bottom: 50px;" id="EmployeeF">
                    <div class="row">
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Employee Name</label>
                            <input type="text" class="form-control rounded-corner" id="EmployeeName">
                        </div>
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Designation</label>
                            
                            <select class="form-control rounded-corner" id="DesignationCode">
                                <option value="">Select</option>
                                <?php
                                $query="SELECT * FROM cyrusproject.designation";
                                $result=mysqli_query($con,$query);
                                if (mysqli_num_rows($result)>0)
                                {
                                  while ($arr=mysqli_fetch_assoc($result))
                                  {
                                    ?>
                                    <option value="<?php echo $arr['DesignationID']; ?>"><?php echo $arr['Designation']; ?></option>
                                    <?php
                                }}?>
                            </select>
                        </div>
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Contact Number</label>
                            <input type="number" max=9999999999 class="form-control rounded-corner" id="EmployeeContact">
                        </div>
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Email</label>
                            <input type="email" class="form-control rounded-corner" id="EmployeeEmail">
                        </div>
                        <center>
                        <div class="col-lg-4">
                            <label for="recipient-name" class="col-form-label">Address</label>
                            <textarea type="text" class="form-control rounded-corner" id="EmployeeAddress"></textarea>
                        </div>
                    </center>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary SaveEmployee" data-bs-dismiss="modal">Save</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="SiteSurvey" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
        <div class="modal-content rounded-corner">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Site Survey</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="form-control rounded-corner" style="margin-bottom: 50px;" id="SurveyF">
                    <div class="row">
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Organization</label>

                            <select class="form-control rounded-corner" id="OrgCodeSurvey">
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
                            <select class="form-select form-control rounded-corner" id="DivisionCodeSurvey">
                                <option value="">Select</option>

                            </select>
                        </div>
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Site</label>
                            <select class="form-select form-control rounded-corner" id="SiteCodeSurvey">
                                <option value="">Select</option>

                            </select>
                        </div>

                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Order ID</label>
                            <select class="form-select form-control rounded-corner" id="OrderIDSurvey">
                                <option value="">Select</option>

                            </select>
                        </div>

                        <div class="col-lg-4">
                            <label for="recipient-name" class="col-form-label">Select Material</label>
                            <select class="form-select form-control rounded-corner2" id="MaterialSurvey">
                                <option value="">Select</option>

                            </select>
                        </div>
                        <div class="col-lg-2">
                            <label for="recipient-name" class="col-form-label">Quantity</label>
                            <input type="number" class="form-control rounded-corner" name="Qty" id="QtySurvey" min=1 onkeydown="limit(this);" onkeyup="limit(this);">
                        </div>
                        <div class="col-lg-2">
                            <label for="recipient-name" class="col-form-label">Left Quantity</label>
                            <input type="text" class="form-control rounded-corner" name="Unit" id="LeftQtySurve" disabled>
                        </div>          
                        <div class="col-lg-2">
                            <label for="recipient-name" class="col-form-label">Unit</label>
                            <input type="text" class="form-control rounded-corner" name="Unit" id="UnitSiteSurvey" disabled>
                        </div>

                        <div class="col-lg-2" style="margin-top: 35px;">
                            <button type="button" class="bt btn-lg btn-primary AddSiteSurvey">Add</button>
                        </div>

                    </div>
                </form>

                <table class="table table-responsive table-centered table-hover table-bordered border-primary Surveydisplay" style="margin-top:45px" width="100%">
                    <thead>
                        <th width="65%">Material Name</th>
                        <th width="5%">Quantity</th>
                        <th width="5%">Action</th>
                    </thead>
                    <tbody id="Surveydata">

                    </tbody>
                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary SaveSurveyData" data-bs-dismiss="modal">Save</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="Accessing" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
        <div class="modal-content rounded-corner">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Accessing Vendor</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="form-control rounded-corner" style="margin-bottom: 50px;">
                    <div class="row">
                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Organization</label>

                            <select class="form-control rounded-corner select2" id="OrgCodeAV">
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
                            <select class="form-select form-control rounded-corner" id="DivisionCodeAV">
                                <option value="">Select</option>

                            </select>
                        </div>

                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Order ID</label>
                            <select class="form-select form-control rounded-corner" id="OrderIDAV">
                                <option value="">Select</option>

                            </select>
                        </div>

                        <div class="col-lg-3">
                            <label for="recipient-name" class="col-form-label">Select Material</label>
                            <select class="form-select form-control rounded-corner2" id="MaterialAV">
                                <option value="">Select</option>

                            </select>
                        </div>
                        <center>
                            <div class="form-check form-check-inline" style="margin-top:20px;">
                              <input class="form-check-input VendorType" type="radio" name="VendorType" id="VendorType" value="New">
                              <label class="form-check-label" for="inlineRadio1">New</label>
                          </div>
                          <div class="form-check form-check-inline">
                              <input class="form-check-input VendorType" type="radio" name="VendorType" id="VendorType" value="Existing">
                              <label class="form-check-label" for="inlineRadio2">Existing</label>
                          </div>
                      </center>
                      <div class="col-lg-3 d-none" id="EVendor">
                        <label for="recipient-name" class="col-form-label">Select Vendor</label>
                        <select class="form-select form-control rounded-corner VendorEAV" id="VendorNameAVE">
                            <option value="">Select</option>
                        </select>
                    </div>
                    <div class="col-lg-3" id="NVendor">
                        <label for="recipient-name" class="col-form-label">Name</label>
                        <input type="text" class="form-control rounded-corner" name="VendorNameAV" id="VendorNameAVN">
                    </div> 
                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">Address</label>
                        <input type="text" class="form-control rounded-corner" name="VendorNameAV" id="AddressAV">
                    </div>  

                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">Contact Number</label>
                        <input type="number" class="form-control rounded-corner" name="ContactAV" id="ContactAV">
                    </div>
                    <div class="col-lg-3">
                        <label for="recipient-name" class="col-form-label">Email</label>
                        <input type="email" class="form-control rounded-corner" name="EmailAV" id="EmailAV">
                    </div>

                </div>
                <center>
                    <div class="col-lg-4">
                        <label for="recipient-name" class="col-form-label">GST No.</label>
                        <input type="text" class="form-control rounded-corner" name="VendorNameAV" id="GSTNoAV">
                    </div>  
                    <div class="col-lg-4" style="margin-top: 35px;">
                        <button type="button" class="bt btn-lg btn-primary AddVendor">Add</button>
                    </div>
                </center>
            </form>

            <table class="table table-responsive table-centered table-hover table-bordered border-primary avdisplay" style="margin-top:45px" width="100%">
                <thead>
                    <th width="20%">Vendor Name</th>
                    <th width="20%">Address</th>
                    <th width="15%">Contact</th>
                    <th width="15%">Email</th>
                    <th width="15%">GST No</th>
                    <th width="15%">Action</th>
                </thead>
                <tbody id="VendorDataAV">

                </tbody>
            </table>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

        </div>
    </div>
</div>
</div>


