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
    <!-- Select2 -->
    <script src="<?php echo base_url(); ?>assets/bower_components/select2/dist/js/select2.full.min.js"></script>
    <!-- Select2 -->
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/select2/dist/css/select2.min.css">
    <!-- InputMask -->
    <script src="<?php echo base_url(); ?>assets/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="<?php echo base_url(); ?>assets/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="<?php echo base_url(); ?>assets/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <!-- iCheck -->
    <script src="<?php echo base_url(); ?>assets/plugins/iCheck/icheck.min.js"></script>
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/plugins/iCheck/all.css">
    <!-- Sweet alert -->
    <script src="<?php echo base_url(); ?>assets/bower_components/sweetalert2/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/sweetalert2/dist/sweetalert.min.css">
    <!-- Include a polyfill for ES6 Promises (optional) for IE11 and Android browser -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>

    <!-- Numpad -->
    <script src="<?php echo base_url(); ?>assets/bower_components/numpad/jquery.numpad.js"></script>
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/numpad/jquery.numpad.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/numpad/theme.css">
    <!--datepicker-->
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/datepicker/datepicker.css">

    <!-- bootstrap datepicker -->
    <script src="<?php echo base_url(); ?>assets/bower_components/datepicker/bootstrap-datepicker.js"></script>

    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet"
        href="<?php echo base_url(); ?>assets/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/Ionicons/css/ionicons.min.css">

    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/dist/css/jquery.mCustomScrollbar.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/dist/css/skins/_all-skins.css">
    <!-- iCheck -->
    <link href="<?php echo base_url(); ?>asset/plugins/iCheck/minimal/color-scheme.css" rel="stylesheet">
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

    <!-- Theme style -->
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/dist/css/AdminLTE.css">

    <!-- Google Font -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <style type="text/css">
        .company_info {
            min-height: 41px;
            color: white !important;
            text-align: center;
            font-weight: bold;
        }

        .breadcrumb {
            padding: 0px 5px !important;
        }

        .btn-primary {
            background-color: #3c8dbc;
        }

        .form_question {
            font-size: 24px;
            color: #3c8dbc;
            padding-top: 7px;
        }

        .main-footer {
            padding: 10px !important;
        }

        .main-footer p {
            padding-top: 10px;
        }

        .left-sdide {
            float: left !important;
        }

        .navbar-nav>.user-menu>.dropdown-menu dropdown-menu-right {
            width: 50px;
        }

        .dropdown-menu {
            border: 1px solid #3c8dbc !important;
        }

        .loader {
            display: none;
            position: fixed;
           width: 100%;
           height: 100vh;
            background: #eef0f3 no-repeat center;
          z-index: 999;
        }
        .lo_ajax{
            display: block;
     margin-left: auto;
      margin-right: auto;
       width: 310px;
       box-shadow:0 0 5px #3c3b3bcc;
       border-radius: 33px;
       position: relative;
       top: 30%;
        }


        #myModal .modal-title {
            text-align: left;
        }

        #register_details_body p {
            text-align: left;
            margin: 0px 0px 10px 0px;
        }


.sweet-alert .sa-confirm-button-container button {background-color: #3f6ad8 !important;}


    </style>
    <script>
        jQuery(document).ready(function ($) {
            $('[data-mask]').inputmask()
            $('.select2').select2()
            $(".delete").click(function (e) {
                e.preventDefault();
                var linkURL = this.href;
                warnBeforeRedirect(linkURL);
            });

            function warnBeforeRedirect(linkURL) {
                swal({
                    title: "<?php echo lang('alert') ?>!",
                    text: "<?php echo lang('are_you_sure') ?>?",
                    cancelButtonText: '<?php echo lang('
                    cancel '); ?>',
                    confirmButtonText: '<?php echo lang('
                    ok '); ?>',
                    confirmButtonColor: '#3f6ad8',
                    showCancelButton: true
                }, function () {
                    window.location.href = linkURL;
                });
            }
            //iCheck for checkbox and radio inputs
            $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                checkboxClass: 'icheckbox_minimal-blue',
                radioClass: 'iradio_minimal-blue'
            })

        });

//////////////////////////////////////////////////hhh///////
 $(document).ready(function() {
                $('.integerchk').keydown(function(e) {
                    var keys = e.charCode || e.keyCode || 0;
                    // allow backspace, tab, delete, enter, arrows, numbers and keypad numbers ONLY
                    // home, end, period, and numpad decimal
                    return (
                    keys == 8 || 
                        keys == 9 ||
                        keys == 13 ||
                        keys == 46 ||
                        keys == 110 ||
                        keys == 86 ||
                        keys == 190 ||
                        (keys >= 35 && keys <= 40) ||
                        (keys >= 48 && keys <= 57) ||
                        (keys >= 96 && keys <= 105));
                });

                $('.integerchk').keyup(function(e) {
                    var value = $(this).val();
                    var re = /^[0-9.]*$/;
                   
            
                    var number = ($(this).val().split('.'));
                    if (number[1].length > 2)
                    {
                       var pre   = $('#precision_val').val();
                        var parcent = parseFloat(value);
                        $(this).val( parcent.toFixed(pre));
                    }
                    if (! re.test(value)) // OR if (/^[0-9]{1,10}$/.test(+tempVal) && tempVal.length<=10) 
                        $(this).val('');

                });
            });




    </script>

    <script>
        $(function () {

            //Date picker
            $('#date').datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true
            });
            $('#dates2').datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true
            });
            $('.customDatepicker').datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true
            });
            $(".datepicker_months").datepicker({
                format: 'yyyy-M',
                autoclose: true,
                viewMode: "months",
                minViewMode: "months"
            });
        })

        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();

        if (dd < 10) {
            dd = '0' + dd
        }

        if (mm < 10) {
            mm = '0' + mm
        }
        today = yyyy + '-' + mm + '-' + dd;
    </script>
</head>

<div class="loader">
    <img src="<?php echo base_url(); ?>assets/ajax_loder.gif"class='lo_ajax'>
</div>
<!-- ADD THE CLASS sidebar-collapse TO HIDE THE SIDEBAR PRIOR TO LOADING THE SITE -->
<input type="hidden" id="precision_val" value="<?php $Cid =$this->session->userdata('company_id'); $Cdata = companyInformation($Cid); echo $Cdata->precision; ?>">
<body class="hold-transition skin-blue sidebar-mini">
    <!--<body class="hold-transition skin-blue sidebar-collapse sidebar-mini">-->
    <!-- Site wrapper -->
    <div class="wrapper">

        <header class="main-header">
            <!-- Logo -->
            <a href="#" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini">FP</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg">
                    <img src="<?php echo base_url(); ?>assets/site_identity/logo.png">
                </span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>

                <div class="navbar-custom-menu left-sdide">
                    <ul class="nav navbar-nav">  
                        <li class="dropdown user user-menu">
                            <a href="<?php echo base_url();?>Proposal/addEditProposalInvoice">
                                <i class="fa fa-plus"></i>
                                <span class="hidden-xs">Add Proposal/Invoice</span>
                            </a>
                        </li>  
                        <li class="dropdown user user-menu">
                            <a href="<?php echo base_url();?>Expense/addEditExpense">
                                <i class="fa fa-plus"></i>
                                <span class="hidden-xs">Add Expense</span>
                            </a>
                        </li> 
                    </ul>
                </div>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- <li class="dropdown messages-menu open" style="width: 150px;padding-top: 12px;">
                            <?php $language=$this->session->userdata('language'); ?>
                            <?php echo form_open(base_url() . 'Authentication/setlanguage', $arrayName = array('id' => 'language')) ?>
                            <select class="form-control select2" name="language" style="width: 100%;"
                                onchange='this.form.submit()'>
                                <option value="english" <?php if(isset($language)){
                                    if ($language == 'english') 
                                        echo "selected";
                                    }  
                                    ?>>English</option>
                                <option value="spanish" <?php if(isset($language)){
                                    if ($language == 'spanish') 
                                        echo "selected";
                                    }  
                                    ?>>Spanish</option>
                                <<option value="french" <?php if(isset($language)){
                                    if ($language == 'french') 
                                        echo "selected";
                                    }
                                    ?>>French</option>
                                    <option value="arabic" <?php if(isset($language)){
                                    if ($language == 'arabic') 
                                        echo "selected";
                                    } 
                                    ?>>Arabic</option>
                            </select>
                            </form>
                        </li> -->
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="<?php echo base_url(); ?>Authentication/logOut">Logout
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <!-- Left side column. contains the sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="<?php echo base_url(); ?>assets/images/avatar.jpg" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p><?php echo $this->session->userdata('full_name'); ?></p>
                        <p><?php echo $this->session->userdata('role'); ?></p>
                    </div>
                </div>
                <ul class="sidebar-menu">
                    <li class="header"><?php echo lang('main_navigation'); ?></li>
                </ul>
                <div id="left_menu_to_scroll">
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu" data-widget="tree">
                        <li>
                            <a href="<?php echo base_url(); ?>Authentication/userProfile"><i class="fa fa-home"></i>
                                <span><?php echo lang('home'); ?></span></a>
                        </li> 
                        <li>
                            <a href="<?php echo base_url(); ?>Dashboard/dashboard"><i class="fa fa-dashboard"></i><span>Dashboard</span></a>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-gear"></i> <span>Setup</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu"> 
                                <li>
                                    <a href="<?php echo base_url(); ?>Company_your_profile/profile/<?php echo $this->session->userdata('company_id')?>">
                                    <i class="fa fa-angle-double-right"></i>Company/Your Profile</a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url(); ?>Tax_setting/taxSetting">
                                    <i class="fa fa-angle-double-right"></i>Tax Setting</a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url(); ?>Emailsetting/smtpEmailSetting">
                                    <i class="fa fa-angle-double-right"></i>Email Setting</a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url(); ?>Product_service/productsServices">
                                    <i class="fa fa-angle-double-right"></i>Products/Services</a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url(); ?>Customer/customers">
                                    <i class="fa fa-angle-double-right"></i>Customers</a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url(); ?>Attachment/attachments">
                                    <i class="fa fa-angle-double-right"></i>Attachments</a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url(); ?>Expense_item/expenseItems">
                                    <i class="fa fa-angle-double-right"></i>Expense Items</a>
                                </li>
                                 <li>
                                    <a href="<?php echo base_url(); ?>Payment_system/api_settings">
                                    <i class="fa fa-angle-double-right"></i>Payment System Settings</a>
                                </li>
                            </ul>
                        </li>  
                        <li>
                            <a href="<?php echo base_url(); ?>Proposal/proposals"><i class="fa fa-file"></i><span> Proposal</span></a>
                        </li> 
                        <li>
                            <a href="<?php echo base_url(); ?>Invoice/invoices"><i class="fa fa-file"></i><span> Invoice</span></a>
                        </li> 
                        <li>
                            <a href="<?php echo base_url(); ?>Expense/expenses"><i class="fa fa-money"></i><span> Expense</span></a>
                        </li> 
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-gear"></i> <span>Customize</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu"> 
                                <li>
                                    <a href="<?php echo base_url(); ?>Customize/proposalBody">
                                    <i class="fa fa-angle-double-right"></i>Proposal Body</a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url(); ?>Customize/proposalEmail">
                                    <i class="fa fa-angle-double-right"></i>Proposal Email</a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url(); ?>Customize/invoiceEmail">
                                    <i class="fa fa-angle-double-right"></i>Invoice Email </a>
                                </li> 
                            </ul>
                        </li>  
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-file-text"></i> <span>Report</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu"> 
                                <li>
                                    <a href="<?php echo base_url(); ?>Report/proposalReport">
                                    <i class="fa fa-angle-double-right"></i>Proposal Report</a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url(); ?>Report/invoiceReport">
                                    <i class="fa fa-angle-double-right"></i>Invoice Report</a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url(); ?>Report/expenseReport">
                                    <i class="fa fa-angle-double-right"></i>Expense Report</a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url(); ?>Report/incomeReport">
                                    <i class="fa fa-angle-double-right"></i>Income Report</a>
                                </li> 
                            </ul>
                        </li>   
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-user"></i> <span>Account</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu"> 
                                <li>
                                    <a href="<?php echo base_url(); ?>Authentication/changePassword">
                                    <i class="fa fa-angle-double-right"></i>Change Password</a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url(); ?>Authentication/changeUserProfile">
                                    <i class="fa fa-angle-double-right"></i>User Profile</a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url(); ?>User/users">
                                    <i class="fa fa-angle-double-right"></i>Manage Users</a>
                                </li> 
                            </ul>
                        </li>
                    </ul>
                </div>
            </section>
            <!-- /.sidebar -->
        </aside>

        <!-- =============================================== -->

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Main content -->

            <?php
                if (isset($main_content)) {
                    echo $main_content;
                }
                ?>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
    
        <footer class="main-footer">
            <div class="row">
                <div class="col-md-12" style="text-align: center;">
                    <strong>FlyPapyrus - Proposal and Invoice Management System</strong>
                    <div class="hidden-lg">

                    </div>
                </div>
            </div>
        </footer>
    </div> 
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/style.css">
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
    <!-- custom scrollbar plugin -->
    <script src="<?php echo base_url(); ?>assets/dist/js/jquery.mCustomScrollbar.concat.min.js"></script>
    
    <script>
        var window_height = $(window).height();
        var main_header_height = $('.main-header').height();
        var user_panel_height = $('.user-panel').height();
        var left_menu_height_should_be = (parseFloat(window_height) - (parseFloat(main_header_height) + parseFloat(
            user_panel_height))).toFixed(2);
        left_menu_height_should_be = (parseFloat(left_menu_height_should_be) - parseFloat(60)).toFixed(2);
        $("#left_menu_to_scroll").css('height', left_menu_height_should_be + 'px');
        // $("#left_menu_to_scroll").mCustomScrollbar();
        $("#left_menu_to_scroll").mCustomScrollbar({
            theme: "light",
            autoHideScrollbar: true,
            scrollInertia: 300
        });
        var currency = "<?php echo $this->session->userdata('currency') ?>";
        var base_url = "<?php echo base_url(); ?>"; 
    </script>
</body>

</html>