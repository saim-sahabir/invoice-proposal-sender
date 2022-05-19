
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
        SMTP Email Setting
    </h1>

</section>

<!-- Main content -->
<section class="content">
    <div class="row">

        <!-- left column -->
        <div class="col-md-12">
            <div class="box box-primary">
                <!-- /.box-header -->
                <!-- form start -->
                <?php
                $company_info = json_decode($company->email_setting);
                ?>
                <?php echo form_open(base_url() . 'Emailsetting/smtpEmailSetting/', $arrayName = array('id' => 'add_whitelabel','enctype'=>'multipart/form-data')) ?>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Email Type</label>
                                <select class="form-control select2" name="enable_status" id="enable_status">
                                    <option <?=isset($company) && $company->smtp_enable_status=="0"?'selected':''?> <?php echo set_select('enable_status', "0"); ?>  value="0">None</option>
                                    <option  <?=isset($company) && $company->smtp_enable_status=="1"?'selected':''?>   <?php echo set_select('enable_status', "1"); ?>   value="1">SMTP</option>
                                </select>
                            </div>
                            <?php if (form_error('enable_status')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('enable_status'); ?></p>
                                </div>
                            <?php } ?>
                        </div>
                        <div class="clearfix"></div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>SMTP Host <span class="required_star">*</span></label>
                                <input type="text" name="host_name" placeholder="SMTP Host"  value="<?=isset($company_info) && $company_info->host_name?$company_info->host_name:set_value('host_name')?>" id="host_name" class="form-control">
                            </div>
                            <?php if (form_error('host_name')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('host_name'); ?></p>
                                </div>
                            <?php } ?>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Port Address <span style="display: none" class="required_star">*</span></label>
                                <input type="text" name="port_address" value="<?=isset($company_info) && $company_info->port_address?$company_info->port_address:set_value('port_address')?>"  placeholder="Port Address" id="port_address" class="form-control">
                            </div>
                            <?php if (form_error('port_address')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('port_address'); ?></p>
                                </div>
                            <?php } ?>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Username <span style="display: none" class="required_star">*</span></label>
                                <input type="text" name="user_name" value="<?=isset($company_info) && $company_info->user_name?$company_info->user_name:set_value('user_name')?>" placeholder="User Name" id="user_name" class="form-control">
                            </div>
                            <?php if (form_error('user_name')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('user_name'); ?></p>
                                </div>
                            <?php } ?>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Password <span style="display: none" class="required_star">*</span></label>
                                <input type="text" name="password" value="<?=isset($company_info) && $company_info->password?$company_info->password:set_value('password')?>" placeholder="Password" id="password" class="form-control">
                            </div>
                            <?php if (form_error('password')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('password'); ?></p>
                                </div>
                            <?php } ?>
                        </div>
                        <div class="clearfix"></div>

                    </div>
                </div>

                <div class="box-footer">
                    <button type="submit" name="submit" value="submit" class="btn btn-primary"><?php echo lang('submit'); ?></button>
                    <a href="<?php echo base_url() ?>Emailsetting"><button type="button" class="btn btn-primary"><?php echo lang('back'); ?></button></a>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</section>

<script>
    $(".required_star").show();
</script>