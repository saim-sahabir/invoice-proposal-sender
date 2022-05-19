<style type="text/css">
    .aligning{
        width: auto; float:left
    } 
    .label_aligning{
        float: left; padding: 5px 0px 0px 3px;
    } 
</style> 
<style type="text/css">
    .required_star{
        color: #dd4b39;
    }

    .radio_button_problem{
        margin-bottom: 19px;
    }
    .foodMenuCartInfo{
        border: 2px solid #3c8dbc;
        padding: 15px;
        border-radius: 5px;
        color: #3c8dbc;
        font-size: 14px;
        margin-top: 0px;
        text-align: justify;
    }
    .foodMenuCartNotice{
        border: 2px solid red;
        padding: 15px;
        border-radius: 5px;
        color: red;
        font-size: 14px;
        margin-top: 0px;
        text-align: justify;
    }
    .cart_container{
        /* border: 1px solid black;*/
    }
    .cart_header{ 
        background-color: #ecf0f5;  
        padding: 5px 0px;
        margin-bottom: 5px;
    }
    .ch_content{
        font-weight: bold;
    }
    .custom_form_control{
        border-radius: 0;
        box-shadow: none;
        border-color: #d2d6de;  
        width: 80%;
        height: 26px;
        padding: 6px 12px;
        font-size: 14px;
        line-height: 1.42857143;
        color: #555;
        background-color: #fff;
        background-image: none;
        border: 1px solid #ccc;
        margin: 0px 3px 7px 0px;
    }
    .center_positition{
        text-align: center !important;
    }
    .error-msg{
        display:none;
    }
</style> 

<section class="content-header">
    <h1>
        Edit Product/Service
    </h1>  
</section>
<?php echo validation_errors(); ?>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <?php echo form_open(base_url() . 'Product_service/addEditProductService/'.$encrypted_id, $arrayName = array('enctype' => 'multipart/form-data')) ?>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label><?php echo lang('name'); ?> <span class="required_star">*</span></label>
                                <input type="text" id="name" name="name" class="form-control" placeholder="<?php echo lang('name'); ?>" value="<?php echo $product_service_information->name; ?>">
                            </div>
                            <?php if (form_error('name')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('name'); ?></p>
                                </div>
                            <?php } ?> 
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Price <span class="required_star">*</span></label>
                                <input type="text"  onfocus="this.select();" id="price" name="price" class="form-control integerchk" placeholder="Price" value="<?php echo $product_service_information->price; ?>">
                            </div>
                            <?php if (form_error('price')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('price'); ?></p>
                                </div>
                            <?php } ?>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <label><?php echo lang('description'); ?></label> 
                                <textarea id="description" name="description" class="form-control" placeholder="<?php echo lang('description'); ?>" value="<?php echo $product_service_information->description; ?>" row="3" style="border-radius: 5px;"></textarea>
                            </div>
                            <?php if (form_error('description')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('description'); ?></p>
                                </div>
                            <?php } ?> 
                        </div>
                    </div>                       
                    <!-- <div class="row">  
                        <div class="col-md-4">
                            <div class="form-group">
                                <label><?php //echo lang('photo'); ?> </label>
                                <input tabindex="10" type="file"  name="photo" id="photo">
                            </div>
                            <?php //if (form_error('photo')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php //echo form_error('photo'); ?></p>
                                </div>
                            <?php //} ?>
                        </div>
                    </div>   --> 

                    <!-- /.box-body -->

                    <div class="box-footer">
                        <button type="submit" name="submit" value="submit" class="btn c-btn"><?php echo lang('submit'); ?></button>
                        <a href="<?php echo base_url() ?>Product_service/productsServices"><button type="button" class="btn c-btn"><?php echo lang('back'); ?></button></a>
                    </div>
                    <?php echo form_close(); ?>
                </div>
            </div>
        </div>
    </div> 
</section>