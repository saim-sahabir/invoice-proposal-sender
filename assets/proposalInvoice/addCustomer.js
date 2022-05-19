$(document).ready(function(){
	$("#addCustomer").click(function(){
		var name = $('input[name=name]').val();
		var c_person = $('input[name=c_person]').val(); 
		var phone = $('input[name=phone]').val();
		var email = $('input[name=email]').val();
		var billing_address = $('textarea[name=billing_address]').val();
		var website = $('input[name=website]').val();
		var address = $('textarea[name=address]').val(); 
		var error = 0;
		if(name == '') {
			error = 1;
            var cl1 = "#name_err_msg";
            var cl2 = "#name_err_msg_container";
            $(cl1).text("The Name/Company Name field is required!");
            $(cl2).show(200).delay(6000).hide(200,function(){
            });
		} else {
			$('input[name=name]').css('border', '1px solid #ccc');
		} 
		if(c_person == '') {
			error = 1;
            var cl1 = "#cp_err_msg";
            var cl2 = "#cp_err_msg_container";
            $(cl1).text("Contact Person field is required!");
            $(cl2).show(200).delay(6000).hide(200,function(){
            });
		} else {
			$('input[name=c_person]').css('border', '1px solid #ccc');
		} 
		if(phone == '') {
            error = 1;
            var cl1 = "#phone_err_msg";
            var cl2 = "#phone_err_msg_container";
            $(cl1).text("The Phone field is required!");
            $(cl2).show(200).delay(6000).hide(200,function(){
            });
		} else {
			$('input[name=phone]').css('border', '1px solid #ccc');
		}
		if(billing_address == '') {
            error = 1;
            var cl1 = "#bl_err_msg";
            var cl2 = "#bl_err_msg_container";
            $(cl1).text("Billing Address field is required!");
            $(cl2).show(200).delay(6000).hide(200,function(){
            });
		} else {
		}
		if(error == 0) {
			$.ajax({
				url:base_url+'Proposal/addNewCustomerByAjax',
				method:"GET",
				data: {
                    name:name,
                    c_person:c_person, 
					phone:phone,
                    email:email,
                    website:website,
                    billing_address:billing_address,
                    address:address
				},
				success:function(data){
					data=JSON.parse(data);
                    var customer_id=data.customer_id;
                    $.ajax({
			                url:base_url+'Proposal/getCustomerList',
			                method:"GET",
			                data: { },
			                success:function(data){
			                	console.log(customer_id);
			                	$("#customer_id").empty();
                                $("#customer_id").append(data);
                                $('#customer_id').val(customer_id).change();
			                }
			            });
                    
                    $('.close').click();
				}
			});
		}

	});

});



/////////////////////////////////////////////////
/////////////////ADDING FIELD
///////////////////////////////////////////////



