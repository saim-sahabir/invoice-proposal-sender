$(function() {
"use strict";


     $(".from_sub").on('click',function(e){
         e.preventDefault();
         var step = $(this).val();
         var type = $('#type').val();
         var date = $('input[name=date]').val(); 
         var customer_id = $('#customer_id').val();
         var proposal_no = $('#proposal_no').val();
         var title = $('input[name=title]').val();
         var product_service_id = $('input[name=grand_total]').val();
         var s_in_pa = $('#payment_status').val();
         var error = 0;
         
          if (type=='Invoice') {

            if (s_in_pa == '') {
               error = 1;
            var cl1 = "#name_err_msg_pays";
            var cl2 = "#name_err_msg_container_pays";
            $(cl1).text("Select payment status");
            $(cl2).show().delay(6000).hide(0,function(){
            });
            
            } 



            var sucess_m = $('#seccus_msg').val();
            if (sucess_m =='') {
               error = 1;
            var cl1 = "#name_err_msg_sucess_m";
            var cl2 = "#name_err_msg_container_sucess_m";
            $(cl1).text("Select payment method");
            $(cl2).show().delay(6000).hide(0,function(){
            });
            
      } 
       

            }
          
         
      if(proposal_no == '') {
      error = 1;
            var cl1 = "#name_err_msg_p";
            var cl2 = "#name_err_msg_container_p";
            $(cl1).text("Select a type");
            $(cl2).show().delay(6000).hide(0,function(){
            });
            $('html, body').scrollTop(0);
      } else {
      } 


    if(date == '') {
      error = 1;
            var cl1 = "#name_err_msg2";
            var cl2 = "#name_err_msg_container2";
            $(cl1).text("Select Date");
            $(cl2).show().delay(6000).hide(0,function(){
            });
            $('html, body').scrollTop(0);
    } else {
      $('input[name=date]').css('border', '1px solid #ccc');
    } 

    if(customer_id == '') {
      error = 1;
            var cl1 = "#name_err_msg3";
            var cl2 = "#name_err_msg_container3";
            $(cl1).text("Select a Customer");
            $(cl2).show().delay(6000).hide(0,function(){
            });
            $('html, body').scrollTop(0);
    } else {

    } 

    if(title == '') {
      error = 1;
            var cl1 = "#name_err_msg4";
            var cl2 = "#name_err_msg_container4";
            $(cl1).text("Enter a Title");
            $(cl2).show().delay(6000).hide(0,function(){
            });
            $('html, body').scrollTop(0);
    } else {
      $('input[name=title]').css('border', '1px solid #ccc');
    }

   if(product_service_id == 0.00 || product_service_id == 0) {
      error = 1;
            var cl1 = "#name_err_msg5";
            var cl2 = "#name_err_msg_container5";
            $(cl1).text("Select a product service");
            $(cl2).show().delay(6000).hide(0,function(){
            });
            $('html, body').scrollTop(0);
    } else {
      
    }

    var req_type = { btn_step:step, p_type:type };

    if (error == 0) {
     saveProposalInvoice(req_type);

    }

});

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

     function saveProposalInvoice(req_type){
         var step = req_type.btn_step;
         var r_type = req_type.p_type;                         
         var csrf_token = $('#csrf_value_').val();
         var proposal_form = $("#proposal_form");
         var data = proposal_form.serialize();
          if (step=='download'){$('.loader').css('display','block');}
         
   
      $.ajax({
        url         : proposal_form.attr('action'),
        data        : data,
        cache       : false,
        type        : 'POST',
        dataType    : "json",
        headers     : {
        csrf_test_name:csrf_token
        },
      success:function(data){
           var last_id = data.ins_proposal_id;
           if (data) {
                if (step=='email') {generatePdfEmail(last_id, step, r_type);}
                if (step=='save') {generatePdfSave(last_id, step);}
                if (step=='download') {generatePdfDowload(last_id, step, r_type);}
                if (step=='preview') {generatePdfPreview(last_id, step, r_type);}
                     }
         $('.loader').delay(3000).hide(200,function(){});     
                   },

      error: function (jqXHR, status, err) {
         $('.loader').delay(3000).hide(200,function(){});
          console.log('its work error');
      }
      });
      }

 //////////////////////////////////////////////////////////////////////////////////////////////////
       function generatePdfDowload(last_id, step, r_type){

            $('#proposal_form').trigger('reset');

                $.ajax({
                      url:base_url+'Proposal/downloadProposal',
                      data : {last_id:last_id, step:step, r_type:r_type},
                      type : 'GET',
                      cache : false,
                      success: function(data){
                      data=JSON.parse(data);
                       if (data) {
                          var link = document.createElement('a');
                          link.href = data.file;
                          link.download = data.file;
                          link.click();
                          link.remove()

                       $('#done_msg').html('<div class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><p><i class="icon fa fa-check"></i>Save and Download Success!</p></div>');
                       $('html, body').scrollTop(0);  
                        }
                        
                      },

                error: function (jqXHR, status, err) {
                 console.log(jqXHR);
                  console.log(status);
                  console.log(err);
              
          
                        }  
                   
                     });

                     }
///////////////////////////////////////////////////////////////////////////////////////////////////

 function generatePdfPreview(last_id ,step, r_type){

                $.ajax({
                      url:base_url+'Proposal/downloadProposal',
                      data : {last_id:last_id, step:step, r_type:r_type},
                      type : 'GET',
                      cache : false,
                      success: function(data){
                      data=JSON.parse(data);
                       if (data) {
                           $("#PdfFile").attr("src",data.file);
                           $("#PreviewPdf").modal('show');  
                        }
                        
                      },

                error: function (ja, st, err) {
                console.log(jq);
                console.log(st);
                console.log(err);
              
          
                        }  
                   
                     });

                     }

//////////////////////////////////////////////////////////////////////////////////////////////                           
     function generatePdfSave(last_id ,step){
         $('.loader').css('display','block');
         $('.loader').delay(3000).hide(200,function(){});
          $('#done_msg').html('<div class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><p><i class="icon fa fa-check"></i>Preview and Save Success!</p></div>');
             $('html, body').scrollTop(0);

    var redirect = base_url+'Proposal/proposals';
    setTimeout(function() { window.location.href = redirect;
 }, 3000);
     

}

////////////////////////////////////////////////////////////////////////////////////////////////////////

 function generatePdfEmail(last_id, step, r_type){
                 var email_to = $('input[name=email_to]');
                 var sub_for = $('input[name=subject]');
                 var email_body = $('textarea[name=message]');
                 var pro_id =$('input[name=proposal_id]'); 

              $.ajax({
                      url:base_url+'Proposal/sendProposalViaEmailForm',
                      data : {proposal_id:last_id, step:step},
                      type : 'GET',
                      cache : false,
                      success: function(data){
                      data=JSON.parse(data);
                       if (data) {
                          email_to.val(data.send_to);
                          sub_for.val(data.sub_for);
                          $('#editor1').summernote('code',data.email_body);
                          email_body.val();
                          pro_id.val(data.proposal_id);
 
                        }
                        
                      },

                error: function (jqXHR, status, err) {
                  console.log(jqXHR);
                  console.log(status);
                  console.log(err);
              
          
                        }  
                   
                     });
    
     

     $("#sendEmail").modal('show');
        
     

 }
 
 ////////////////////////////////////////////////////////////////////////////////////////////////
 $('body').on('click','#btn_send_email',function(e) {

    $('#loader_email').css('display','block');

    var csrf_token = $('#csrf_value_').val();
    var  email_from = $('#send_email');
    var  data = email_from.serialize();
   $.ajax({
        url         : base_url+'Proposal/sendProposalViaEmail' ,
        data        : data,
        cache       : false,
        type        : 'POST',
      success:function(data){
         if (data) {

         $('#loader_email').delay(50).hide(200,function(){});
              email_from.trigger('reset');
           $('#send_sucess').html('<div class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><p><i class="icon fa fa-check">  Email Sent Success! </i></p></div>');
               
           setTimeout(function(){ $('.close').click(); 
            $('#done_msg').html('<div class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><p><i class="icon fa fa-check"></i>  Save And Email Sent Success!</p></div>');
            $('html, body').scrollTop(0);

         }, 3000);
           

         }
         

                   },

      error: function (jqXHR, status, err) {
         $('#loader_email').delay(50).hide(200,function(){});
         
        $('#send_sucess').html('<div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><p><i class="icon fa fa-exclamation-triangle">   Email Sent Failed!  </i></p></div>');

      }
      });



      });

})