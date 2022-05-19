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
            .credit{
                text-align: center;
                padding: 5px;
            }
        </style>
        <script>
            

        </script>

        <style type="text/css">
          
          .quick-accessbar{
                background-color:#fff;
                color:#0C5889;;
                padding:5px;
                margin-bottom:20px;
                border:1px solid #0C5889;

                z-index: 1000;
                margin:0px;
                padding:5px;
                margin-bottom:20px;
                border-right:none;
                border-left:none;
            }
            .quick-accessbar h3{
                margin: 0px;
                margin-top:2px;
                color:#0C5889;


            }

            .qbtn{

            }
            @media (max-width: 460px) {
                .quick-area{

                }
                .quick-accessbar h3{
                    display: none;
                    /*   text-align: center;
                    font-size:20px;
                    margin:4px; */
                }
                .qbtn{
                    display: inline;

                    padding:4px;
                    font-size:12px;
                    overflow:hidden;
                    margin-bottom:5px; 
                }
            }

        </style>
    </head>
    <body class="hold-transition">
   <section class="row container-fluid" style="margin-top:33px;min-height:430px;z-index: 300;margin-right:0px;margin-left:0px;padding:0px;">
        
<div class="container col-md-12">
    <div class="row">&nbsp;</div>
    <div class="row">&nbsp;</div>
    <div class="col-md-8 col-md-offset-2">
        <div class="row">

            <?php if ($message == 1) { ?>
                <div class="alert alert-success" style="padding-bottom:20px;">
                    <h2 align="center">This Proposal has been accepted successfully.</h2>
                </div>
            <?php } else if ($message == 2) { ?>
                <div class="alert alert-danger" style="padding-bottom:20px;">
                    <h2 align="center">The Proposal has been declined successfully.</h2>
                </div>
            <?php } else { ?>
                <div class="alert alert-danger" style="padding-bottom:20px;">
                    <h2 align="center" style="font-size:22px;">Sorry, the proposal already accepted or declined by the customer.</h2>
                </div>
            <?php } ?>

        </div>
        <!-- .row -->
    </div>
    <!-- col-md-8 col-md-offset-2 -->
</div>
<!-- container col-md-12 -->
</section>



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








