<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <style>
            body{
                width:100%;
                margin: 0;
                padding: 0;
                color:#000;
                font-family:"Helvetica Neue", Helvetica, Arial, sans-serif;
                font-size:14px;
                background-color: #fff;

            }
            #main{
                width: 860px;
                margin:0 auto;
                /*border:1px solid #ccc;*/
                padding:10px;
            }
            .section{
                padding:10px;
                /*border-bottom:1px solid #ccc;*/
                margin-bottom:15px;
                padding-bottom:15px;
            }
            .clear{
                clear:both;
            }
            p{
                margin:0px;
            }
            .inner-invoice{
                margin:20px;
                border:1px solid #ccc;
                padding:20px;
            }
            table{
                border-color:#ccc;
                border: none;
                border-spacing:none;
                border-collapse: collapse;
            }
            td,th{
                padding:5px;


            }
            .table tbody tr td,table thead tr th{
                border:none;
                border-right:1px solid #fff;

            }
            .table tbody tr td{
                background-color: #f5f5f5;
                border-right:1px solid #fff;
                border-bottom:1px solid #fff;
                padding:4px;
                font-size:13px;   

            }
            table thead tr th{
                background-color: <?php echo $proposal_info->template_bg_color; ?>;
                padding:10px 4px;
                text-align: center;
                color:<?php echo $proposal_info->template_text_color; ?>;
                border-color:#fff;
            }
            table thead tr th{
                text-align: left;
            }
            table thead tr td{
                text-align: left;
                font-size: 13px;
                padding:5px;

            }

            .segment{
                width:46%;
            }
            .heading{
                padding: 10px 0px;
            } 
            .invoice-details{
                width:300px;
            }
            .invoice-details b:first-child{
                width:150px;
                margin-right:10px;
                display: inline-block;
            }
            .classtext{
                color:<?php echo $proposal_info->template_text_color; ?>;
            }
            .classbg{
                background-color: <?php echo $proposal_info->template_bg_color; ?>;
            }
            .classtexts{
                color: <?php echo $proposal_info->template_text_color; ?>;
            }
            .left{
                float:left;
            }
            .right{
                float:right;
            }

            .logoarea img{
                width: 140px;
                height: 75px;

            }
            .section h3{
                background-color: <?php echo $proposal_info->template_bg_color; ?>;
                padding:10px 5px;
                color:<?php echo $proposal_info->template_text_color; ?>;
                margin-bottom: 3px;
            }
            .standard p{
                margin: 3px;
                color:<?php echo $proposal_info->template_text_color; ?>;

            }
            .standard h2,.standard h3{
                margin:3px;
                color:<?php echo $proposal_info->template_text_color; ?>;
                text-indent: 10px;
            }
            .table thead > tr > th {
                vertical-align: bottom;
                border-right:1px solid #fff;
                border-bottom:1px solid #fff; 
            }
            .table thead > tr > td {
                vertical-align: bottom;
                border-right:1px solid #fff;
                border-bottom:1px solid #fff; 
            }

        </style>

    <div id="main">
        <div class="section head-section standard" style="background-color:<?php echo $proposal_info->template_bg_color; ?>;">
            <!--   segment left-->
            <div class="segment left">
                <p style="margin: 3px 0px;"><img src="<?php echo base_url(); ?>files/logo/<?php echo $compnay_info->logo; ?>" class="logo"/></p>
                <p style="margin: 3px 0px;">Invoice Number:
                    <?php echo $proposal_info->invoice_no; ?></p>
                <p style="margin: 3px 0px;">Invoice Date: 
                    <?php echo $proposal_info->date; ?></p>

            </div>
            <div class="segment logoarea right" style="text-align: right;padding: 10px">
                <h2 style="padding:0px;margin:5px 0px;text-indent:0px;">
                    <?php echo $compnay_info->name_company_name; ?></h2>
                <p><?php echo $compnay_info->address; ?></p>
                <p>Contact Person: <?php echo $compnay_info->contact_person; ?></p>
                <p>Phone: <?php echo $compnay_info->email; ?></p>
                <p>Email: <?php echo $compnay_info->phone; ?></p>

            </div>
            <!--        segment right-->
            <div style="clear: both"></div>

        </div>

        <div class="section head-section " style="padding:0px 0px 4px 0px;margin:0px;">
            <div class="left" style="width: 46%;overflow: hidden;">
                <h3  style="margin-top: 0px;">Bill to:</h3>
                <p class="heading" style="line-height: 18px;padding-bottom: 0px;padding-left: 0px;margin: 3px 0px;">
                    <b><?php echo $customer_info->name; ?></b></p>
                <p style="padding-left: 0px;margin: 3px 0px;"><?php echo $customer_info->billing_address; ?></p>
                <p style="padding-left: 0px;margin: 3px 0px;">Contact Person: <?php echo $customer_info->c_person; ?></p>
                <p style="padding-left: 0px;margin: 3px 0px;">Phone: <?php echo $customer_info->phone; ?></p>
                <p style="padding-left: 0px;margin: 3px 0px;">Email: <?php echo $customer_info->email; ?>
            </div>
            <div class="left" style="width: 8%;overflow: hidden;">
                <p>&nbsp;</p>
            </div>
            <!--        segment left-->
            <div class="right" style="width: 46%;overflow: hidden;margin-right: 0px">
                <h3  style="margin-top: 0px;">Payment Information:</h3>
                <p style="padding: 10px 0px 0px;margin: 3px 0px;line-height: 18px;">
                    Payemnt Method: <?php echo $proposal_info->payment_method; ?></p>
                <p style="padding-left: 0px;margin: 3px 0px;">
                    Due Date: <?php echo $proposal_info->due_date; ?></p>

            </div>
        </div>
        <!-- .section. -->
        <div class="section head-section " style="padding:0px 0px 15px 0px;margin:0px 0px 15px 0px;">
            <table class="table" cellspacing="0" cellpadding="0" border="0" style="width:100%;">
                <thead>
                    <tr>
                        <th style="width:5%;text-align: center;">SN</th>
                        <th style="width:20%;">Product/Service</th>
                        <th  style="width:12%;text-align: center;">Unit Price</th>
                        <th style="width:10%;text-align: center;">Quantity</th>
                        <th style="width:11%;text-align: center;">Tax (%)</th>
                        <th style="width:15%;text-align: center;">Tax</th>
                        <th style="width:12%;text-align: right;">Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($service_products):
                        $i = 0;
                        foreach ($service_products as $service):
                            ?>
                            <tr>
                                <td rowspan="2" style="text-align: center;"><?php echo++$i; ?></td>
                                <td>
                                    <?php echo findService($service->product_service_id); ?>
                                </td>
                                <td rowspan="2" style="text-align: center;">
                                    <?php echo $compnay_info->currency; ?><?php echo $service->rate; ?></td>
                                <td rowspan="2" style="text-align: center;"><?php echo $service->quantity_amount ?></td>
                                <td rowspan="2" style="text-align: center;"><?php echo $service->tax_rate; ?>%</td>
                                <td rowspan="2" style="text-align: center;">
                                    <?php echo $compnay_info->currency; ?><?php echo $service->tax_amount; ?></td>
                                <td rowspan="2" style="border-right: 1px solid #fff;text-align:right;"><?php echo $compnay_info->currency; ?><?php echo $service->total; ?></td>
                            </tr>
                            <tr>
                                <td style="width:180px;font-size:10px;"> <?php echo $service->description; ?></td>
                            </tr>
                            <?php
                        endforeach;
                    endif;
                    ?>
                    <tr style="border-bottom: 1px solid #fff;">
                        <td colspan="5" style="border-top:1px solid #fff;background-color:#fff;"></td>
                        <td style="border-right:none;border-bottom:none;"><b>Subtotal:</b></td>
                        <td style="border-right: 1px solid #fff;border-bottom:none;text-align: right;"><?php echo $compnay_info->currency; ?><?php echo $proposal_info->subtotal; ?></td>
                    </tr>
                    <tr style="border-bottom: 1px solid #fff;">
                        <td colspan="5" style="border-top:1px solid #fff;background-color:#fff;" ></td>
                        <td style="border-right:none;border-bottom:none;"><b>Discount (-):</b></td>
                        <td style="border-right: 1px solid #fff; border-bottom:none;text-align: right;">
                            <?php
                            if ($proposal_info->discount_type == 1)
                                echo "$proposal_info->discount_value%";
                            else
                                echo "$compnay_info->currency$proposal_info->discount_value";
                            ?></td>
                    </tr>
                    <tr style="border-bottom: 1px solid #fff;">
                        <td colspan="5" style="border-top:1px solid #fff;background-color:#fff;" ></td>
                        <td style="border-right:none;border-bottom:none;"><b>Actual Subtotal:</b></td>
                        <td style="border-right: 1px solid #fff; border-bottom:none;text-align: right;"><?php echo $compnay_info->currency; ?><?php echo $proposal_info->after_discount; ?></td>
                    </tr>
                    <tr style="border-bottom: 1px solid #fff;">
                        <td colspan="5" style="border-top:1px solid #fff;background-color:#fff;" ></td>
                        <td style="border-right:none;border-bottom:none;"><b>Total Tax (+):</b></td>
                        <td style="border-right: 1px solid #fff; border-bottom:none;text-align: right;"><?php echo $compnay_info->currency; ?><?php echo $proposal_info->tax; ?></td>
                    </tr>
                    <tr style="border-bottom: 1px solid #fff;">
                        <td colspan="5" style="border-top:1px solid #fff;background-color:#fff;"></td>
                        <td style="border-right:none;border-bottom:none;"><b>Shipping/Other (+):</b></td>
                        <td style="border-right: 1px solid #fff;border-bottom:none;text-align: right;"><?php echo $compnay_info->currency; ?><?php echo $proposal_info->shipping_other; ?></td>
                    </tr>
                    <tr style="border-bottom: 1px solid #fff;">
                        <td colspan="5" style="border-top:1px solid #fff;background-color:#fff;"></td>
                        <td style="background-color:<?php echo $proposal_info->template_bg_color; ?>;color:<?php echo $proposal_info->template_text_color; ?>;border-right:none;border-bottom:none;"> <b>Grand Total:</b></td>
                        <td style="border-right: 1px solid #fff;background-color:<?php echo $proposal_info->template_bg_color; ?>;color:<?php echo $proposal_info->template_text_color; ?>; border-bottom:none;text-align: right;">
                            <?php echo $compnay_info->currency; ?><?php echo $proposal_info->grand_total; ?></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br>
        <!-- .section. -->
        <?php if ($proposal_info->note != '') { ?>
            <div class="section head-section " style="padding:0px 0px 15px 0px;margin:0px 0px 15px 0px;">
                <h3 class="classtext">Note:</h3>
                <p style="margin-left:10px;text-transform: justify"><?php echo $proposal_info->note; ?></p>
            </div>
        <?php } ?>
        <!-- .section -->
    </div>
    <!-- #main -->

</body>
</html>