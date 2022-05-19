<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>FlyPapyrus - Proposal and Invoice Management System</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- jQuery 3 -->
        <script src="<?php echo base_url(); ?>assets/bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/Ionicons/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/dist/css/AdminLTE.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/plugins/iCheck/square/blue.css">
        <!-- Favicon -->
        <link rel="shortcut icon" href="<?php echo base_url(); ?>assets/site_identity/favicon.ico" type="image/x-icon">
        <!-- Favicon -->
        <link rel="icon" href="<?php echo base_url(); ?>assets/site_identity/favicon.ico" type="image/x-icon">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Google Font -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
        <style type="text/css">
            body{
                font-family: sans-serif;
            }
            .btn {
                display: inline-block;
                padding: 6px 12px;
                margin-bottom: 0;
                font-size: 14px;
                font-weight: normal;
                line-height: 1.428571429;
                text-align: center;
                white-space: nowrap;
                vertical-align: middle;
                cursor: pointer;
                border: 1px solid transparent;
                border-radius: 4px;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                -o-user-select: none;
                user-select: none;
            }

            .btn:focus {
                outline: thin dotted #333;
                outline: 5px auto -webkit-focus-ring-color;
                outline-offset: -2px;
            }

            .btn:hover,
            .btn:focus {
                color: #333333;
                text-decoration: none;
            }

            .btn:active,
            .btn.active {
                background-image: none;
                outline: 0;
                -webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
                box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
            }

            .btn-primary {
                color: #ffffff;
                background-color: #0C5889;
                border-color: #0C5889;
            }

            .btn-primary:hover,
            .btn-primary:focus,
            .btn-primary:active,
            .btn-primary.active,
            .open .dropdown-toggle.btn-primary {
                color: #ffffff;
                background-color: #3276b1;
                border-color: #285e8e;
            }

            .btn-primary:active,
            .btn-primary.active,
            .open .dropdown-toggle.btn-primary {
                background-image: none;
            }

            .btn-primary.disabled,
            .btn-primary[disabled],
            fieldset[disabled] .btn-primary,
            .btn-primary.disabled:hover,
            .btn-primary[disabled]:hover,
            fieldset[disabled] .btn-primary:hover,
            .btn-primary.disabled:focus,
            .btn-primary[disabled]:focus,
            fieldset[disabled] .btn-primary:focus,
            .btn-primary.disabled:active,
            .btn-primary[disabled]:active,
            fieldset[disabled] .btn-primary:active,
            .btn-primary.disabled.active,
            .btn-primary[disabled].active,
            fieldset[disabled] .btn-primary.active {
                background-color: #428bca;
                border-color: #357ebd;
            }

            .btn-warning {
                color: #ffffff;
                background-color: #f0ad4e;
                border-color: #eea236;
            }

            .btn-warning:hover,
            .btn-warning:focus,
            .btn-warning:active,
            .btn-warning.active,
            .open .dropdown-toggle.btn-warning {
                color: #ffffff;
                background-color: #ed9c28;
                border-color: #d58512;
            }

            .btn-warning:active,
            .btn-warning.active,
            .open .dropdown-toggle.btn-warning {
                background-image: none;
            }

            .btn-warning.disabled,
            .btn-warning[disabled],
            fieldset[disabled] .btn-warning,
            .btn-warning.disabled:hover,
            .btn-warning[disabled]:hover,
            fieldset[disabled] .btn-warning:hover,
            .btn-warning.disabled:focus,
            .btn-warning[disabled]:focus,
            fieldset[disabled] .btn-warning:focus,
            .btn-warning.disabled:active,
            .btn-warning[disabled]:active,
            fieldset[disabled] .btn-warning:active,
            .btn-warning.disabled.active,
            .btn-warning[disabled].active,
            fieldset[disabled] .btn-warning.active {
                background-color: #f0ad4e;
                border-color: #eea236;
            }

            .btn-danger {
                color: #ffffff;
                background-color: #d9534f;
                border-color: #d43f3a;
            }

            .btn-danger:hover,
            .btn-danger:focus,
            .btn-danger:active,
            .btn-danger.active,
            .open .dropdown-toggle.btn-danger {
                color: #ffffff;
                background-color: #d2322d;
                border-color: #ac2925;
            }

            .btn-danger:active,
            .btn-danger.active,
            .open .dropdown-toggle.btn-danger {
                background-image: none;
            }

            .btn-danger.disabled,
            .btn-danger[disabled],
            fieldset[disabled] .btn-danger,
            .btn-danger.disabled:hover,
            .btn-danger[disabled]:hover,
            fieldset[disabled] .btn-danger:hover,
            .btn-danger.disabled:focus,
            .btn-danger[disabled]:focus,
            fieldset[disabled] .btn-danger:focus,
            .btn-danger.disabled:active,
            .btn-danger[disabled]:active,
            fieldset[disabled] .btn-danger:active,
            .btn-danger.disabled.active,
            .btn-danger[disabled].active,
            fieldset[disabled] .btn-danger.active {
                background-color: #d9534f;
                border-color: #d43f3a;
            }
            /* kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk */
            #main{
                width: 860px;
                margin:0 auto;
                /*border:1px solid #ccc;*/
                padding:10px;
                overflow: hidden;
            }
            section {
                background: #fff none repeat scroll 0 0;
                margin-left: 17%;
                text-align: left;
            }
            .section{
                padding:10px;
                /*border-bottom:1px solid #ccc;*/
                margin-bottom:15px;
                padding-bottom:15px;
                overflow: hidden;
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
                padding:10px 4px;
                width:100%;
                color:<?php echo $proposal_info->template_text_color; ?>;
            }
            .standard p{
                margin: 3px;
                color:<?php echo $proposal_info->template_text_color; ?>;
                line-height: 23px;

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
            table tbody tr td{
                background-color: #f5f5f5;
                border:none;
                border-right:1px solid #fff;
                border-bottom:1px solid #fff;   
                border: none;  

            }
            table thead tr th{
                background-color: <?php echo $proposal_info->template_bg_color; ?>;
                padding:10px;
                text-align: center;
                color:<?php echo $proposal_info->template_text_color; ?>;
                border-color:#fff;
            }
            table thead tr th{
                text-align: left;
            }
            img.logo{
                width:140px;
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
            .textcolor{
                color:<?php echo $proposal_info->template_text_color; ?>;
            }
            .table thead > tr > th {
                border-bottom: 0px solid #ddd;
                vertical-align: bottom;
            }
            header {
                padding:  0;
            }

        </style>
    </head>
    <body>
       
        <div class="container fluid">
        <ul class="navber nav" style="display: flex;">
            <li>
                <a href="#services" class="cc-active">Pricing</a></li>
            <?php
            if (isset($proposal_info) && !empty($proposal_info->note)):
                ?>
                <li><a href="#features" class="cc-active">Aditional Note</a></li>
            <?php endif; ?>
            <?php
            if (isset($photos) && !empty($photos)):
                ?>
                <li><a href="#benefits" class="cc-active">Photos</a></li>
            <?php endif; ?>
            <?php
            if (isset($attachments) && !empty($attachments)):
                ?>
                <li><a href="#attachments" class="cc-active">Attachments</a></li>
            <?php endif; ?>
            <li><a href="#acceptance" class="cc-active">Accept/Decline</a></li>
        </ul>

            <section style="margin-left: 0px;">

                <div class="container">

                    <div class="docs-content" style="box-shadow: 0px 1px 5px 0px #00000054;">
                        <!-- //////////Products/Services area ///////// -->
                        <div id="main" style="margin-top: 5px;">
                            <div class="section head-section standard"  id="services" style="margin-top: 50px; background-color:<?php echo $proposal_info->template_bg_color; ?>;">
                                <div class="segment left" >
                                    <p><img src="<?php echo base_url(); ?>files/logo/<?php echo $compnay_info->logo; ?>" class="logo"/> </p>
                                    <p class="textcolor">Proposal Number: <?php echo $proposal_info->proposal_no; ?></p>
                                    <p class="textcolor">Date: <?php echo $proposal_info->date; ?></p>
                                </div>
                                <!--        segment left-->
                                <div class="segment right" style="width: 330px;text-align: right;padding-right: 10px">
                                    <h2 style="padding:0px;margin:0px;text-indent:0px;margin-right: 3px"><?php echo $compnay_info->name_company_name; ?></h2>
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
                                    echo $customer_info->name . ", ";
                                    echo "Phone: " . $customer_info->phone . ", Email: " . $customer_info->email;
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
                                            <th style="width:6%;text-align: center;">SN</th>
                                            <th style="width:20%;">Product/Service</th>
                                            <th  style="width:10%;text-align: center;">Unit Price</th>
                                            <th style="width:10%;text-align: center;">Quantity</th>
                                            <th style="width:10%;text-align: center;">Tax (%)</th>
                                            <th style="width:18%;text-align: center;">Tax</th>
                                            <th style="width:10%;text-align: center;">Amount</th>
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
                                                    <td rowspan="2" style="border-right: 1px solid #fff;text-align:center;"><?php echo $compnay_info->currency; ?><?php echo $service->total; ?></td>
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
                                            <td style="border-right: 1px solid #fff;border-bottom:none;text-align: center;"><?php echo $compnay_info->currency; ?><?php echo $proposal_info->subtotal; ?></td>
                                        </tr>
                                        <tr style="border-bottom: 1px solid #fff;">
                                            <td colspan="5" style="border-top:1px solid #fff;background-color:#fff;" ></td>
                                            <td style="border-right:none;border-bottom:none;"><b>Discount (-):</b></td>
                                            <td style="border-right: 1px solid #fff; border-bottom:none;text-align: center;">
                                                <?php
                                                if ($proposal_info->discount_type == 1)
                                                    echo "$proposal_info->discount_value%";
                                                else
                                                    echo "$compnay_info->currency$proposal_info->discount_value";
                                                ?></td>
                                        </tr>

                                        <tr style="border-bottom: 1px solid #fff;">
                                            <td colspan="5" style="border-top:1px solid #fff;background-color:#fff;" ></td>
                                            <td style="border-right:none;border-bottom:none;"><b>Total Tax (+):</b></td>
                                            <td style="border-right: 1px solid #fff; border-bottom:none;text-align: center;"><?php echo $compnay_info->currency; ?><?php echo $proposal_info->tax; ?></td>
                                        </tr>
                                        <tr style="border-bottom: 1px solid #fff;">
                                            <td colspan="5" style="border-top:1px solid #fff;background-color:#fff;"></td>
                                            <td style="border-right:none;border-bottom:none;"><b>Shipping/Other (+):</b></td>
                                            <td style="border-right: 1px solid #fff;border-bottom:none;text-align: center;"><?php echo $compnay_info->currency; ?><?php echo $proposal_info->shipping_other; ?></td>
                                        </tr>
                                        <tr style="border-bottom: 1px solid #fff;">
                                            <td colspan="5" style="border-top:1px solid #fff;background-color:#fff;"></td>
                                            <td style="background-color:<?php echo $proposal_info->template_bg_color; ?>;color:<?php echo $proposal_info->template_text_color; ?>;border-right:none;border-bottom:none;"> <b>Grand Total:</b></td>
                                            <td style="border-right: 1px solid #fff;background-color:<?php echo $proposal_info->template_bg_color; ?>;color:<?php echo $proposal_info->template_text_color; ?>; border-bottom:none;text-align: center;"><?php echo $compnay_info->currency; ?><?php echo $proposal_info->grand_total; ?></td>
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
                        <!-- /////////// End Services area////////// -->

                        <!-- /////// Additional Note Area ////// -->

                        <div id="main">
                            <?php
                            if (isset($proposal_info) && !empty($proposal_info->note)):
                                ?>
                                <div class="section head-section"  id="features" style="padding:0px 0px 15px 0px;margin:0px 0px 15px 0px;">
                                    <h3>Additional Note:</h3>
                                    <p><?php echo $proposal_info->note; ?></p>
                                </div>
                                <!--    .section-->
                            <?php endif; ?>
                            <div style="clear: both"></div>
                        </div>

                        <!-- ////// Note end area////////////  -->

                        <!-- /////////Photo area start/////// -->
                        <div id="main">
                            <?php if (isset($photos) && count($photos) > 0): ?>
                                <div class="section head-section" id="benefits"  style="border-bottom: none;padding:0px 0px 15px 0px;margin:0px 0px 15px 0px;">
                                    <h3>Photos:</h3>
                                    <?php
                                    foreach ($photos as $rows):
                                        ?>
                                        <p style="font-size: 15px;font-weight: 600;margin:5px 0px">
                                            <?php echo $rows->title; ?>
                                        </p>

                                        <p style="margin:5px -5px;">
                                            <img src="<?php echo base_url();?>proposalPhoto/<?php $photo = str_replace(' ','',$rows->file); echo $photo;?>">
                                        </p>
                                        <?php
                                    endforeach;
                                    ?>
                                </div>
                                <!--    .section-->
                            <?php endif; ?>

                            <div style="clear: both"></div>
                        </div>
                        <!-- /////////// Photo End/////////////// -->
                        <!-- /////////Photo area start/////// -->
                        <div id="main">
                            <?php if (isset($attachments) && count($attachments) > 0): ?>
                                <div class="section head-section"  id="attachments" style="border-bottom: none;padding:0px 0px 15px 0px;margin:0px 0px 15px 0px;">

                                    <h3>Attachments:</h3>
                                    <ol>
                                        <?php
                                        foreach ($attachments as $attachment):
                                            ?>
                                            <li style="margin-bottom: 10px"><?php echo $attachment->title; ?>&nbsp;&nbsp;
                                                <a href="<?php echo base_url(); ?>mailcontroller/downloadPDF/<?php echo $attachment->file; ?>" style="width:auto;text-decoration: none;"> <button type="button"  class="btn btn-sm btn-primary">Download</button></a>
                                            </li>
                                            <?php
                                        endforeach;
                                        ?>
                                    </ol>
                                </div>
                                <!--    .section-->
                            <?php endif; ?>

                            <div style="clear: both"></div>
                        </div>
                        <!-- /////////// Photo End/////////////// -->
                        <!-- ////////// Start Acept///////// -->
                        <div id="main">
                            <?php if (!empty($service_products)) { //echo $proposal_id; exit();  ?>
                                <div class="section head-section"  id="acceptance" style="border-bottom: none;padding:0px 0px 15px 0px;margin:0px 0px 15px 0px;">
                                    <h3> Accept/Decline</h3>
                                    <div class="col-md-12" style="text-align: center;">
                                        <a href="<?php echo base_url(); ?>mailcontroller/proposalAcceptance/<?php echo urlencode(encode_url($proposal_id)); ?>/<?php echo urlencode(encode_url('Accepted')); ?>" style="width:auto;text-decoration: none;"><button type="button"  class="btn btn-sm btn-primary" id="accepted">Accept</button></a>
                                        <a href="<?php echo base_url(); ?>mailcontroller/proposalAcceptance/<?php echo urlencode(encode_url($proposal_id)); ?>/<?php echo urlencode(encode_url('Declined')); ?>" style="width:auto;margin:0 0 0 15px;text-decoration: none;"><button type="button"  class="btn btn-sm btn-danger" id="decline">Decline</button></a>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>
                        <!-- //////// end accept////// -->
                    </div>
            </section>

        </div>
        
        <!-- Bootstrap 3.3.7 -->
        <script src="<?php echo base_url(); ?>assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- SlimScroll -->
        <script src="<?php echo base_url(); ?>assets/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="<?php echo base_url(); ?>assets/bower_components/fastclick/lib/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="<?php echo base_url(); ?>assets/dist/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="<?php echo base_url(); ?>assets/dist/js/demo.js"></script>

    </body>
</html>
