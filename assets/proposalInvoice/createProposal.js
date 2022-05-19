$(function(){
	"use strict";
	/////////////////////////////////////////////////////////////////////
        ///////// PROPOSAL FORM SUBMIT
        /////////////////////////////////////////////////////////////////////
        $("#proposal-form").submit(function(){
            var customerFinder=$("#customerFinder").val();
            var title=$("#proposal_title").val();
            var proposal_type=$('input[name=proposal_type]').val();
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

});



/////////////////////////////////////////////////
/////////////////ADDING FIELD
///////////////////////////////////////////////



