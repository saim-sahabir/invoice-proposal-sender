<style type="text/css">
    .required_star{
        color: #dd4b39;
    }

    .radio_button_problem{
        margin-bottom: 19px;
    }
</style> 
<section class="content-header">
    <h1>
        Edit Customer
    </h1> 
</section> 
<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">

                <!-- /.box-header -->
                <!-- form start -->
                <?php echo form_open(base_url('Customer/addEditCustomer/'. $encrypted_id)); ?>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-4">

                            <div class="form-group">
                                <label>Name/Company Name <span class="required_star">*</span></label>
                                <input type="text" name="name" class="form-control" placeholder="Name/Company Name" value="<?php echo $customer_information->name; ?>">
                            </div>
                            <?php if (form_error('name')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('name'); ?></p>
                                </div>
                            <?php } ?>
                        </div>
                        <div class="col-md-4"> 
                            <div class="form-group">
                                <label>Contact Person <span class="required_star">*</span></label>
                                <input type="text" name="c_person" class="form-control" placeholder="Contact Person" value="<?php echo $customer_information->c_person; ?>">
                            </div>
                            <?php if (form_error('c_person')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('c_person'); ?></p>
                                </div>
                            <?php } ?>
                        </div> 
                        <div class="col-md-4"> 
                            <div class="form-group">
                                <label><?php echo lang('phone'); ?> <span class="required_star">*</span></label> 
                                <input type="text" name="phone" class="form-control integerchk" placeholder="<?php echo lang('phone'); ?>" value="<?php echo $customer_information->phone; ?>">
                            </div>
                            <?php if (form_error('phone')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('phone'); ?></p>
                                </div>
                            <?php } ?>  
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label><?php echo lang('email'); ?></label>
                                <input type="text" name="email" class="form-control" placeholder="<?php echo lang('email'); ?>" value="<?php echo $customer_information->email; ?>">
                            </div>
                            <?php if (form_error('email')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('email'); ?></p>
                                </div>
                            <?php } ?>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Website</label>
                                <input  type="text" name="website" class="form-control" placeholder="Website" value="<?php echo $customer_information->website; ?>">
                            </div>
                            <?php if (form_error('website')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('website'); ?></p>
                                </div>
                            <?php } ?> 
                        </div>  

                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Billing Address <span class="required_star">*</span></label>
                                <textarea type="text" rows="2" name="billing_address" class="form-control" placeholder="Billing Address" style="border-radius: 5px;"><?php echo $customer_information->billing_address; ?></textarea> 
                            </div>
                            <?php if (form_error('billing_address')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('billing_address'); ?></p>
                                </div>
                            <?php } ?> 
                        </div> 
                   
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Service Address </label> 
                                <textarea class="form-control" rows="2" name="address" placeholder="Service Address"style="border-radius: 5px;"><?php echo $this->input->post('address'); ?> <?php echo $customer_information->address; ?></textarea>
                            </div>
                            <?php if (form_error('address')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('address'); ?></p>
                                </div>
                            <?php } ?> 
                        </div>     
                                 
                        <?php if($this->session->userdata('tax_is_gst') == 'Yes'){?>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label><?php echo lang('gst_number'); ?></label>
                                <input type="text" name="gst_number" class="form-control" placeholder="<?php echo lang('gst_number'); ?>" value="<?php echo $customer_information->gst_number; ?>">
                            </div>
                            <?php if (form_error('gst_number')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('gst_number'); ?></p>
                                </div>
                            <?php } ?>
                        </div>
                        <?php } ?>
                    </div>
                    </div>
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <button type="submit" name="submit" value="submit" class="btn c-btn"><?php echo lang('submit'); ?></button>
                    <a href="<?php echo base_url() ?>Customer/customers"><button type="button" class="btn c-btn"><?php echo lang('back'); ?></button></a>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</section>