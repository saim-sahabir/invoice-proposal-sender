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
                background-color: #<?php echo $proposal_info->template_bg_color; ?>;
                padding:10px 4px;
                width:100%;
                color:#fff;
            }
            .standard p{
                margin: 3px;
                color:#fff;

            }
            .standard h2,.standard h3{
                margin:3px;
                color:#fff;
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
            table tbody tr td{
                background-color: #f5f5f5;
                border:none;
                border-right:1px solid #fff;
                border-bottom:1px solid #fff;   
                border: none;  

            }
            table thead tr th{
                background-color: #<?php echo $proposal_info->template_bg_color; ?>;
                padding:10px;
                text-align: center;
                color:#<?php echo $proposal_info->template_text_color; ?>;
                border-color:#fff;
            }
            table thead tr th{
                text-align: left;
            }
            img.logo{
                width:100px;
                height:auto;
                max-height: 100px;
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
        </style>
    </head>
    <body>
        <div id="main">
            <div class="section head-section standard" style="background-color:#<?php echo $proposal_info->template_bg_color; ?>;">
                <div class="segment left" >
                    <p><img src="<?php echo base_url(); ?>asset/uploads/logo/<?php echo $compnay_info->logo; ?>" class="logo"/> </p>
                    <p>Proposal ID: <?php echo $proposal_info->id; ?></p>
                    <p>Date: <?php echo $proposal_info->proposal_date; ?></p>
                </div>
                <!--        segment left-->
                <div class="segment right" style="width: 330px;">
                    <h2 style="padding:0px;margin-left:0px;text-indent:0px;"><?php echo $compnay_info->company_name; ?></h2>
                    <p><?php echo $compnay_info->address; ?></p>
                    <p><?php echo $compnay_info->email_address; ?></p>
                    <p><?php echo $compnay_info->phone; ?></p>
                    <?php if ($compnay_info->website != ""): ?>
                        <p><?php echo $compnay_info->website; ?></p>
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
                    echo ($customer_info->contact_person != $customer_info->customer_name && !empty($customer_info->contact_person)) ? $customer_info->contact_person . ", " : "";
                    echo "Phone: " . $customer_info->phone . ", Email: " . $customer_info->email_address;
                    ?> </p>
                </div>
                <div class="segment left" >
                    <h3>Billing Address:</h3>
                    <p><?php echo $customer_info->billing_address; ?></p>

                </div>
                <!--        segment left-->
                <div class="segment right" style="width:330px;">
                    <h3>Service Address:</h3>
                    <p><?php echo $customer_info->service_address; ?></p>
                </div>
                <!--        segment right-->
                <div style="clear: both"></div>

            </div>
            <!--    .section-->
            <div class="section head-section " style="padding:0px 0px 15px 0px;margin:0px 0px 15px 0px;">
                <!--We have a proposed pricing for <?php echo $customer_info->customer_name; ?> located at <?php echo $customer_info->service_address; ?>. <?php echo $compnay_info->business_type; ?> and price are enlisted bellow.
                If you have any question regarding this proposal, please let us know. Thank you.<br/><br/> -->
                <?php echo $proposal_body; ?>

                <table class="table" cellspacing="0" cellpadding="0" border="0" style="width:100%;">
                    <thead>
                        <tr><th style="width:50px;">SL No.</th>
                            <th style="width:180px;"><?php echo $compnay_info->business_type; ?></th>
                            <th>Unit Price</th>
                            <th>Qunatity</th>
                            <th>Discount</th>
                            <th>Tax</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if ($service_products):
                            $i = 0;
                            foreach ($service_products as $service):
                                ?>
                                <tr>
                                    <td rowspan="2"><?php echo++$i; ?></td>
                                    <td style="width:180px;">

                                        <?php echo findService($service->service_id); ?>
                                    </td>
                                    <td rowspan="2" style="text-align: center;"><?php echo $compnay_info->currency; ?><?php echo $service->unit_price; ?></td>
                                    <td rowspan="2"><?php echo $service->quantity ?></td>
                                    <td rowspan="2"><?php echo $service->discount; ?>%</td>
                                    <td rowspan="2" style="text-align: center;"><?php echo $compnay_info->currency; ?> <?php echo $service->tax_amount; ?></td>
                                    <td rowspan="2" style="border-right: 1px solid #fff;text-align:center;"><?php echo $compnay_info->currency; ?> <?php echo $service->total_amount; ?></td>
                                </tr>
                                <tr>
                                    <td style="width:180px;font-size:10px;"> <?php echo $service->description; ?></td>
                                </tr>
                                <?php
                            endforeach;
                        endif;
                        ?>
                        <tr>
                            <td colspan="5" style="border-top:1px solid #f8f8f8;background-color:#fff;"></td>
                            <td style="border-right:none;border-bottom:none;"><b>Subtotal:</b></td>
                            <td style="border-right: 1px solid #fff;border-bottom:none;"><?php echo $compnay_info->currency; ?> <?php echo $proposal_info->sub_total; ?></td>
                        </tr>
                        <tr>
                            <td colspan="5" style="border-top:1px solid #f8f8f8;background-color:#fff;" ></td>

                            <td style="border-right:none;border-bottom:none;"><b>Sales tax:</b></td>
                            <td style="border-right: 1px solid #fff; border-bottom:none;"><?php echo $compnay_info->currency; ?> <?php echo $proposal_info->sales_tax; ?></td>
                        </tr><tr>
                            <td colspan="5" style="border-top:1px solid #f8f8f8;background-color:#fff;"></td>

                            <td style="background-color:#09c;color:#fff;border-right:none;border-bottom:none;"> <b>Total:</b></td>
                            <td style="border-right: 1px solid #fff;background-color:#09c;color:#fff; border-bottom:none;"><?php echo $compnay_info->currency; ?> <?php echo $proposal_info->total; ?></td>
                        </tr>
                    </tbody>
                </table>
                <h3 style="background: none;color:#000;width:200px;border-bottom:2px solid #999;margin-top:30px;">&nbsp;</h3>
                <p><b><?php echo $compnay_info->contact_person; ?></b></p>
                <p><?php echo $compnay_info->company_name; ?></p>
                <p><?php echo $compnay_info->phone; ?></p>
                <p><?php echo $compnay_info->email_address; ?></p>

            </div>
            <!--    .section-->
            <?php
            if (isset($note) && !empty($note)):
                ?>
                <div class="section head-section " style="padding:0px 0px 15px 0px;margin:0px 0px 15px 0px;">
                    <h3>Additional note:</h3>
                    <p><?php echo $note->note; ?></p>
                </div>
                <!--    .section-->
            <?php endif; ?>
            <?php if (isset($attachments) && count($attachments) > 0): ?>
                <div class="section head-section"   style="border-bottom: none;padding:0px 0px 15px 0px;margin:0px 0px 15px 0px;">

                    <h3>Attachments:</h3>
                    <ol>
                        <?php
                        foreach ($attachments as $attachment):
                            ?>
                            <li><?php echo findattachmentName($attachment->attachment_id); ?></li>
                            <?php
                        endforeach;
                        ?>
                    </ol>
                </div>
                <!--    .section-->
                <?php endIf; ?>

            <div style="clear: both"></div>
        </div>
        <!--.main-->
    </body>
</html>