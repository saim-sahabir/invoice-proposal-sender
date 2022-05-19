var deletedRow=[];
$(document).ready(function(){
    "use strict";
    $("#proposal_form").submit(function(){
            var customerFinder=$("#customerFinder").val();
            var title=$("#proposal_title").val();
            var type=$('input[name=type]').val();
            var subtotal=$("#subtotal").val();
            var serviceNum=$("#form-table tbody tr").length;
            var error=false;
            var proposal_date=$("#proposal_date").val();
            if(proposal_date==""){
                $("#proposal_date").css({"border-color":"red"});
                $("#proposal_date").parent().children("span").show(200).delay(5000).hide(200,function(){
                    $("#proposal_date").css({"border-color":"#ccc"});
                });
                error=true;
            }
             var id =0 ;
            for(var n=0;n<=id-1;n++){
                if(deletedRow.indexOf(n)<0){
                    var description= $.trim($("#description_"+n).val());
                    if(description.length>200){
                        $("#description_"+n).css({"border-color":"red"});
                        $("#description_"+n).next("span").show(200).delay(5000).hide(200,function(){
                            $("#description_"+n).css({"border-color":"#ccc"});
                        });
                        error=true;
                    }
                }
            }
            var id =0 ;
            for(var n=0;n<=id-1;n++){
                if(deletedRow.indexOf(n)<0){
                    var tax_rate= $.trim($("#tax_rate_"+n).val());
                    if(tax_rate==''||isNaN(tax_rate)){
                        $("#tax_rate_"+n).css({"border-color":"red"});
                        $("#tax_rate_"+n).next("span").show(200).delay(5000).hide(200,function(){
                            $("#tax_rate_"+n).css({"border-color":"#ccc"});
                        });
                        error=true;
                    }
                    var quantity= $.trim($("#quantity_"+n).val());
                    if(quantity==''||quantity==0||isNaN(quantity)){
                        $("#quantity_"+n).css({"border-color":"red"});
                        $("#quantity_"+n).next("span").show(200).delay(5000).hide(200,function(){
                            $("#quantity_"+n).css({"border-color":"#ccc"});
                        });
                        error=true;
                    }
                }
            }
            if(serviceNum<1){
                $(".service-empty").show(200).delay(5000).hide(200);
                error=true;

                $("body, html").animate({ 
                    scrollTop: $(".service-empty").offset().top 
                }, 10);
            }
            if(customerFinder==""){
                $("#customerFinder").css({"border-color":"red"});
                $(".customerFinder-msg").show(200).delay(5000).hide(200,function(){
                    $(".customerFinder-msg").hide();
                });
                error=true;
            }
            if(subtotal==""||subtotal==0){
                error=true;
            }else{
                $("#subtotal").css({"border-color":"#ccc"});
            }
            var mm=$("input[name='proposal_type']:checked").val();
            if(mm==1){
                if(title==""){
                    $("#proposal_title").parent().children("span").show(200).delay(5000).hide(200,function(){
                        $("#proposal_title").css({"border-color":"#ccc"});
                    });
                    error=true;
                }
            }
            if(error==true){
                return false;
            }
            //return false;
        });
    /////////////////////////////////
    $("#fileTitle").keyup(function(){
        var fileTitle=$.trim($("#fileTitle").val());
        if(fileTitle.length>50){
            $("#fileTitle").css({"border-color":"red"});
            $(".notevalid").show(200).delay(300).hide(200,function(){
                $("#fileTitle").css({"border-color":"#ccc"});
                $("#fileTitle").val('');
            });
   
        }
    });
 
   var csrf_value_ = $("#csrf_value_").val();
   var type=$("#type").val(); 
    if(type=='Invoice')  {
       $(".invoiceclass").show();
       $(".proposalclass").hide();
    }else{
      $(".invoiceclass").hide();
      $(".proposalclass").show();
    }
   $('body').on('change','#type',function(){
    var type=$("#type").val(); 
    if(type=='Invoice')  {
       $(".invoiceclass").show();
       $(".proposalclass").hide();
       $('#proposal_no').attr('name','invoice_no');

    }else{
      $(".invoiceclass").hide();
      $(".proposalclass").show();
      $('#proposal_no').attr('name','proposal_no');
    }
    $.ajax({
            url:base_url+"Proposal/getProposalNo",
            method:"POST",
            data:{
                type : type,
                csrf_offpos: csrf_value_
            },
            success:function(response) {
                response = JSON.parse(response);
                $('#proposal_no').val(response.proposal_no);

            },
            error:function(){
                alert(a_error);
            }
        });

    });

  ////////////////modal payment/////////////////////

 

   ////////// ttachment view/////
    $(".previewr").click(function(){
           var name=$(this).data('atid');
            var url=base_url+'files/attachments/'+name;
            $("#attachmentFile").attr("src",url);
            $("#PreviewModal").modal('show');

     
    });


/////////////////////////////////////////add Products/Serves//////////////////////////////////////////////////////

$("#addProductService").click(function(){
        var product_service_name = $('input[name=product_service_name]').val(); 
        var product_service_price = $('input[name=product_service_price]').val();
        var product_service_description = $('textarea[name=product_service_description]').val(); 
        var error = 0;
        if(product_service_name == '') {
            error = 1;
            var cl1 = "#product_service_name_err_msg";
            var cl2 = "#product_service_name_err_msg_container";
            $(cl1).text("The Name field is required!");
            $(cl2).show(200).delay(6000).hide(200,function(){
            });
        } else {
            $('input[name=product_service_name]').css('border', '1px solid #ccc');
        } 
        if(product_service_price == '') {
            error = 1;
            var cl1 = "#product_service_price_err_msg";
            var cl2 = "#product_service_price_err_msg_container";
            $(cl1).text("The Price field is required!");
            $(cl2).show(200).delay(6000).hide(200,function(){
            });
        } else {
            $('input[name=product_service_price]').css('border', '1px solid #ccc');
        }

        if (product_service_description != '') {
            var product_service_description_length = product_service_description.length;

            if (product_service_description_length > 250) {
                error = 1;
                var cl1 = "#product_service_description_err_msg";
                var cl2 = "#product_service_description_err_msg_container";
                $(cl1).text("The Description field text cannot exceed 250 character!");
                $(cl2).show(200).delay(6000).hide(200,function(){
                });
            }else{
                $('input[name=product_service_description]').css('border', '1px solid #ccc');
            }
        }

        if(error == 0) {
            $.ajax({
                url:base_url+'Proposal/addNewProductServiceByAjax',
                method:"GET",
                data: {
                    name:product_service_name, 
                    price:product_service_price,
                    description:product_service_description
                },
                success:function(data){
                    data=JSON.parse(data);
                    var product_service_id=data.product_service_id;
                    $.ajax({
                            url:base_url+'Proposal/getProductServiceList',
                            method:"GET",
                            data: { },
                            success:function(data){
                                console.log(product_service_id);
                                $("#product_service_id").empty();
                                $("#product_service_id").append(data);
                                $('#product_service_id').val(product_service_id).trigger('change');
                                     addCart();
                            }
                        });
                    $('.close').click();
                }
            });
        }

    });


//////////////////////////////////////////end Products/Serves////////////////////////////////////////////////////////

	var suffix = 0; 
	$("#product_service_id").on('select2:select', function (e) {
        addCart();
    });


     function addCart() {
         
     
		var product_service_data = $('#product_service_id').val();  
		var product_service_array = product_service_data.split("|"); 

		suffix++; 
		var cart_row = '<tr class="rowCount" data-id="' + suffix + '" id="row_' + suffix + '">'+
                    '<td style="padding-left: 10px;"><p id="sl_' + suffix + '">'+suffix+'</p></td>'+
                    '<td><input type="text" class="form-control" readonly="" placeholder="Products" value="'+product_service_array[1]+'"style="margin-bottom: 5px;">'+
                     '<input type="hidden" id="product_service_id_' + suffix + '" name="product_service_id[]" value="' + product_service_array[0] + '"/>'+
                     
                    '<textarea name="description[]" onkeyup="return checkDescription(' + suffix + ');" class="form-control" placeholder="Description" id="description_' + suffix + '" style="border-radius:5px;"></textarea><div id="error_description_' + suffix + '"></div></td>'+
   
                    '<td><input type="text" data-countID="'+suffix+'" id="quantity_amount_' + suffix + '" name="quantity_amount[]" value="'+ 1 +'" onfocus="this.select();" class="form-control integerchk aligning countID"  placeholder="Qty/Amount" onkeyup="return calculateAll();" ></td>'+
                    '<td><input style="min-width: 66px;" type="text" id="rate_' + suffix + '" name="rate[]" onfocus="this.select();" class="form-control integerchk aligning" placeholder="Rate" value="'+ product_service_array[2] +'" onkeyup="return calculateAll();"/></td>'+
                    '<td><input style="min-width: 68px;" type="text" id="total_' + suffix + '" name="total[]" class="form-control aligning" placeholder="Subtotal" value="'+ product_service_array[2] +'" readonly /></td>'+
                    '<td><a class="btn btn-danger btn-xs" style="margin-left: 5px; margin-top: 10px;" onclick="return deleter(' + suffix + ',' + product_service_array[0] +');" ><i style="color:white" class="fa fa-trash"></i> </a></td>'+
                    '</tr>'; 

        $('#productsServicesCart tbody').append(cart_row);     
        $('#product_service_id').val('');
        calculateAll();
        $('#product_service_id').val(null).trigger('change');
}

	 
}); 


function calculateAll(){
        var subtotal = 0;
        var sumoftax = 0;
        var actual_discount=0;
        var precision_val = $('#precision_val').val();
        console.log(precision_val);
        var i = 1;
        $(".rowCount").each(function () {
            var id = $(this).attr("data-id");
            var rate=$("#rate_"+id).val();
            var temp = "#sl_"+id;
            $(temp).html(i);
            i++;
            var quantity_amount = $("#quantity_amount_"+id).val();
            if($.trim(rate) == "" || $.isNumeric(rate) == false){
                rate=0;
            }
            if($.trim(quantity_amount) == "" || $.isNumeric(quantity_amount) == false){
                quantity_amount=0;
            }

            var quantity_amount_and_rate=parseFloat($.trim(rate))*parseFloat($.trim(quantity_amount));

            $("#total_"+id).val(quantity_amount_and_rate.toFixed(precision_val));
            subtotal += parseFloat($.trim($("#total_" + id).val()));
        });
        if (isNaN(subtotal)) {
            subtotal = 0;
        }
        $("#subtotal").val(subtotal);
        var discount_type=$("#discount_type").val();
        var discount_value=parseFloat($.trim($("#discount_value").val()));
        if(discount_value==''||isNaN(discount_value)){
            discount_value=0;
            $("#discount_value").val(0);
        }
        if(discount_type=='Percentage'){ /// for %
            if(discount_value>=100){
                $("#discount_value").css({"border-color":"red"});
                $(".discounterror").show(200).delay(2000).hide(200,function(){
                    $("#discount_value").css({"border-color":"#ccc"});
                });
                discount_value=0;
                actual_discount=0;
                $("#discount_value").val(0);
                $("#actual_discount").val(0);
                
            }else{
                $("#discount_value").css({"border-color":"ccc"});
                actual_discount=subtotal*discount_value/100;
                $("#actual_discount").val(actual_discount);
            }
        }else{ /// for Fixed
            if(subtotal>=discount_value){
                actual_discount=discount_value;
                $("#discount_value").css({"border-color":"ccc"});
                $("#actual_discount").val(discount_value);
            }else{
                $("#discount_value").css({"border-color":"red"});
                $(".spanclass").show(200).delay(2000).hide(200,function(){
                    $("#discount_value").css({"border-color":"#ccc"});
                });
                discount_value=0;
                actual_discount=0;
                $("#discount_value").val(0);
                $("#actual_discount").val(0);
            }
        }
        var after_discount=parseFloat(subtotal) - parseFloat(actual_discount);
        $("#after_discount").val(after_discount);
        var taxcount =  parseFloat($.trim($("#taxcount").val()));
        for(var m=1;m<=taxcount;m++){
            var taxpercentage=parseFloat($.trim($(".taxpercentage" + m).val()));
            var taxamount=parseFloat(after_discount*taxpercentage/100);
             $(".taxamount"+m).val(taxamount.toFixed(precision_val));
            sumoftax += taxamount;
        }
        $("#sumoftax").val(sumoftax);
        var shipping_other =  parseFloat($.trim($("#shipping_other").val()));
        if($.trim(shipping_other)==""|| $.isNumeric(shipping_other)==false){
            shipping_other=0;
        }
        var grand_total = parseFloat(after_discount) + parseFloat(shipping_other)+ parseFloat(sumoftax);
        grand_total = grand_total.toFixed(precision_val);
        $("#grand_total").val(grand_total); 

        // var paid = $("#paid").val(); 
        // if($.trim(paid)==""|| $.isNumeric(paid)==false){
        //     paid=0;
        // }
        //var due = parseFloat(grand_total) - parseFloat(paid);
    }
    function checkDescription(id){
        var description= $.trim($("#description_"+id).val());
        if(description.length>250){
            $("#error_description_"+id).html('<span style="border-color:#ccc; color:red;">Maximum character limit 250</span>');
            description = description.slice(0,250);
            $("#description_"+id).val(description);    
        }
        else{
        $("#error_description_"+id).html('');     
        }
    }


    /////// DELETE FIELD
    ////////////////////////////////////////////////////////
    function deleter(id){
        $("#row_"+id).remove();
        deletedRow.push(id);
        updateRowNo();
        calculateAll();
    }
    ////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////
    //////////UPDATE ROW NUmber
    ///////////////////////////////////////////////////////
    function updateRowNo(){
        var numRows=$("#form-table tbody tr").length;
        for(var r=0;r<numRows;r++){
            $("#form-table tbody tr").eq(r).find("td:first h3").text(r+1);
        }
    }



