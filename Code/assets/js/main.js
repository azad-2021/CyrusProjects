 $(document).on({
  ajaxStart: function(){
    $("body").addClass("loading"); 
},
ajaxStop: function(){ 
    $("body").removeClass("loading"); 
}    
});

 function err(msg){
    Swal.fire({
        title: 'error!',
        text: msg,
        icon: 'error',

    })
}

function success(msg){
    Swal.fire({
        title: 'success',
        text: msg,
        icon: 'success',

    })
}

function limit(element)
{
    var max_chars = 10;

    if(element.value.length > max_chars) {
        element.value = element.value.substr(0, max_chars);
    }
}
