$(function() {
"use strict";

 var s_id = $('#s_id').val();
 var p_id = $('#p_id').val();
 
   
    


 function get_save_api() {

             $.ajax({
                      url:base_url+'Payment_system/get_api',
                      type : 'GET',
                      cache : false,
                      success: function(data){
                       $.each(JSON.parse(data), function(key, val){
                         if (val.api_name =='Stripe') {
                            $('#s_id').val(val.id);
                            $('input[name=api_secret_key]').val(val.api_secret_key);
                            $('input[name=publishable_key]').val(val.publishable_key);
                         }

                         if (val.api_name =='Paypal') {
                            $('#p_id').val(val.id);
                            $('input[name=clinet_id]').val(val.api_clinet_id);
                            $('input[name=secret_key]').val(val.api_secret_key); 
                         }
                        
                       });

                      },

                error: function (jqXHR, status, err) {
                 console.log(jqXHR);
                  console.log(status);
                  console.log(err);
              
          
                        }  
                   
                     });

   
 }
 
     get_save_api();



   $(".api_sub").on('click',function(e){
           e.preventDefault();
          var error = 0;

 var s_api_secret_key = $('input[name=api_secret_key]').val();
 var publishable_key = $('input[name=publishable_key]').val();
 var clinet_id = $('input[name=clinet_id]').val();
 var secret_key = $('input[name=secret_key]').val();

        var step = $(this).val();
        var add_api_form = $("#add_api_form");
        var add_api_form2 = $("#add_api_form2");
        var data = add_api_form.serialize();
        var data2 = add_api_form2.serialize();
 
            
        if (step == 'Stripe') {
           if(s_api_secret_key == '') {
            error = 1;
            var cl1 = "#name_err_msg_ss";
            var cl2 = "#name_err_msg_container_ss";
            $(cl1).text("Enter Secret Key");
            $(cl2).show(200).delay(6000).hide(200,function(){
            });
           
      } else {
      } 
      if(publishable_key == '') {
      error = 1;
            var cl1 = "#name_err_msg_sp";
            var cl2 = "#name_err_msg_container_sp";
            $(cl1).text("Enter Publishable Key");
            $(cl2).show(200).delay(6000).hide(200,function(){
            });
           
      } else {
       } 
        if (error == 0) {ins_api_save(data,step,p_id);}

       }

        if (step == 'Paypal') {

           if(clinet_id == '') {
      error = 1;
            var cl1 = "#name_err_msg_pc";
            var cl2 = "#name_err_msg_container_pc";
            $(cl1).text("Enter clinet_id");
            $(cl2).show(200).delay(6000).hide(200,function(){
            });
            
      } else {
      } 

       if(secret_key == '') {
      error = 1;
            var cl1 = "#name_err_msg_ps";
            var cl2 = "#name_err_msg_container_ps";
            $(cl1).text("Enter Secret Key");
            $(cl2).show(200).delay(6000).hide(200,function(){
            });
          
      } else {
      } 

       if (error== 0) { ins_api_save(data2,step,s_id); }

         



        }     


 
   })

/////////////////////////////////////////////////////////////////////////////////////////////
 function ins_api_save(api_data,step,id) {
 
              $.ajax({
                      url:base_url+'Payment_system/ins_api',
                      data :api_data+'&'+$.param({ 'step': step}),
                      type : 'POST',
                      cache : false,
                      success: function(data){
                           var all = JSON.parse(data)
                       if (data) {

                       $('#done_msg').html('<div class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><p><i class="icon fa fa-check"></i>'+all.message+'</p></div>');
                       $('html, body').scrollTop(0);

                           get_save_api();
                           setTimeout(function(){ $('#done_msg').html(''); }, 2000);
                        }

                        
                      },

                error: function (jqXHR, status, err) {
                 console.log(jqXHR);
                  console.log(status);
                  console.log(err);
              
          
                        }  
                   
                     });


 }


})