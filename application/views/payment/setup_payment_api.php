<style type="text/css">
    .required_star{
        color: #dd4b39;
    }

    .radio_button_problem{
        margin-bottom: 19px;
    }
    .colorpicker-alpha {display:none !important;} .colorpicker{ min-width:128px !important;}
    .front_img_preview,.back_img_preview{
        display:none;
    }
</style>

<?php
if ($this->session->flashdata('exception')) {

    echo '<section class="content-header"><div class="alert alert-success alert-dismissible"> 
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <p><i class="icon fa fa-check"></i>';
    echo $this->session->flashdata('exception');
    echo '</p></div></section>';
}
?>
<?php
if ($this->session->flashdata('exception_1')) {

    echo '<section class="content-header"><div class="alert alert-danger alert-dismissible"> 
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <p><i class="icon fa fa-check"></i>';
    echo $this->session->flashdata('exception_1');
    echo '</p></div></section>';
}
?>
<section class="content-header">
    <h1>
       Payment Method System Settings
    </h1>

</section>

<!-- Main content -->
<section class="content">
    <div class="row">

        <!-- left column -->
        <div class="col-md-12">
            <div class="box box-primary">
                <div id="done_msg"></div>
                <!-- /.box-header -->
                <!-- form start -->
                <?php echo form_open(base_url().'#', $arrayName = array('id' => 'add_api_form')) ?>
                <div class="box-body">
                    <div class="row" style="margin-top:30px; ">
                        
                        <div class="clearfix"></div>
                         <div class="col-md-3">
                            <img src="<?php echo base_url();?>assets/images/stripe.png" style="width: 106px;margin-left: 85px;margin-top: 20px;">
                           <h2 style="margin-left: 102px;font-size: 26px;margin-top: 2px;">Stripe</h2>
                  
                         </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Stripe API Secret Key <span style="display: none" class="required_star">*</span></label>
                                <input type="text" name="api_secret_key" value="" placeholder="
Stripe API Secret Key Your Stripe secret key that starts with sk_" id="api_secret_key" class="form-control">
                            </div>
                            <div class="alert alert-error modal_error" id="name_err_msg_container_ss" style="padding: 5px !important;">
                                <p id="name_err_msg_ss"></p>
                            </div> 
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Stripe Publishable Key <span style="display: none" class="required_star">*</span></label>
                                 <input type="hidden" name="id" id="s_id">
                                <input type="text" name="publishable_key" value="" placeholder="Stripe Publishable Key Your Stripe publishable key that starts with pk_" id="publishable_key" class="form-control">
                            </div>
                             <div class="alert alert-error modal_error" id="name_err_msg_container_sp" style="padding: 5px !important;">
                                <p id="name_err_msg_sp"></p>
                            </div>
                        </div>
                        <div class="col-md-3" style="margin-top: -13px;">
                            <a href="#" id="reset_s" class="btn btn-primary" style="margin-right: 2px;">Reset</a>
                            <button type="submit" name="submit" value="Stripe" id='s_' class="api_sub btn btn-primary">Save</button>
                            <?php echo form_close(); ?>
                        </div>
                         <?php echo form_open(base_url().'#', $arrayName = array('id' => 'add_api_form2')) ?>
                        <div class="clearfix"style="margin-bottom: 20px;"></div>
                          <div class="col-md-12">
                             <hr class="">
                          </div>
                           <div class="clearfix" style="margin-top: 27px;"></div>
                         <div class="col-md-3">
                            <img src="<?php echo base_url();?>assets/images/paypal.png" style="width: 106px;margin-left: 85px;">
                           <h2 style="margin-left: 102px;font-size: 26px;margin-top: 2px;">Paypal</h2>
                  
                         </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>PayPal Clinet ID <span style="display: none" class="required_star">*</span></label>
                                <input type="hidden" name="id" id="p_id">
                                <input type="text" name="clinet_id" value="" placeholder="Get your PayPal Clinet ID" id="clinet_id" class="form-control">
                            </div>
                             <div class="alert alert-error modal_error" id="name_err_msg_container_pc" style="padding: 5px !important;">
                                <p id="name_err_msg_pc"></p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Paypal Secret Key <span style="display: none" class="required_star">*</span></label>
                                <input type="text" name="secret_key" value="" placeholder="Get your Paypal Secret Key" id="secret_key" class="form-control">
                            </div>
                            <div class="alert alert-error modal_error" id="name_err_msg_container_ps" style="padding: 5px !important;">
                                <p id="name_err_msg_ps"></p>
                            </div>
                        </div>
                        
                        <div class="col-md-3" style="margin-top: -13px;">
                             <a href="#" id="reset_p" class="btn btn-primary" style="margin-right: 2px;">Reset</a>
                            <button type="submit" name="submit" id='p_api_sub' value="Paypal" class="api_sub btn btn-primary">Save</button>
                        </div>
                        <div class="clearfix"></div>

                    </div>
                </div>

                <div class="box-footer">
                    <div class="d-flex align-items-center">
                </div>
            </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</section>

<script>
    $(".required_star").show();
</script>
<script type="text/javascript" src="<?php echo base_url() ?>assets/payment_system/add_payment_api.js"></script>