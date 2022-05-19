<!DOCTYPE html>

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->

<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->

<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->

<!--[if gt IE 8]><!-->

<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title><?php echo $proposal_info->proposal_title; ?></title>
        <link rel="shortcut icon" href="<?php echo base_url(); ?>asset/images/favicon.ico">
        <link rel="shortcut icon" href="<?php echo base_url(); ?>asset/images/favicon.png">
        <link href="<?php echo base_url(); ?>asset/css/bootstrap.min.css" rel="stylesheet">

        <script src="<?php echo base_url(); ?>asset/js/jquery.js"></script>
        <script src="<?php echo base_url(); ?>asset/js/bootstrap.min.js"></script>
        <script src="<?php echo base_url(); ?>asset/js/theme.js"></script>

        <style>

            h2{margin:0px;}

            .image_section{

                width:90%;

                height:90%;

                text-align:center;

                padding:5%

            }

            .image_section img{

                width:100%;

                height:100%;

            }



            .mobile2{text-align:right;}

            @media only screen and (min-width: 768px) and (max-width: 1169px) 

            {

                .mobile1{text-align:left;}

                .mobile2{text-align:right;}



            }

            @media only screen and (max-width: 767px) 

            {

                .mobile1{text-align:center;}

                .mobile2{text-align:center;}



            }







            /* Wide Mobile Layout: 480px. */



            @media screen and (max-width: 320px)

            {

                .mobile1{text-align:center;}

                .mobile2{text-align:center;}



            }

        </style>

        <script type="text/javascript">

            $(document).ready(function() {

     

                $(document).on("click",".view_details",function(e){

                    e.preventDefault();

                    $("#myModal").modal('show');

         

                });



                //  function doconfirm()

                // {



                //     var url=$('#accepted').attr("href");

                //     var acceptchk=$('#acceptchk').val();



                //       if(acceptchk){

                //           document.location=url;

                //     }else{

                //         alert('You must be agree with terms & conditions before proceed');

                //     }

                //   }

   



                ///////////////////  CHECK BEFOR DELETING ATTACHEMNT//////////////////////

                $("#accepted").click(function(e){

                    /*e.preventDefault();

    

          if($('#acceptchk').is(":checked")){

                $.ajax({

          url:"<?php echo base_url(); ?>admin/saveSchedule/<?php echo $proposal_info->id; ?>",

          type:"GET",

          success:function(data){

            if(data=='TRUE')

              alert('Thank you for accepting this proposal');

            else

               alert('This proposal already accepted!');

          },

          error:function(){

            alert("some thing went wrong");

          }

        });

               // document.location=url;

          }else{

              alert('You must be agree with terms & conditions before proceed');

          }*/

   

                })  

            });//jquery ends here

        </script>



    </head>



    <body>



        <div class="container">

            <div class="row" style="border-bottom:10px solid #3B44BB;padding:10px;">

                <div class="col-md-4 col-sm-4 mobile1">

                    <img src="<?php echo base_url(); ?>asset/uploads/logo/<?php echo $compnay_info->logo; ?>">

                </div>

                <div class="col-md-8 col-sm-8 mobile2">

                    <h2 style="font-size:20px;;line-height:25px"><?php echo $compnay_info->company_name; ?></h2> 

                    <h2 style="font-size:15px;;line-height:20px"><?php echo $compnay_info->address; ?></h2> 

                    <h2 style="font-size:15px;;line-height:20px"><?php echo $compnay_info->email_address; ?></h2> 

                    <h2 style="font-size:15px;;line-height:20px"><?php echo $compnay_info->phone; ?></h2> 

                </div>

            </div>





            <div class="row" style="border-bottom:2px solid #999;padding:10px;margin-bottom: 30px;">

                <div class="col-md-12">


                    <?php if (!empty($service_products)) { ?>
                        <div style="padding:10px 0px;margin-bottom:0px;padding-bottom:10px;text-align:center">

                            <h2 style="font-size:20px;;line-height:25px;color:#3B44BB"><?php echo $proposal_info->proposal_title; ?></h2>
                            <h2 style="font-size:15px;;line-height:20px">Proposal ID: <?php echo $proposal_info->id; ?></h2>

                            <div class="image_section">  

                                <?php
                                if (!empty($proposal_img)) {
                                    $sl = 1;
                                    foreach ($proposal_img as $obj) {
                                        ?>
                                        <h3 style="text-align:left;"><?php echo $sl++ . ": " . $obj['title']; ?></h3>
                                        <img title="<?php echo $obj['title']; ?>" src="<?php echo base_url(); ?>proposalPhoto/<?php echo $obj['file']; ?>" />
                                        <br /><br />
                                        <?php
                                    }
                                }
                                ?>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            </div>

        </div>



        <?php if (!empty($notes)) { ?>
            <div class="container">

                <div class="row" style="border-bottom:2px solid #999;padding:10px;margin-bottom: 30px;">

                    <div class="col-md-12">

                        <div style="padding:10px;margin-bottom:0px;">
                            <h2 style="font-size:20px;;line-height:25px;text-align:center;margin:18px 0px;color:#3B44BB">Proposal Overview</h2> 

                            <p style="font-size:14px;;line-height:18px;text-align:justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <?php echo $notes->note; ?>
                            </p>
                        </div>

                    </div>
                </div>

            </div>
        <?php } ?>


        <?php if (!empty($service_products)) { ?>
            <div class="container">

                <div class="row" style="border-bottom:2px solid #999;padding:10px;margin-bottom: 30px;">
                    <div class="col-md-12">
                        <div style="padding:10px;margin-bottom:0px;">

                            <h2 style="font-size:20px;;line-height:25px;text-align:center;margin:18px 0px;color:#3B44BB">Schedule of Work</h2>
                            <div class="table-responsive responsive-table" >
                                <table class="table table-bordered table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width:10%;text-align:center">SL No.</th>
                                            <th style="width:35%;text-align:center">Product</th>
                                            <th style="width:10%;text-align:center">Quantity</th>
                                            <th style="width:15%;text-align:center">Price per Item</th>
                                            <th style="width:10%;text-align:center">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <?php
                                        $i = 1;
                                        foreach ($service_products as $service) {
                                            ?>

                                            <tr>
                                                <td valign="top" style="text-align:center"><?php echo $i++; ?></td>
                                                <td valign="top" ><?php echo $service['name']; ?></td>
                                                <td valign="top"  style="text-align:center"><?php echo $service['quantity']; ?></td>
                                                <td valign="top"  style="text-align:center">
                                                    <b><?php echo $compnay_info->currency; ?></b> <?php echo $service['unit_price']; ?>
                                                </td>
                                                <td valign="top" style="text-align:center"><?php echo $service['total_amount']; ?></td>
                                            </tr>

                                        <?php } ?>
                                    </tbody>
                                </table>
                            </div>

                            <p style="font-size:15px;margin:5px 0 0;line-height:22px;text-align:right"><b>Sub Total: <?php echo $compnay_info->currency; ?> </b><?php echo $proposal_info->sub_total; ?> </p>
                            <p style="font-size:15px;margin:0px;;line-height:22px;text-align:right"><b>G.S.T: <?php echo $compnay_info->currency; ?></b> <?php echo $proposal_info->sales_tax; ?> </p>
                            <p style="font-size:15px;margin:0px;;line-height:22px;text-align:right"><b>Grand Total: <?php echo $compnay_info->currency; ?> </b><?php echo $proposal_info->total; ?></p>

                        </div>
                    </div>
                </div>
            </div>
        <?php } ?>

        <div class="container">



            <div class="row" style="padding:10px;margin-bottom: 30px;">

                <?php if (!empty($service_products)) { ?>
                    <div class="col-md-12">
                        <a href="<?php echo base_url(); ?>admin/proposalAcceptance/<?php echo $encrypt_key; ?>/<?php echo urlencode(encode_url('Accepted')); ?>" style="width:auto;text-decoration: none;"><button type="button"  class="btn btn-sm btn-primary" id="accepted">Accept Proposal</button></a>
                        <a href="<?php echo base_url(); ?>admin/proposalAcceptance/<?php echo $encrypt_key; ?>/<?php echo urlencode(encode_url('Decline')); ?>" style="width:auto;margin:0 0 0 15px;text-decoration: none;"><button type="button"  class="btn btn-sm btn-danger" id="decline">Decline Proposal</button></a>
                    </div>
                <?php } ?>

            </div>

            <div class="row" style="border-top:10px solid #3B44BB;padding:10px;">
                <div class="col-md-4 col-sm-4 mobile1">
                    <img src="<?php echo base_url(); ?>asset/uploads/logo/<?php echo $compnay_info->logo; ?>">
                </div>
                <div class="col-md-8 col-sm-8 mobile2">
                    <h2 style="font-size:20px;;line-height:25px"><?php echo $compnay_info->company_name; ?></h2>
                    <h2 style="font-size:15px;;line-height:20px"><?php echo $compnay_info->address; ?></h2>
                    <h2 style="font-size:15px;;line-height:20px"><?php echo $compnay_info->email_address; ?></h2>
                    <h2 style="font-size:15px;;line-height:20px"><?php echo $compnay_info->phone; ?></h2>
                </div>
            </div>





        </div>

    </body>



</html>