<script>
    var base_url='<?php echo base_url(); ?>';
</script>
<style type="text/css">
.select2-container--default .select2-selection--single, .select2-selection .select2-selection--single {border-radius: 5px !important;}
.pay_se{
    box-shadow: 0px 1px 5px 0px #00000054;
    padding: 1px;
    border-radius: 7px;
    margin-bottom: 12px;
    margin-top: 5px;
}
.lo_em{
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    right: 0;
    background-color: #f6f6f6;
    margin-left: 31px;
    margin-right: 31px;
    height: 73%;
    top: 113px;
}
.im{
        margin-left: auto;
    margin-right: auto;
    display: block;
}
.modal_error{
  display: none;
}

</style>
<section class="content-header">
    <h1>
        Create Proposal/Invoice
    </h1> 
    <div id="done_msg"></div>
</section>
 <input type="hidden" id="csrf_value_" value="<?php echo $this->security->get_csrf_hash(); ?>">
<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">

                <!-- /.box-header -->
                <!-- form start -->
                <input type="hidden" id="precision_val" value="<?php $Cid =$this->session->userdata('company_id'); $Cdata = companyInformation($Cid); echo $Cdata->precision; ?>">
                  
                <?php echo form_open(base_url() . 'Proposal/saveProposalInvoice', $arrayName = array('id' => 'proposal_form')) ?>
                <div class="box-body">
                    <div class="row"> 
                        <div class="col-md-4"> 
                            <div class="form-group"> 
                                 <label>Product and/or Service <span class="required_star"></span></label>
                                <select class="form-control select2" name="type" id="type" style="width: 100%;">
                                    <option value="">Proposal/Invoice</option> 
                                    <option value="Proposal">Proposal</option> 
                                    <option value="Invoice">Invoice</option> 
                                </select>
                            </div>
                            <div class="alert alert-error modal_error " id="name_err_msg_container_p" style="padding: 5px !important;">
                                <p id="name_err_msg_p"></p>
                            </div> 
                        </div> 
                        <div class="col-md-4"> 
                            <div class="form-group"> 
                                <label>&nbsp; <span class="required_star"></span></label>
                                <input type="text" id="date" name="date" readonly class="form-control" placeholder="Date" value="<?php echo date('Y-m-d');?>"required>
                            </div>
                            <div class="alert alert-error modal_error" id="name_err_msg_container2" style="padding: 5px !important;">
                                <p id="name_err_msg2"></p>
                            </div> 
                        </div>
                        <div class="col-md-4"> 
                            <div class="form-group"> 
                                <label>&nbsp; <span class="required_star"></span></label>
                                <table style="width: 100%">
                                    <tr>
                                        <td width="95.5%"> 
                                            <select class="form-control select2" id="customer_id" name="customer_id" style="width: 100%;"required>
                                                <option value="">Customer</option>
                                                <?php foreach ($customers as $value) { ?>
                                                    <option value="<?php echo $value->id ?>"><?php echo $value->name ?> (<?php echo $value->phone ?>)</option>
                                                <?php } ?> 
                                            </select>
                                        </td>
                                        <td> <span  class="plus-customer" data-toggle="modal" data-target="#customerModal" style="cursor: pointer;margin-right: 13px;margin-top: 24px; font-size: 24px; margin-left: 5px;">
                                                <i class="fa fa-plus" style="border: solid 1px gray;padding: 3px;border-radius: 3px;"></i></span></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="alert alert-error modal_error" id="name_err_msg_container3" style="padding: 5px !important;">
                                <p id="name_err_msg3"></p>
                            </div> 
                        </div> 
                    </div> 
                    <div class="row">   
                        <div class="col-md-6"> 
                            <div class="form-group"> 
                                <input type="text" name="title" id="title" class="form-control" placeholder="Title" value=""required>
                            </div>
                            <div class="alert alert-error modal_error " id="name_err_msg_container4" style="padding: 5px !important;">
                                <p id="name_err_msg4"></p>
                            </div> 
                        </div>
                        <div class="col-md-2"> 
                            <div class="form-group"> 
                                <input type="text" name="proposal_no" id="proposal_no" class="form-control" placeholder="Proposal No" value="">
                            </div>
                        </div>
                        <div class="col-md-4"> 
                            <div class="form-group">  
                                <table style="width: 100%">
                                    <tr>
                                        <td width="95.5%"> 
                                             <select class="form-control select2" id="product_service_id" name="product_service_id" style="width: 100%;" >
                                                <option value="">Select Product/Service</option>
                                                <?php foreach ($productsServices as $value) { ?>
                                                    <option value="<?php echo $value->id."|".$value->name."|".$value->price."|".$value->description; ?>"><?php echo $value->name ?></option>
                                                <?php } ?>
                                            </select>
                                        </td>
                                        <td> <span  class="plus-product-service" data-toggle="modal" data-target="#productServiceModal" style="cursor: pointer;margin-right: 13px;margin-top: 24px; font-size: 24px; margin-left: 5px;">
                                                <i class="fa fa-plus"style="border: solid 1px gray;padding: 3px;border-radius: 3px;"></i></span></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="alert alert-error modal_error" id="name_err_msg_container5" style="padding: 5px !important;">
                                <p id="name_err_msg5"></p>
                            </div> 
                        </div> 
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive" id="productsServicesCart">          
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th width="3%">SN</th>
                                            <th width="30%">Product/Service</th>
                                            <th width="15%">Quantity/Amount</th>
                                            <th width="15%">Rate</th>
                                            <th width="15%">Subtotal</th>
                                            <th width="5%">X</th>  
                                        </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>
                            </div> 
                        </div>
                    </div>
                <div class="row">
                    <div class="col-md-12">   
                        <div class="col-md-2">
                            <div class="form-group">
                                <label style="margin-top: 5px">Total</label> 
                                <input type="text" readonly name="subtotal" id="subtotal" class="form-control" placeholder="Subtotal" value="0">
                            </div>
                        </div>   
                        <div class="col-md-2" style="">
                            <div class="form-group">
                            <label style="margin-top: 5px">Discount (-)</label>
                            <div style="display: flex;"> 
                                <input type="text" name="discount_value " id="discount_value" class="form-control integerchk" placeholder="Discount" value=""  onkeyup="return calculateAll();" onblur="return calculateAll();" >
                                <input type="hidden" name="actual_discount" id="actual_discount" value="">

                                <select name="discount_type" id="discount_type" class="form-control select2" onchange="return calculateAll();" >
                                    <option value="Percentage" <?php
                                        if (isset($proposal)) {
                                            if ($proposal->discount_type == 'Percentage')
                                                echo "selected='selected'";
                                        }
                                    ?>>&nbsp;%&nbsp;</option>
                                    <option value="Fixed" <?php
                                        if (isset($proposal)) {
                                            if ($proposal->discount_type == 'Fixed')
                                                echo "selected='selected'";
                                        }
                                    ?>>Fixed</option>
                                </select>

                            </div>
                            <div>
                            <span class="error-msg discounterror">
                                Discount can\'t be greater than 100%</span>
                            <span class="error-msg discounterror2">
                            Discount can\'t be greater than Sub Total value!! </span>
                        </div>
                            </div>
                            </div>
                         
                            
                          

                        
                       <!------------------------------->
                           <div class="col-md-2 "> 
                           <div class="form-group"> 
                            <label style="margin-top: 5px">After Discount</label> 
                                <input class="form-control" type="text" readonly name="after_discount" id="after_discount" placeholder="After Discount" value="0">
                            </div>
                        </div>
                          <!------------------------------->
                    
                    
                      <?php $m=1;
                    foreach ($tax_information as $rows) {
                     ?>  
                         <input type="hidden" name="taxpercentage[]"  value="<?php echo $rows->percentage; ?>" class="taxpercentage<?php echo $m; ?>">
                                <input type="hidden" readonly name="taxamount[]" class="taxamount<?php echo $m; ?>" placeholder="Tax" value="0">
                    
                       <?php $m++;} ?>




                      
                        <div class="col-md-2 "> 
                           <div class="form-group"> 
                            <label style="margin-top: 5px">Total Tax</label>
                            <div style="display: flex;"> 
                            <input type="text" readonly name="sumoftax" id="sumoftax" value="0"class="form-control">
                            <input type="hidden" name="taxcount" id="taxcount" value="<?php echo count($tax_information); ?>">
                             <a id="viewTax" class="btn btn-default"><i class="fa fa-eye tiny-icon"></i></a>
                            </div>
                            </div> 
                        </div>
                        <div class="col-md-2">
                            <label style="margin-top: 5px">Shipping/Other (+)</label>
                            <div class="form-group"> 
                                <input type="text" name="shipping_other" id="shipping_other" class="form-control integerchk" placeholder="Shipping/Other" value=""  onblur="return calculateAll();" onkeyup="return calculateAll();">
                            </div>
                        </div>
                      
                        <div class="col-md-2">
                            <div class="form-group">
                             <label style="margin-top: 5px">Grand Total</label>
                                <input type="text" readonly name="grand_total" id="grand_total" class="form-control" placeholder="Grand Total" value="0">
                            </div>
                        </div>
                    </div>
                </div>
                    <div class="row invoiceclass" style="margin-top: 15px;">
                       <div class="col-md-12">
                        <div class="col-md-4" style="float: right;">   
                            <div class="form-group">
                            <label style="margin-top: 5px">Payment Status</label> 
                                <select class="form-control select2" name="payment_select_invoice" id="payment_status" style="width: 100%;">
                                    <option value="">Select</option> 
                                    <option value="Paid">Paid</option> 
                                    <option value="Unpaid">Unpaid</option> 
                                </select>
                            </div>
                            <div class="alert alert-error modal_error" id="name_err_msg_container_pays" style="padding: 5px !important;">
                                <p id="name_err_msg_pays"></p>
                            </div> 
                        </div>
                    </div>
                    <div class="col-md-12">
                    <div id="make_payment"></div>
                    </div>
                    </div> 
                    <div class="row" style="margin-top: 45px;">
                     <div class="col-md-12">   
                        <div class="col-md-12">
                            <div class="form-group">
                                <label> Additional Note<span class="required_star"></span></label>
                                <textarea name="note" id="note" rows="3" class="form-control" placeholder="Additional Note" style="border-radius: 5px;"></textarea>
                            </div>
                        </div>   
                        <div class="col-md-12">
                            <div class="form-group"> 
                                <label>Terms & Conditions<span class="required_star"></span></label>
                                <textarea name="term_condition" id="term_condition" rows="3" class="form-control" placeholder="Terms & Conditions"style="border-radius: 5px;"></textarea>
                            </div>
                        </div>
                    </div>
                  </div>
                     <div class="row proposalclass">
                       <div class="col-md-12"> 
                           <div class="form-group">
                            <label style=" text-align: center; margin-left: 20px;margin-top: 15px;">Attachment</label>
                            <hr style="margin-top: 12px;"> 
                            </div> 
                        </div>    
                        <div class="col-md-12">
                            <?php
                            if ($attach_information):
                                foreach ($attach_information as $attachment):
                                    ?>
                                    <div class="attachment-item">
                                        <div  class=" attachment-item-title">
                                            <label>
                                                <input type="checkbox" name="files[]" value="<?php echo $attachment->id; ?>" 
                                                <?php if(isset($info)){ echo (in_array($attachment->id, $attachedFiles)) ? "checked='checked'" : ""; } ?>> 
                                                <?php echo $attachment->title; ?></label>
                                        </div>
                                        <div class="img-holder">
                                            <a href="#" class="previewr" data-atid="<?php echo $attachment->file; ?>">
                                                <img src="<?php echo base_url(); ?>assets/uploads/pdf/preview_images/pdffile.jpg"/> </a>
                                        </div>

                                    </div>
                                    <!--                          attachment-item-->
                                    <?php
                                endforeach;
                            endif;
                            ?>
                        </div>
                    </div>
                    <hr class="proposalclass">
                    <div class="row proposalclass" style="margin-left: 8px;">
                       <div class="col-md-12"> 
                           <div class="form-group"> 
                            <label style="margin-top: 5px">Photo</label>
                            </div> 
                        </div>   
                        <div class="col-md-4"> 
                           <div class="form-group"> 
                             <input type="text" id="fileTitle" class="form-control" placeholder="Title" maxlength="50" />
                            </div> 
                        </div> 
                        <div class="col-md-4">
                            <div class="form-group file-focus-field" >
                                <input type="text" class="files form-control file-focus-field" id="fileSelector_placeholder"  placeholder="No File Selected" style="cursor: pointer;">
                                <span class="selectphoto files input-group-addon btn btn-primary " style="background-color: #3F6AD8; ">Select</span>
                            </div>
                            <input type="file" class=" form-control file-field" id="fileSelector" name="uploadedFile" accept="image/gif, image/jpeg, image/png"style="cursor: pointer;">
                            <span class="photoallow">
                                Allowed Types: JPG/JPEG/PNG.
                            </span>
                        
                        </div>
                        <div class="col-md-4"> 
                           <div class="form-group"> 
                            <button type="button" id="uploadImage" class="uploadbutton btn btn-sm btn-primary"style="background-color: #3F6AD8;"><i class="fa fa-upload tiny-icon"></i> Upload</button>
                            </div> 
                        </div> 
                    </div>
                    <div class="row proposalclass">
                        <div class="col-md-12"> 
                           <div class="form-group"> 
                            <div class="photodiv" style="margin-left: 22px;">
                                <div id="fileContainer">
                                    <?php
                                    if (!empty($attached_photo)) {
                                        foreach ($attached_photo as $key => $photo) {
                                            $_src = base_url() . "proposalPhoto/" . $photo['file'];
                                            $_title = $photo['title'];
                                            $_fileName = $photo['file'];
                                            ?>

                                            <div  class="photo-item">
                                                <label style="margin-bottom: 10px;text-align: center;font-size:12px"><?php
                                    echo preg_replace('~((?:\S*?\s){3})~', "$1\n", $_title);
                                            ?></label>
                                                <img class="previewImage img-thumbnail" src="<?php echo $_src; ?>" alt="" style="width: 100px; height: 100px; z-index:3;background:white;margin-bottom: 10px" />
                                                <button class="btn btn-danger deleteUploadedFile" data-file="<?php echo $_fileName; ?>" type="button" style="width:100%;height:25px;padding: 0 12px !important;" title="DELETE">DELETE</button>
                                            </div>
                                        <?php
                                        }
                                    }
                                    ?>

                                </div>
                            </div>
                        </div> 
                    </div> 
                    </div>
                    <hr  class="proposalclass">
                    <div class=" row" style="margin-left: 7px;">
                       <div class="col-md-2"> 
                           <div class="form-group"> 
                            <label style="margin-top: 5px"> Background Color 
                            </label>
                            </div> 
                        </div>   
                        <div class="col-md-1"> 
                           <div class="form-group"> 
                             <input type="text" class="form-control template_bg_color" id="full" name="template_bg_color" value="#6fa8dc"  placeholder="Background Color" />
                            </div> 
                        </div> 
                        <div class="col-md-1"> 
                           <div class="form-group"> 
                            <label>Text Color 
                            </label>
                            </div> 
                        </div>
                        <div class="col-md-1">
                            <div class="form-group">
                                <input type="text" class="form-control template_text_color" id="full1" name="template_text_color" value="#000000"  placeholder="Text Color" >
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div id="main">
                            <div class="section head-section standard top colorclass" style="color:black;  margin-left: 3px;margin-right: 3px; background-color: #6fa8dc;">
                                <div class="segment left top">
                                    <p><img src="<?php echo base_url(); ?>files/logo/<?php echo $this->session->userdata('logo'); ?>" class="logo1 img-responsive"/> </p>
                                    <p>Proposal Number: Proposal-00001</p>
                                    <p>Date: <?php echo date("Y-m-d"); ?></p>
                                </div>
                                <!--        segment left-->
                                <div class="segment left top" style="text-align: right;padding-right: 10px">
                                    <h2 class="colorclass" style="padding:0px;margin-left:0px;text-indent:0px;margin-right: 3px;background-color: #6fa8dc;"><?php echo $this->session->userdata('name_company_name'); ?></h2>
                                    <p><?php echo $this->session->userdata('address'); ?></p>
                                    <p><?php echo $this->session->userdata('email'); ?></p>
                                    <p><?php echo $this->session->userdata('cphone'); ?></p>
                                  

                                </div>
                                <!--        segment right-->
                                <div style="clear: both"></div>
                            </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="box-footer">
                    <button type="submit" id="preview" name="action" value="preview" class="btn btn-primary from_sub"style="margin-bottom: 4px; background-color: #3F6AD8;">
                        Preview
                    </button>
                    <button type="submit"  name="email" value="email" class="btn btn-primary from_sub"style="margin-bottom: 4px; background-color: #3F6AD8;">
                        Save and Email
                    </button>
                    <button type="submit" id="SaveandDownload" name="action" value="download" class="btn btn-primary from_sub"style="margin-bottom: 4px; background-color: #3F6AD8;">
                        Save and Download
                    </button>
                    <button type="submit" id="save" name="action" value="save" class="btn btn-primary from_sub" style="margin-bottom: 4px; background-color: #3F6AD8;">
                        Save as Draft
                    </button>
                    <a href="<?php echo base_url() ?>Proposal/proposals"><button type="button" class="btn btn-primary"style="margin-bottom: 4px; background-color:#3F6AD8; "><?php echo lang('cancel'); ?></button></a>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</section>

<div class="modal fade " id="PreviewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Preview </h4>
            </div>
            <div class="modal-body">
                <iframe src="#" id="attachmentFile" style="width:100%;height:400px;"></iframe>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade " id="open_pay_select" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog " role="document" style="height: 335px;">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Select Payment Method</h4>
            </div>
            <div class="modal-body">
                <div class="col-md-12" style="width: 100%; height: 217px;overflow-y: auto;">
                    <div class="pay_op"></div>
                   <div class="pay_se">
                   <a href="javascript:void(0)"class="click_op_pay"><h4 style="text-align: center;">Cash On Delivery</h4></a>
                   </div>
                   <div class="pay_se">
                   <a href="javascript:void(0)" class="click_op_pay"><h4 style="text-align: center;">Other</h4></a>
                   </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>
<div class="modal fade " id="taxview" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Tax Details</h4>
            </div>
            <div class="modal-body">
                <?php $m=1;
                    foreach ($tax_information as $rows) {
                     ?>
                      
                        <div class="col-md-12">
                             <div class="col-md-4 "> 
                           <div class="form-group"> 
                            <label style="margin-top: 5px">
                                <?php echo $rows->tax; ?> (+)</label> 
                            </div> 
                           </div>
                           <div class="col-md-6">
                            <div class="form-group">
                                <input type="hidden" name="taxpercentage[]"  value="<?php echo $rows->percentage; ?>" class="taxpercentage<?php echo $m; ?>">
                                <input type="text" readonly name="taxamount[]" class="taxamount<?php echo $m; ?>   form-control"  placeholder="Tax" value="0">
                                
                            </div>
                            </div>
                        </div>
                    
                <?php $m++;} ?>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade " id="PreviewPdf" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Preview </h4>
            </div>
            <div class="modal-body">
                <iframe src="#" id="PdfFile" style="width:100%;height:500px;"></iframe>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade " id="sendEmail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Send Via Email</h4>
            </div>
            <div class="modal-body">
                <div class="container col-md-12">
            
        <div class="panel panel-primary">
            <div class="panel-heading"style="background-color: #3F6AD8; border-color: #3F6AD8;">
                <h3 class="panel-title">Send Proposal via Email</h3>
            </div>
            <div class="panel-body">
                <div id="send_sucess" ></div>
                <div class="panel-body lo_em" id="loader_email">
                    <img src="<?php echo base_url(); ?>assets/email_send1.gif" class="im">
                </div>
                <?php echo form_open(base_url() . '#', $arrayName = array('id' => 'send_email')) ?>
                    <div class="row form-group col-md-12">
                        <div class="col-md-3">
                            <label>Email To <span style="color:red;">*</span></label>
                        </div>
                        <div class=" col-sm-6 col-xs-12">
                            <input type="text" name="email_to" value="" class="form-control"  placeholder="Email address"/>
                            <span class="error-msg"><?php echo form_error('email_to'); ?></span>
                        </div>
                    </div>
                    <!--                    form-groum-->
                    <div class=" row form-group col-md-12">
                        <div class="col-md-3">
                            <label>Subject <span style="color:red;">*</span></label>
                        </div>
                        <div class="col-md-9">
                            <input type="text" name="subject" value="Proposal for " placeholder="Subject" class="form-control"/>
                            <span class="error-msg"><?php echo form_error('subject'); ?></span>
                        </div>
                    </div>
                    <!--                    form-groum-->
                    <div class="row form-group col-md-12">
                        <div class="col-md-3">
                            <label>Email Body <span style="color:red;">*</span></label>
                        </div>
                        <div class="col-md-9">
                            <textarea  id="editor1" name="message" class="form-control">
                            </textarea>
                            <span class="error-msg"><?php echo form_error('message'); ?></span>
                        </div>
                    </div>
                    <!--                    form-groum-->
                    <div class="row">
                        <div class="col-md-9 col-md-offset-3">
                            <input name="proposal_id" value="" type="hidden"/>
                            <a id="btn_send_email" class="btn btn-sm btn-primary" style="background-color: #3F6AD8; border-color: #3F6AD8;"><i class="fa fa-send tiny-icon"></i> Send</a>

                        </div>
                    </div>
                    <!--                    row-->
                <?php echo form_close(); ?>
            </div>
            <!--            panel-body-->
        </div>
        <!--        panel panel-primary-->
</div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="customerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-2x">×</i></span></button>
                    <h4 class="modal-title" id="myModalLabel"><i style="color:#3c8dbc" class="fa fa-plus-square-o"></i> Add Customer</h4>
                </div>
                <div class="modal-body">
       
              <form id="addCustomerForm">      
                        <div class="row">
                            <div class="col-md-12"> 
                                <div class="form-group">
                                    <label>Name/Company Name <span class="required_star">*</span></label>
                                    <input type="text" id="name" name="name" class="form-control" placeholder="Name/Company Name" value="">
                                </div>
                                <div class="alert alert-error modal_error" id="name_err_msg_container" style="padding: 5px !important;">
                                    <p id="name_err_msg"></p>
                                </div>
                            </div>
                        </div> 
                        <div class="row">
                            <div class="col-md-12"> 
                                <div class="form-group">
                                    <label>Contact Person <span class="required_star">*</span></label>
                                    <input type="text" id="c_person" name="c_person" class="form-control" placeholder="Contact Person" value="">
                                </div>
                                <div class="alert alert-error modal_error" id="cp_err_msg_container" style="padding: 5px !important;">
                                    <p id="cp_err_msg"></p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12"> 
                                <div class="form-group">
                                    <label><?php echo lang('phone'); ?> <span class="required_star">*</span></label> 
                                    <input type="text" id="phone" name="phone" class="form-control" placeholder="<?php echo lang('phone'); ?>" value="">
                                </div>
                                <div class="alert alert-error modal_error" id="phone_err_msg_container" style="padding: 5px !important;">
                                    <p id="phone_err_msg"></p>
                                </div>    
                            </div>
                        </div>
                        <div class="row"> 
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label><?php echo lang('email'); ?></label>
                                    <input type="text" id="email" name="email" class="form-control" placeholder="<?php echo lang('email'); ?>" value="">
                                </div> 
                                <div class="alert alert-error modal_error" id="email_err_msg_container" style="padding: 5px !important;">
                                    <p id="email_err_msg"></p>
                                </div> 
                            </div> 
                        </div> 
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Website</label>
                                    <input  type="text" id="website" name="website" class="form-control" placeholder="Website" value="">
                                </div>
                                <div class="alert alert-error modal_error" id="website_err_msg_container" style="padding: 5px !important;">
                                    <p id="website_err_msg"></p>
                                </div> 
                            </div> 
                        </div> 
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Billing Address <span class="required_star">*</span></label> 
                                    <textarea class="form-control" rows="3" id="billing_address" name="billing_address" placeholder="Billing Address"></textarea>
                                </div>
                                <div class="alert alert-error modal_error" id="bl_err_msg_container" style="padding: 5px !important;">
                                    <p id="bl_err_msg"></p>
                                </div> 
                            </div>  
                        </div> 
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Service Address </label> 
                                    <textarea class="form-control" rows="3" id="address" name="address" placeholder="Service Address"></textarea>
                                </div>
                                <div class="alert alert-error modal_error" id="address_err_msg_container" style="padding: 5px !important;">
                                    <p id="address_err_msg"></p>
                                </div> 
                            </div>  
                        </div>                     
                        <?php if($this->session->userdata('tax_is_gst') == 'Yes'){?>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label><?php echo lang('gst_number'); ?></label>
                                    <input type="text" name="gst_number" class="form-control" placeholder="<?php echo lang('gst_number'); ?>" value="">
                                </div>
                                <div class="alert alert-error modal_error" id="gst_number_err_msg_container" style="padding: 5px !important;">
                                    <p id="gst_number_err_msg"></p>
                                </div>
                            </div>
                        </div>
                        <?php } ?> 
                        </div>
                    </form> 
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="addCustomer">
                        <i class="fa fa-save"></i> <?php echo lang('submit'); ?></button>
                </div>
            </div>
        </div>
</div>

<div class="modal fade" id="productServiceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-2x">×</i></span></button>
                    <h4 class="modal-title" id="myModalLabel"><i style="color:#3c8dbc" class="fa fa-plus-square-o"></i> Add Product/Service</h4>
                </div>
                <div class="modal-body">
                    <form id="addProductServiceForm">      
                        <div class="row">
                            <div class="col-md-12"> 
                                <div class="form-group">
                                    <label>Name <span class="required_star">*</span></label>
                                    <input type="text" id="product_service_name" name="product_service_name" class="form-control" placeholder="Name" value="">
                                </div>
                                <div class="alert alert-error modal_error" id="product_service_name_err_msg_container" style="padding: 5px !important;">
                                    <p id="product_service_name_err_msg"></p>
                                </div>
                            </div>
                        </div> 
                        <div class="row">
                            <div class="col-md-12"> 
                                <div class="form-group">
                                    <label>Price <span class="required_star">*</span></label> 
                                    <input type="text" id="product_service_price" name="product_service_price" class="form-control integerchk" placeholder="Price" value="">
                                </div>
                                <div class="alert alert-error modal_error" id="product_service_price_err_msg_container" style="padding: 5px !important;">
                                    <p id="product_service_price_err_msg"></p>
                                </div>    
                            </div>
                        </div>

                        <div class="row"> 
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea id="product_service_description" name="product_service_description" class="form-control" placeholder="Description" value="" rows="3" style="border-radius: 5px;"></textarea>
                                </div> 
                                <div class="alert alert-error modal_error" id="product_service_description_err_msg_container" style="padding: 5px !important;">
                                    <p id="product_service_description_err_msg"></p>
                                </div> 
                            </div> 
                        </div>     
                        </div>
                    </form> 
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="addProductService">
                        <i class="fa fa-save"></i> <?php echo lang('submit'); ?></button>
                </div>
            </div>
        </div>
</div>
<script type="text/javascript" src="<?php echo base_url('assets/proposalInvoice/addCustomer.js'); ?>"></script>

<script type="text/javascript" src="<?php echo base_url('assets/proposalInvoice/addProductService.js'); ?>"></script>

 <script type="text/javascript" src="<?php echo base_url('assets/proposalInvoice/proposalSaveAndDownload.js'); ?>"></script>
 <script type="text/javascript" src="<?php echo base_url('assets/payment_system/payment_system.js'); ?>"></script>
 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script typ="text/javascript"> 
    $(document).ready(function() {


        $('#editor1').summernote({

            height: 250,
            codemirror: { // codemirror options
                theme: 'monokai'
            },
            toolbar: [
                // [groupName, [list of button]]
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['font', ['strikethrough', 'superscript', 'subscript']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']]
            ]
            /////////////
        });
        
    });

</script> 
<style type="text/css">
    .to-mail{
        width:300px;

    }
    @media(max-width:360px){
        .to-mail{
            width:100%;
            margin-right:5px;

        }
    }
</style> 
<script src="<?php echo base_url(); ?>assets/photo/jquery.loading.block.js"></script> 
<script src="<?php echo base_url(); ?>assets/photo/jquery.m.s.s.js"></script>
<script type="text/javascript" src="<?php echo base_url('assets/proposalInvoice/pageFunction.js'); ?>"></script>
<script>
    $('#customerModal').on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
    });
</script>
<script>
    $('#productServiceModal').on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
    });
</script>
<link rel="stylesheet" media="screen" type="text/css" href="<?php echo base_url() ?>assets/color/spectrum.css" />
<script type="text/javascript" src="<?php echo base_url() ?>assets/color/spectrum.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
    $('#viewTax').click(function(){
    $('#taxview').modal('show');
    
    })
   })


</script>

<script>
    $(document).ready(function(){


        $("#full").spectrum({
            color: "#6fa8dc",
            showInput: true,
            className: "full-spectrum",
            showInitial: true,
            showPalette: true,
            showSelectionPalette: true,
            maxSelectionSize: 10,
            preferredFormat: "hex",
            localStorageKey: "spectrum.demo",
            move: function (color) {
                $('.colorclass').css('background-color',color.toRgbString());  
                $('.template_bg_color').val(color.toRgbString());
            },
            show: function () {
    
            },
            beforeShow: function () {
    
            },
            hide: function () {
    
            },
            change: function() {
        
            },
            palette: [
                ["rgb(0, 0, 0)", "rgb(67, 67, 67)", "rgb(102, 102, 102)",
                    "rgb(204, 204, 204)", "rgb(217, 217, 217)","rgb(255, 255, 255)"],
                ["rgb(152, 0, 0)", "rgb(255, 0, 0)", "rgb(255, 153, 0)", "rgb(255, 255, 0)", "rgb(0, 255, 0)",
                    "rgb(0, 255, 255)", "rgb(74, 134, 232)", "rgb(0, 0, 255)", "rgb(153, 0, 255)", "rgb(255, 0, 255)"], 
                ["rgb(230, 184, 175)", "rgb(244, 204, 204)", "rgb(252, 229, 205)", "rgb(255, 242, 204)", "rgb(217, 234, 211)", 
                    "rgb(208, 224, 227)", "rgb(201, 218, 248)", "rgb(207, 226, 243)", "rgb(217, 210, 233)", "rgb(234, 209, 220)", 
                    "rgb(221, 126, 107)", "rgb(234, 153, 153)", "rgb(249, 203, 156)", "rgb(255, 229, 153)", "rgb(182, 215, 168)", 
                    "rgb(162, 196, 201)", "rgb(164, 194, 244)", "rgb(159, 197, 232)", "rgb(180, 167, 214)", "rgb(213, 166, 189)", 
                    "rgb(204, 65, 37)", "rgb(224, 102, 102)", "rgb(246, 178, 107)", "rgb(255, 217, 102)", "rgb(147, 196, 125)", 
                    "rgb(118, 165, 175)", "rgb(109, 158, 235)", "rgb(111, 168, 220)", "rgb(142, 124, 195)", "rgb(194, 123, 160)",
                    "rgb(166, 28, 0)", "rgb(204, 0, 0)", "rgb(230, 145, 56)", "rgb(241, 194, 50)", "rgb(106, 168, 79)",
                    "rgb(69, 129, 142)", "rgb(60, 120, 216)", "rgb(61, 133, 198)", "rgb(103, 78, 167)", "rgb(166, 77, 121)",
                    "rgb(91, 15, 0)", "rgb(102, 0, 0)", "rgb(120, 63, 4)", "rgb(127, 96, 0)", "rgb(39, 78, 19)", 
                    "rgb(12, 52, 61)", "rgb(28, 69, 135)", "rgb(7, 55, 99)", "rgb(32, 18, 77)", "rgb(76, 17, 48)"]
            ]
        });

        $("#full1").spectrum({
            color: "#000000",
            showInput: true,
            className: "full-spectrum",
            showInitial: true,
            showPalette: true,
            showSelectionPalette: true,
            maxSelectionSize: 10,
            preferredFormat: "hex",
            localStorageKey: "spectrum.demo",
            move: function (color) {
                $('.colorclass').css('color',color.toRgbString()); 
                $('.template_text_color').val(color.toRgbString());
            },
            show: function () {
    
            },
            beforeShow: function () {
    
            },
            hide: function () {
    
            },
            change: function() {
        
            },
            palette: [
                ["rgb(0, 0, 0)", "rgb(67, 67, 67)", "rgb(102, 102, 102)",
                    "rgb(204, 204, 204)", "rgb(217, 217, 217)","rgb(255, 255, 255)"],
                ["rgb(152, 0, 0)", "rgb(255, 0, 0)", "rgb(255, 153, 0)", "rgb(255, 255, 0)", "rgb(0, 255, 0)",
                    "rgb(0, 255, 255)", "rgb(74, 134, 232)", "rgb(0, 0, 255)", "rgb(153, 0, 255)", "rgb(255, 0, 255)"], 
                ["rgb(230, 184, 175)", "rgb(244, 204, 204)", "rgb(252, 229, 205)", "rgb(255, 242, 204)", "rgb(217, 234, 211)", 
                    "rgb(208, 224, 227)", "rgb(201, 218, 248)", "rgb(207, 226, 243)", "rgb(217, 210, 233)", "rgb(234, 209, 220)", 
                    "rgb(221, 126, 107)", "rgb(234, 153, 153)", "rgb(249, 203, 156)", "rgb(255, 229, 153)", "rgb(182, 215, 168)", 
                    "rgb(162, 196, 201)", "rgb(164, 194, 244)", "rgb(159, 197, 232)", "rgb(180, 167, 214)", "rgb(213, 166, 189)", 
                    "rgb(204, 65, 37)", "rgb(224, 102, 102)", "rgb(246, 178, 107)", "rgb(255, 217, 102)", "rgb(147, 196, 125)", 
                    "rgb(118, 165, 175)", "rgb(109, 158, 235)", "rgb(111, 168, 220)", "rgb(142, 124, 195)", "rgb(194, 123, 160)",
                    "rgb(166, 28, 0)", "rgb(204, 0, 0)", "rgb(230, 145, 56)", "rgb(241, 194, 50)", "rgb(106, 168, 79)",
                    "rgb(69, 129, 142)", "rgb(60, 120, 216)", "rgb(61, 133, 198)", "rgb(103, 78, 167)", "rgb(166, 77, 121)",
                    "rgb(91, 15, 0)", "rgb(102, 0, 0)", "rgb(120, 63, 4)", "rgb(127, 96, 0)", "rgb(39, 78, 19)", 
                    "rgb(12, 52, 61)", "rgb(28, 69, 135)", "rgb(7, 55, 99)", "rgb(32, 18, 77)", "rgb(76, 17, 48)"]
            ]
        });



    });
</script>