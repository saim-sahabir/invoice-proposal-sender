
<?php
if ($this->session->flashdata('exception')) {

    echo '<section class="content-header"><div class="alert alert-success alert-dismissible"> 
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <p><i class="icon fa fa-check"></i>';
    echo $this->session->flashdata('exception');
    echo '</p></div></section>';
}
?> 

<style type="text/css">
    .required_star{
        color: #dd4b39;
    }

    .radio_button_problem{
        margin-bottom: 19px;

}

.select2-container--default .select2-selection--single,
.select2-selection .select2-selection--single {
  border: 1px solid #d2d6de;
 border-radius: 5px !important;
  padding: 6px 12px;
  height: 34px;
}

.cs{
    border-radius: 5px;
}

    
</style> 
<section class="content-header">
    <h1>
        Company/Your Profile
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
                <?php echo form_open(base_url('Company_your_profile/profile/'. $this->session->userdata('company_id')), array('enctype' => 'multipart/form-data')); ?>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Name/Company Name <span class="required_star">*</span></label>
                                <input type="text" name="name_company_name" class="form-control" placeholder="Name/Company Name" value="<?php echo $company_information->name_company_name; ?>">
                            </div>
                            <?php if (form_error('name_company_name')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('name_company_name'); ?></p>
                                </div>
                            <?php } ?>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Contact Person <span class="required_star">*</span></label> 
                                <input type="text" name="contact_person" class="form-control " placeholder="Contact Person" value="<?php echo $company_information->contact_person; ?>">
                            </div>
                            <?php if (form_error('contact_person')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('contact_person'); ?></p>
                                </div>
                            <?php } ?>  
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label><?php echo lang('phone'); ?> <span class="required_star">*</span></label> 
                                <input type="text" name="phone" class="form-control integerchk" placeholder="<?php echo lang('phone'); ?>" value="<?php echo $company_information->phone; ?>">
                            </div>
                            <?php if (form_error('phone')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('phone'); ?></p>
                                </div>
                            <?php } ?>  
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label><?php echo lang('email'); ?> <span class="required_star">*</span></label>
                                <input type="text" name="email" class="form-control" placeholder="<?php echo lang('email'); ?>" value="<?php echo $company_information->email; ?>">
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
                                <input  type="text" name="website" class="form-control" placeholder="Website" value="<?php echo $company_information->website; ?>">
                            </div>
                            <?php if (form_error('website')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('website'); ?></p>
                                </div>
                            <?php } ?> 
                        </div> 
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Address <span class="required_star">*</span></label> 
                                <textarea class="form-control cs" rows="3" name="address" placeholder="Address"><?php echo $company_information->address; ?></textarea>
                            </div>
                            <?php if (form_error('address')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('address'); ?></p>
                                </div>
                            <?php } ?> 
                        </div> 
                    </div> 
                    <div class="row"> 

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Currency <span class="required_star">*</span></label>
                                <input  type="text" name="currency" class="form-control" placeholder="Currency" value="<?php echo $company_information->currency; ?>">
                            </div>
                            <?php if (form_error('currency')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('currency'); ?></p>
                                </div>
                            <?php } ?> 
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Currency Position <span class="required_star">*</span></label>
                                <select class="form-control select2" name="currency_position" id="currency_position" style="width: 100%; border-radius:5px; ">
                                    <option value=""><?php echo lang('select'); ?></option>
                                    <option <?= isset($company_information) && $company_information->currency_position == "Left" ? 'selected' : '' ?>  value="Left">After Amount</option>
                                    <option <?= isset($company_information) && $company_information->currency_position == "Right" ? 'selected' : '' ?> value="Right">Before Amount</option>
                                </select>
                            </div>
                            <?php if (form_error('currency_position')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('currency_position'); ?></p>
                                </div>
                            <?php } ?>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Timezone <span class="required_star">*</span></label>
                                <select class="form-control select2" id="timezone" name="timezone" style="width: 100%;border-radius:5px;">
                                    <option value=""><?php echo lang('select'); ?></option>
                                    <?php foreach ($timezones as $timezone) { ?>
                                        <option <?= isset($company_information) && $company_information->timezone == $timezone->zone_name ? 'selected' : '' ?> value="<?= $timezone->zone_name ?>"><?= $timezone->zone_name ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <?php if (form_error('time_zone')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('time_zone'); ?></p>
                                </div>
                            <?php } ?> 
                        </div> 
                        <div class="col-md-4">
                            <div class="form-group">
                                <label> <?php echo lang('date_format'); ?> <span class="required_star">*</span></label>
                                <select class="form-control select2" name="date_format" id="date_format" style="width: 100%;border-radius:5px;">
                                    <option value=""><?php echo lang('select'); ?></option>
                                    <option <?= isset($company_information) && $company_information->date_format == "d/m/Y" ? 'selected' : '' ?>  value="d/m/Y">D/M/Y</option>
                                    <option <?= isset($company_information) && $company_information->date_format == "m/d/Y" ? 'selected' : '' ?>  value="m/d/Y">M/D/Y</option>
                                    <option <?= isset($company_information) && $company_information->date_format == "Y/m/d" ? 'selected' : '' ?>  value="Y/m/d">Y/M/D</option>
                                </select>
                            </div>
                            <?php if (form_error('date_format')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('date_format'); ?></p>
                                </div>
                            <?php } ?>
                        </div> 
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Precision<span class="required_star">*</span></label>
                                <select class="form-control select2" name="precision" id="precision" style="width: 100%; border-radius:5px; ">
                                    <option <?= isset($company_information) && $company_information->precision == "2" ? 'selected' : '' ?>  value="2">2 Digit</option>
                                    <option <?= isset($company_information) && $company_information->precision == "3" ? 'selected' : '' ?> value="3">3 Digit</option>
                                </select>
                            </div>
                            <?php if (form_error('precision')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('precision'); ?></p>
                                </div>
                            <?php } ?>
                        </div> 
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Logo <small>(Allowed Types: jpg/jpeg/png, Max Size: 2MB, Max Width: 150px, Max Height: 100px)</small></label>
                                <input tabindex="10" type="file" name="logo" id="logo">
                            </div>
                            <?php if (form_error('logo')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('logo'); ?></p>
                                </div>
                            <?php } ?>
                        </div> 
                    </div>
                    <div class="row"> 
                        <div class="col-md-6">
                            <img src="<?php echo base_url();?>files/logo/<?php echo $company_information->logo?>">
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <button type="submit" name="submit" value="submit" class="btn c-btn"><?php echo lang('submit'); ?></button>
                    <a href="<?php echo base_url() ?>Company_your_profile/profile"><button type="button" class="btn c-btn"><?php echo lang('back'); ?></button></a>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</section>