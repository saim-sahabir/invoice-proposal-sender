<style type="text/css">
    .required_star{
        color: #dd4b39;
    }

    .radio_button_problem{
        margin-bottom: 19px;
    }
</style>
<link rel="stylesheet" href="<?= base_url('assets/') ?>buttonCSS/checkBotton.css">
<section class="content-header">
    <h1>
        <?php echo lang('add_user'); ?>
    </h1>  
</section>

<section class="content">
    <div class="row">
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">  
                <!-- form start -->
                <?php echo form_open(base_url('User/addEditUser')); ?>
                <div class="box-body">
                    <div class="row">

                        <div class="col-md-4">

                            <div class="form-group">
                                <label><?php echo lang('name'); ?> <span class="required_star">*</span></label>
                                <input type="text" name="full_name" class="form-control" placeholder="<?php echo lang('name'); ?>" value="<?php echo set_value('full_name'); ?>">
                            </div>
                            <?php if (form_error('full_name')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <span class="error_paragraph"><?php echo form_error('full_name'); ?></span>
                                </div>
                            <?php } ?>
                        </div>


                        <div class="col-md-4">

                            <div class="form-group">
                                <label><?php echo lang('email_address'); ?> <span class="required_star">*</span></label>
                                <input type="text" name="email_address" class="form-control" placeholder="<?php echo lang('email_address'); ?>" value="<?php echo set_value('email_address'); ?>">
                            </div>
                            <?php if (form_error('email_address')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <span class="error_paragraph"><?php echo form_error('email_address'); ?></span>
                                </div>
                            <?php } ?> 

                        </div> 

                        <div class="col-md-4">

                            <div class="form-group">
                                <label><?php echo lang('phone'); ?> </label>
                                <input type="text" name="phone" class="form-control integerchk" placeholder="<?php echo lang('phone'); ?>" value="<?php echo set_value('phone'); ?>">
                            </div>
                            <?php if (form_error('phone')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <span class="error_paragraph"><?php echo form_error('phone'); ?></span>
                                </div>
                            <?php } ?>  
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label><?php echo lang('designation'); ?><span class="required_star"> *</span></label> 
                                <input type="text" name="designation" class="form-control" placeholder="<?php echo lang('designation'); ?>" value="<?php echo set_value('designation'); ?>">
                            </div>
                            <?php if (form_error('designation')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <span class="error_paragraph"><?php echo form_error('designation'); ?></span>
                                </div>
                            <?php } ?>
                        </div> 
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group radio_button_problem">
                                <label><?php echo lang('will_login'); ?> <span class="required_star">*</span></label>  
                                <div class="radio">
                                    <label> 
                                        <input type="radio" name="will_login" id="will_login_yes" value="Yes">Yes </label>
                                    <label>

                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

                                        <input type="radio" name="will_login" id="will_login_no" value="No" checked>No 
                                    </label>
                                </div>
                            </div>
                            <?php if (form_error('will_login')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('will_login'); ?></p>
                                </div>
                            <?php } ?> 
                        </div>
                    </div>
                    <div id="will_login_section" style="display:none;">
                        <div class="row">
                            <div class="col-md-4">

                                <div class="form-group">
                                    <label><?php echo lang('password'); ?> <span class="required_star">*</span></label>
                                    <input type="text" name="password" class="form-control" placeholder="<?php echo lang('password'); ?>" value="<?php echo set_value('password'); ?>">
                                </div>
                                <?php if (form_error('password')) { ?>
                                    <div class="alert alert-error" style="padding: 5px !important;">
                                        <span class="error_paragraph"><?php echo form_error('password'); ?></span>
                                    </div>
                                <?php } ?>  
                            </div> 

                            <div class="col-md-4">

                                <div class="form-group">
                                    <label><?php echo lang('confirm_password'); ?> <span class="required_star">*</span></label>
                                    <input type="text" name="confirm_password" class="form-control" placeholder="<?php echo lang('confirm_password'); ?>" value="<?php echo set_value('confirm_password'); ?>">
                                </div>
                                <?php if (form_error('confirm_password')) { ?>
                                    <div class="alert alert-error" style="padding: 5px !important;">
                                        <span class="error_paragraph"><?php echo form_error('confirm_password'); ?></span>
                                    </div>
                                <?php } ?>
                            </div>
                            
                        </div>
                        <div class="row">
                        <!-- <div class="col-md-4">
                            <div class="form-group">
                                <div class="radio">
                                    <label>
                                        <input class="user_radio" type="radio" name="user_type" value="POS User">
                                        <?php echo lang('pos_user'); ?>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="radio">
                                    <label>
                                        <input class="user_radio" type="radio" name="user_type" value="Kitchen User">
                                       <?php echo lang('kitchen_user'); ?>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="radio">
                                    <label>
                                        <input class="user_radio" type="radio" name="user_type" value="Bar User">
                                        <?php echo lang('bar_user'); ?>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="radio">
                                    <label>
                                        <input class="user_radio" type="radio" name="user_type" value="Waiter User">
                                        <?php echo lang('waiter_user'); ?>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="user_type" value="">
                                        <?php echo lang('user'); ?>
                                    </label>
                                </div>
                            </div>
                        </div> -->

                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?php echo lang('menu_access'); ?> <span class="required_star">*</span></label>
                            </div>
                            <label class="container"> <?php echo lang('select_all'); ?>
                                <input type="checkbox" id="checkbox_userAll">
                                <span class="checkmark"></span>
                            </label>
                            <hr style="margin: 0px;margin-bottom: 0px;padding: 0px;margin-bottom: 6px;">
                            <?php
                            if (isset($user_menus)) {
                                foreach ($user_menus as $value) {
                                    $n=str_replace(" ","_",$value->menu_name);
                                    $m=strtolower($n);
                                    //echo $m;
                                    ?>
                                    <label class="container"><?= lang($m) ?>
                                        <input type="checkbox" class="checkbox_user" value="<?= $value->id ?>" name="menu_id[]" <?= set_checkbox('menu_id[]', $value->id) ?>>
                                        <span class="checkmark"></span>
                                    </label>
                                    <?php
                                }
                            }
                            ?>

                            <?php if (form_error('menu_id')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <span class="error_paragraph"><?php echo form_error('menu_id'); ?></span>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <button type="submit" name="submit" value="submit" class="btn c-btn"><?php echo lang('submit'); ?></button>
                    <a href="<?php echo base_url() ?>User/users"><button type="button" class="btn c-btn"><?php echo lang('back'); ?></button></a>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</section>
<script>
    $(document).ready(function(){
        if($(".checkbox_user").length == $(".checkbox_user:checked").length) {
            $("#checkbox_userAll").prop("checked", true);
        } else {
            $("#checkbox_userAll").removeAttr("checked");
        }
        // Check or Uncheck All checkboxes
        $("#checkbox_userAll").change(function(){
            $('.user_radio').each(function(i, obj) {
                if($(this).is(':checked')){
                    $('#checkbox_userAll').prop('checked',false);
                    $('.checkbox_user').prop('checked',false);
                    return false;
                }
            });
            var checked = $(this).is(':checked');
            if(checked){
                $(".checkbox_user").each(function(){
                    $(this).prop("checked",true);
                });
            }else{
                $(".checkbox_user").each(function(){
                    $(this).prop("checked",false);
                });
            }
        });

        $(".checkbox_user").click(function(){
            $('.user_radio').each(function(i, obj) {
                if($(this).is(':checked')){
                    $('#checkbox_userAll').prop('checked',false);
                    $('.checkbox_user').prop('checked',false);

                    return false;
                }
            });
            if($(".checkbox_user").length == $(".checkbox_user:checked").length) {
                $("#checkbox_userAll").prop("checked", true);
            } else {
                $("#checkbox_userAll").prop("checked", false);
            }
        });
        $('.user_radio').on('click',function(){
            $('#checkbox_userAll').prop('checked',false);
            $('.checkbox_user').prop('checked',false);
        });
        $('#will_login_yes').on('click',function(){
            $('#will_login_section').fadeIn();
        });
        $('#will_login_no').on('click',function(){
            $('#will_login_section').fadeOut();
        });
    });
</script>