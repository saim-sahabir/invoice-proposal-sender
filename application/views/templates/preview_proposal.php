<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Preview Proposal</title>
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
            .left{
                float:left;
            }
            .right{
                float:right;
            }
            .segment{
                width:300px;
            }
            .head-section p{
                margin: 3px;

            }
            .head-section h2,.head-section h3{
                margin:3px;
                text-indent: 10px;
            }
            .head-section h3{
                background-color: <?php echo $proposal_info->template_bg_color; ?>;
                padding:10px 0px;
                width:100%;
                color:<?php echo $proposal_info->template_text_color; ?>;
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
            table{
                border-color:#ccc;
                border: none;
                border-spacing:none;
                border-collapse: collapse;
            }
            td,th{
                padding:5px;

            }
            table tbody tr td,table thead tr th{
                border:none;
                border-right:1px solid #fff;


            }
            .table tbody tr td{
                background-color: #f5f5f5;
                border:none;
                border-right:1px solid #fff;
                border-bottom:1px solid #fff;   
                border: none;  
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
            .hide-colunm{
                border:none;
            }
            .head-section h2,.head-section h3{
                margin:10px 0px;
                margin-left:0px;
                margin-right:0px;
                text-indent: 10px;
            }
            .textcolor{
                color:<?php echo $proposal_info->template_text_color; ?>;
            }
            .table thead > tr > th {
                border-bottom: 0px solid #ddd;
                vertical-align: bottom;
            }
            .table thead > tr > td {
                border-bottom: 0px solid #ddd;
                vertical-align: bottom;

            }
        </style>
    </head>
    <body>
        <div id="main">
            <div class="section head-section standard" style="background-color:<?php echo $proposal_info->template_bg_color; ?>;">
                <div class="segment left" >
                    <p><img src="<?php echo base_url(); ?>files/logo/<?php echo $compnay_info->logo; ?>" class="logo"/> </p>
                    <p class="textcolor">Proposal Number: <?php echo $proposal_info->proposal_no; ?></p>
                    <p class="textcolor">Date: <?php echo $proposal_info->date; ?></p>
                </div>
                <!--        segment left-->
                <div class="segment right" style="width: 330px;text-align: right;padding-right: 10px">
                    <h2 style="padding:0px;margin-left:0px;text-indent:0px;margin-right: 3px"><?php echo $compnay_info->name_company_name; ?></h2>
                    <p class="textcolor"><?php echo $compnay_info->address; ?></p>
                    <p class="textcolor"><?php echo $compnay_info->email; ?></p>
                    <p class="textcolor"><?php echo $compnay_info->phone; ?></p>
                    <?php if ($compnay_info->website != ""): ?>
                        <p class="textcolor"><?php echo $compnay_info->website; ?></p>
                    <?php endif; ?>
                </div>
                <!--        segment right-->
                <div style="clear: both"></div>

            </div>
            <!--    .section-->
            <div class="section head-section " style="padding:0px 0px 15px 0px;margin:0px 0px 15px 0px;">
                <div style="width:100%">
                    <h3>Proposal for:</h3>
                    <p><?php
                    echo $customer_info->name;
                    echo ", Phone: " . $customer_info->phone . ", Email: " . $customer_info->email;
                    ?> </p>
                </div>
                <div class="segment left" >
                    <h3 class="textcolor">Service Address:</h3>
                    <p><?php echo $customer_info->address; ?></p>
                </div>
                <!--        segment left-->
                <div class="segment right" style="width:330px;">
                    <h3  class="textcolor">Billing Address:</h3>
                    <p ><?php echo $customer_info->billing_address; ?></p>
                </div>
                <!--        segment right-->
                <div style="clear: both"></div>
            </div>
            <!--    .section-->
            <div class="section head-section " style="padding:0px 0px 15px 0px;margin:0px 0px 15px 0px;">
                <?php echo $proposal_body; ?>
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
                                    <td rowspan="2" style="text-align: center;"><?php echo $service->quantity_amount; ?></td>
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
                                if ($proposal_info->discount_type == 'Percentage')
                                    echo "$proposal_info->discount_value%";
                                else
                                    echo "$compnay_info->currency$proposal_info->discount_value";
                                ?></td>
                        </tr>
                        <tr style="border-bottom: 1px solid #fff;">
                            <td colspan="5" style="border-top:1px solid #fff;background-color:#fff;" ></td>
                            <td style="border-right:none;border-bottom:none;"><b>Actual Subtotal:</b></td>
                            <td style="border-right: 1px solid #fff; border-bottom:none;text-align: right;">
                                <?php echo $compnay_info->currency; ?><?php echo $proposal_info->after_discount; ?></td>
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
                            <td style="border-right: 1px solid #fff;background-color:<?php echo $proposal_info->template_bg_color; ?>;color:<?php echo $proposal_info->template_text_color; ?>; border-bottom:none;text-align: right;"><?php echo $compnay_info->currency; ?><?php echo $proposal_info->grand_total; ?></td>
                        </tr>
                    </tbody>
                </table>
                <h3 style="background: none;color:#000;width:200px;border-bottom:2px solid #999;margin-top:30px;">&nbsp;</h3>
                <p><b><?php echo $compnay_info->contact_person; ?></b></p>
                <p><?php echo $compnay_info->name_company_name; ?></p>
                <p><?php echo $compnay_info->phone; ?></p>
                <p><?php echo $compnay_info->email; ?></p>

            </div>
            <div style="clear: both"></div>
        </div>
        <!--.main-->
    </body>
</html>