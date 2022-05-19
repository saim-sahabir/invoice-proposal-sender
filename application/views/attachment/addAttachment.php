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
        Add Attachment
    </h1>  
</section>

<section class="content">
    <div class="row">
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary"> 
                <!-- form start -->
                <?php echo form_open(base_url('Attachment/addEditAttachment'), $arrayName = array('enctype' => 'multipart/form-data')); ?>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Title <span class="required_star">*</span></label>
                                <input type="text" name="title" class="form-control" placeholder="Title" value="<?php echo set_value('title'); ?>">
                            </div>
                            <?php if (form_error('title')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('title'); ?></p>
                                </div>
                            <?php } ?>
                        </div> 
                    </div>
                    <div class="row"> 
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>PDF <span class="required_star">*</span> <small>(Allowed Types: pdf, Max Size: 2MB, Visit <a target="_blank" href="https://pdfcompressor.com/">this</a> site to compress your pdf, Do not upload any protected pdf)</small></label>
                                <input tabindex="10" type="file" name="file" id="file">
                            </div>
                            <?php if (form_error('file')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('file'); ?></p>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <button type="submit" name="submit" value="submit" class="btn c-btn"><?php echo lang('submit'); ?></button>
                    <a href="<?php echo base_url() ?>Attachment/attachments"><button type="button" class="btn c-btn"><?php echo lang('back'); ?></button></a>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</section>