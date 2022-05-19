<link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<style type="text/css">
    .required_star{
        color: #dd4b39;
    }

    .radio_button_problem{
        margin-bottom: 19px;
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
<section class="content-header">
    <h1>
        Customize Invoice Email
    </h1> 
    <p style="margin-top: 10px; color: red;">Select a placeholder, <b>COPY</b> that and <b>PASTE</b> in the editor</p>
</section> 
 
<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-8">
            <!-- general form elements -->
            <div class="box box-primary">

                <!-- /.box-header -->
                <!-- form start -->
                <?php echo form_open(base_url('Customize/invoiceEmail/')); ?>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Invoice Email Content <span class="required_star">*</span></label>
                                <textarea class="textarea" name="invoice_email" style="width: 100%; height: 400px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;" placeholder="<?php echo lang('enter'); ?> ..."><?php echo $customize_information->invoice_email; ?></textarea>
                            </div>
                            <?php if (form_error('invoice_email')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('invoice_email'); ?></p>
                                </div>
                            <?php } ?>
                        </div>  
                    </div>  
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <button type="submit" name="submit" value="submit" class="btn c-btn"><?php echo lang('submit'); ?></button>
                    <!-- <a href="<?php echo base_url() ?>Customize/invoiceEmail"><button type="button" class="btn c-btn"><?php echo lang('back'); ?></button></a> -->
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
        <div class="col-md-3" style="padding-left: 3px; padding-right: 3px;">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title" >Placeholders</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive responsive-table form-group" >
                    <input class="form-control ph" style="width:100%; text-align:left;margin-bottom:4px;" type="text" readonly="true" value="[DATE]" />
                    <input class="form-control ph" style="width:100%; text-align:left;margin-bottom:4px;" type="text" readonly="true" value="[COMPANY_NAME]" />
                    <input class="form-control ph" style="width:100%; text-align:left;margin-bottom:4px;" type="text" readonly="true" value="[CONTACT_PERSON]" />

                    <input class="form-control ph" style="width:100%; text-align:left;margin-bottom:4px;" type="text" readonly="true" value="[COMPANY_PHONE]" />
                    <input class="form-control ph" style="width:100%; text-align:left;margin-bottom:4px;" type="text" readonly="true" value="[COMPANY_EMAIL]" />
                    <input class="form-control ph" style="width:100%; text-align:left;margin-bottom:4px;" type="text" readonly="true" value="[COMPANY_ADDRESS]" />
                    <input class="form-control ph" style="width:100%; text-align:left;margin-bottom:4px;" type="text" readonly="true" value="[COMPANY_WEBSITE]" />
                    <input class="form-control ph" style="width:100%; text-align:left;margin-bottom:4px;" type="text" readonly="true" value="[CUSTOMER_FULL_NAME]" />
                    <input class="form-control ph" style="width:100%; text-align:left;margin-bottom:4px;" type="text" readonly="true" value="[CUSTOMER_CONTACT_PERSON]" />
                    <input class="form-control ph" style="width:100%; text-align:left;margin-bottom:4px;" type="text" readonly="true" value="[CUSTOMER_PHONE]" />
                    <input class="form-control ph" style="width:100%; text-align:left;margin-bottom:4px;" type="text" readonly="true" value="[CUSTOMER_EMAIL]" />
                    <input class="form-control ph" style="width:100%; text-align:left;margin-bottom:4px;" type="text" readonly="true" value="[CUSTOMER_BILLING_ADDRESS]" />
                    <input class="form-control ph" style="width:100%; text-align:left;margin-bottom:4px;" type="text" readonly="true" value="[CUSTOMER_SERVICE_ADDRESS]" />
                </div>
            </div>
        </div>
    </div>
    </div>
</section>
<script src="<?php echo base_url(); ?>assets/bower_components/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script>
  $(function () { 
    //bootstrap WYSIHTML5 - text editor
    $('.textarea').wysihtml5()
  })
</script>