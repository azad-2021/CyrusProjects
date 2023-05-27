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


$(document).on('click', '.SaveConsignee', function(){

  var ConsigneeName=$("#AddConsigneeName").val();
  if (ConsigneeName) {
      $.ajax({
        url:"insert.php",
        method:"POST",
        data:{'ConsigneeName':ConsigneeName},
        success:function(result){
            if(result==1){
                Swal.fire({
                    title: 'success',
                    text: 'Consignee Added',
                    icon: 'success',
                });
                $('#AddConsignee').modal("hide");
                $("#AddConsigneeName").val(null);
            }else{
                err(result);
            }
        }
    });
  }
});


$(document).on('click', '.SaveDiv', function(){

  var OrgCode=document.getElementById("OrgCodeNDiv").value;
  var Division=document.getElementById("newdiv").value;
  var StateCode=$("#StateDiv").val();
  if (OrgCode && Division && StateCode) {
      $.ajax({
        url:"insert.php",
        method:"POST",
        data:{'NewDiv':Division, 'OrgCodeNDiv':OrgCode, 'StateCodeDiv':StateCode},
        success:function(result){
            if(result==1){
                Swal.fire({
                    title: 'success',
                    text: 'Division Created',
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

$(document).on('change', '#AMCIncluded', function(){

    if ($('#AMCIncluded').is(":checked")) {
        $("#amcd").removeClass("d-none");
    }else{
        $("#amcd").addClass("d-none");
    }

});



$(document).on('click', '.SaveOrder', function(){

    var AMCIncludedMonth=$("#AMCIncludedMonth").val();
    var file_data = $('#LOAFile').prop('files')[0];   
    var form_data = new FormData();                  
    form_data.append('file', file_data);

    var filename = file_data.name;
    var extension = filename.split('.').pop().toLowerCase();

    if(jQuery.inArray(extension,['pdf','']) == -1){
      err("Invalid file format");
  }else if($('#AMCIncluded').is(":checked") && !AMCIncludedMonth){
    err("Please enter all fields");
}else if(file_data){

    var PGType=$("#PGType").val();
    var ValidTillDate=$("#ValidTillDate").val();
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
    //alert(AMCIncludedMonth);
    if (DivisionCode && LOADate && Completion && BGAmount && BGDate && Warranty && OderingAuth && BillingAuth && Description && file_data && PGType && ValidTillDate) {
      $.ajax({
        url:"insert.php",
        method:"POST",
        data:{'DivisionCodeO':DivisionCode, 'LOADate':LOADate, 'Completion':Completion, 'BGAmount':BGAmount, 'BGDate':BGDate, 'Warranty':Warranty, 'OderingAuth':OderingAuth, 'BillingAuth':BillingAuth, 'LOANumber':LOANumber, 'Description':Description, 'AMCIncludedMonth':AMCIncludedMonth, PGType, 'ValidTillDate':ValidTillDate},
        success:function(result){
            //alert(result);

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
                text: 'Order ID : '+result,
                icon: 'success',
            });
            $('#FAddOrder').trigger("reset");
            $('#NewOrder').modal("hide");
            $("#amcd").addClass("d-none");

        }
    });
  }else{
    err("Please enter all fields");
}
}
});





$(document).on('click', '.AddSite', function(){

    var DivisionCode=document.getElementById("DivisionCodeSite").value;
    var SiteName=document.getElementById("SiteName").value;
    var SiteAddress=document.getElementById("SiteAddress").value;
    var Consignee=document.getElementById("Consignee").value;
    var DistrictCode=$("#DistrictSite").val();
    if(DivisionCode && SiteName && SiteAddress && Consignee && DistrictCode){
        $.ajax({
          type:'POST',
          url:'insert.php',
          data:{'DivisionCodeS':DivisionCode, 'SiteName':SiteName, 'SiteAddress':SiteAddress, 'Consignee':Consignee, 'DistrictCodeSite':DistrictCode},
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

            $.ajax({
              type:'POST',
              url:'select.php',
              data:{'GetDistrict':DivisionCode},
              success:function(result){
                $('#DistrictSite').html(result);
            }
        });

        }
    }); 
    }else{
        $('#DivisionCode').html('<option value="">Division</option>');
    }
});


$(document).on('change', '#StateSite', function(){

    var StateSite=$(this).val();
    if(StateSite){

        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'GetDistrict':StateSite},
          success:function(result){
            $('#DistrictSite').html(result);
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
/*
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'VendorEAV':OrderID},
          success:function(result){
            $('.VendorEAV').html(result);

        }
    }); 

*/
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

$(document).on('change', '#State', function(){

    var StateCode=$(this).val();
    if(StateCode){
        $.ajax({
          type:'POST',
          url:'select.php',
          data:{'StateCode':StateCode},
          success:function(result){
            $('#DistrictV').html(result);
        }
    }); 

    }else{
       $('#DistrictV').html('<option value="">District</option>');
   }
});


$( ".VendorType" ).change(function() {
  Type=$(this).val();
  if(Type=='New'){
    $("#EVendor").addClass('d-none');
    $("#NVendor").removeClass('d-none');
    
    document.getElementById("ContactAV").type="number";
    document.getElementById("AddressAV").disabled=false;
    document.getElementById("ContactAV").disabled=false;
    document.getElementById("EmailAV").disabled=false;
    document.getElementById("GSTNoAV").disabled=false;
}else if(Type=='Existing'){
    $("#NVendor").addClass('d-none');
    $("#EVendor").removeClass('d-none');
    
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
    var DistrictCode=$("#DistrictV").val();
    if(MaterialID && OrderID && Vendor && Contact && Email && Type && Address && GST && DistrictCode){
        $.ajax({
          type:'POST',
          url:'insert.php',
          data:{'MaterialIDAV':MaterialID, 'OrderIDAV':OrderID, 'VendorNameAV':Vendor, 'Contact':Contact, 'EmailAV':Email, 'AVType':Type, 'AddressAV':Address, 'GSTNoAV':GST, 'DistrictCodeV':DistrictCode},
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
/*
                $.ajax({
                  type:'POST',
                  url:'select.php',
                  data:{'VendorEAV':OrderID},
                  success:function(result){
                    $('.VendorEAV').html(result);

                }
            });     
            */
                $("select#VendorNameAVE").prop('selectedIndex', 0);
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
            $('#SiteCodeSurveyD').html(result);

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
                    $("select#MaterialSurvey").prop('selectedIndex', 0);
                    document.getElementById("QtySurvey").value=null;
                    document.getElementById("LeftQtySurve").value=null;
                    document.getElementById("UnitSiteSurvey").value=null;
                    document.getElementById("QtySurvey").max = null;
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

var PrevSiteCode;
$(document).on('change', '#SiteCodeSurvey', function(){

    var SiteCode=$(this).val();
    var OrderID= document.getElementById("OrderIDSurvey").value;
    if(SiteCode){
        Swal.fire({
            title: 'You want to change this site?',
            text: "If previous site has any survey and not saved yet, then it will be autosaved.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes'
        }).then((result) => {
            if (result.isConfirmed) {

                if (PrevSiteCode && OrderID) {
                    $.ajax({
                      type:'POST',
                      url:'insert.php',
                      data:{'SaveSurveyData':SiteCode, 'OrderIDSurvey':OrderID},
                      success:function(result){
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
                    }
                });
                }else{
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
                }
                PrevSiteCode=SiteCode;
            }else{

               $("select#SiteCodeSurvey").prop('selectedIndex', 0);
               $.ajax({
                  type:'POST',
                  url:'select.php',
                  data:{'SurveydataE':0},
                  success:function(result){

                    $('.Surveydisplay').DataTable().clear();
                    $('.Surveydisplay').DataTable().destroy();
                    $('#Surveydata').html(result);
                    $('table.Surveydisplay').DataTable();

                }
            });


           }
       })

    }else{
     $('.Surveydisplay').DataTable().clear();
     $('.Surveydisplay').DataTable().destroy();
 }
});

$(document).on('change', '#SiteCodeSurveyD', function(){

    var SiteCode=$(this).val();
    $.ajax({
      type:'POST',
      url:'select.php',
      data:{'SurveydataE':SiteCode, 'View':'View'},
      success:function(result){

        $('.Surveydisplay').DataTable().clear();
        $('.Surveydisplay').DataTable().destroy();
        $('#Surveydata').html(result);
        $('table.Surveydisplay').DataTable();

    }
});


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
    var OrderID= document.getElementById("OrderIDSurvey").value;
    if(SiteCode && OrderID){
        $.ajax({
          type:'POST',
          url:'insert.php',
          data:{'SaveSurveyData':SiteCode, 'OrderIDSurvey':OrderID},
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