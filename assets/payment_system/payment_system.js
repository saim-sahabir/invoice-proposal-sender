$(function() {
"use strict";

 $('body').on('change','#payment_status',function(){
    var pay_type =$("#payment_status").val(); 
    if(pay_type =='Paid')  {
       $("#make_payment").html('<div class="col-md-4" style="float: right; margin-top: 12px;"><div class="form-group"></div><input id="seccus_msg" name="payment_method" type="hidden" value=""/><a class="btn btn-primary" id="pay_select_button" style="width:100%; background-color: #3F6AD8;">Make Payment</a><div class="alert alert-error modal_error " id="name_err_msg_container_sucess_m" style="padding: 5px !important;"><p id="name_err_msg_sucess_m"></p></div></div>');

    }else{
     $("#make_payment").html('');
    }
  });


$('body').on('click', '#pay_select_button',function(e){

 
$('#open_pay_select').modal('show');
    get_save_api() 


});

$('body').on('click', '.click_op_pay',function(e){
  var pay_c  = $(this).children('h4').text();

   if (pay_c =="Cash On Delivery") {
      $('#seccus_msg').val(pay_c);
       var pay = $('#pay_select_button');
       pay.css({'background-color':'#1eb16d','pointer-events': 'none','cursor': 'default'});
       pay.html('<p style="margin-bottom: 1px;">Paid With '+pay_c+'   <i class="fa fa-check-circle"></i></p>')
        $('.close').click();

   }
   if (pay_c =="Stripe") {
   	
   }

});



function get_save_api() {

             $.ajax({
                      url:base_url+'Payment_system/get_api',
                      type : 'GET',
                      cache : false,
                      success: function(data){
                        var ss =JSON.parse(data);
                        // if (val.api_name =='Stripe') {
                           // $('#s_id').val(val.id);
                            //$('input[name=api_secret_key]').val(val.api_secret_key);
                            //$('input[name=publishable_key]').val(val.publishable_key);
                        // }
                        var d = '';
                      for (var i = 0; i < ss.length; i++) {
                          d +='<div class="pay_se"><a href="javascript:void(0)" class="click_op_pay"><h4 style="text-align: center;">'+ss[i].api_name+'</h4></a></div>';
                     
                      }
                     $('.pay_op').html(d);
                         
                          

                         //if (val.api_name =='Paypal') {
                           // $('#p_id').val(val.id);
                           // $('input[name=clinet_id]').val(val.api_clinet_id);
                           // $('input[name=secret_key]').val(val.api_secret_key); 
                         //}
                        
                       

                      },

                error: function (jqXHR, status, err) {
                 console.log(jqXHR);
                  console.log(status);
                  console.log(err);
              
          
                        }  
                   
                     });

   
 }

});