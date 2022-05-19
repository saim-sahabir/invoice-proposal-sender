<style type="text/css">
    .required_star{
        color: #dd4b39;
    }

    .radio_button_problem{
        margin-bottom: 19px;
    }
    

</style>

<script type="text/javascript">
    $(function () {
    <?php //if ($tax_information->collect_vat != "Yes") { ?>
                //$('#vat_reg_no_container').hide();
    <?php //} ?> 
        $('#tax_setting_form').on('submit',function(){
            var error = 0; 
            var collect_tax_yes = $('#collect_tax_yes');
            var collect_tax_no = $('#collect_tax_no'); 
            var tax_registration_no = $('#tax_registration_no');
            var tax_is_gst_yes = $('#tax_is_gst_yes');
            var tax_is_gst_no = $('#tax_is_gst_no');
            var state_code = $('#state_code'); 
   
            if(!collect_tax_yes.is(':checked') && !collect_tax_no.is(':checked')){
                error++;
            }
            if(collect_tax_yes.is(':checked')){
                if(tax_title.val()==""){
                    error++;
                    $('#tax_title_error').fadeIn();
                }
                if(tax_registration_no.val()==""){
                    error++;
                    $('#tax_registration_no').fadeIn();
                }
                if(!tax_is_gst_yes.is(':checked') && !tax_is_gst_no.is(':checked')){
                    error++;
                }
                if(tax_is_gst_yes.is(':checked')){
                    if(state_code.val()==""){
                        error++;
                        $('#state_code_error').fadeIn();
                    }
                }
            }
            
              
        });
        $(document).on('click','.remove_this_tax_row',function(){
            var this_row = $(this);
            var this_row_id = this_row.attr('id').substr(20);
            $('#tax_row_'+this_row_id).remove();
            var j = 1;
            $('.remove_this_tax_row').each(function(i, obj) {
                $(this).attr('id','remove_this_tax_row_'+j);
                $(this).parent().parent().attr('id','tax_row_'+j);
                $(this).parent().parent().find('td:first-child').text(j);
                j++;
            });
        });
        $(document).on('click','#remove_all_taxes',function(){
            $('.tax_single_row').remove();
        });
        $('#collect_tax_yes').on('click',function(){
            $('#tax_yes_section').fadeIn();   
        });
        $('#collect_tax_no').on('click',function(){
            $('#tax_yes_section').fadeOut() 
        });
        
        $('#tax_is_gst_yes').on('click',function(){
            $('#gst_yes_section').fadeIn();   
        });
        $('#tax_is_gst_no').on('click',function(){
            $('#gst_yes_section').fadeOut() 
        });
        $('#add_tax').on('click',function(){
            var table_tax_body = $('#tax_table_body');
            var tax_body_row_length = table_tax_body.find('tr').length;
            var new_row_number = tax_body_row_length+1;
            var show_tax_row = ''; 
            show_tax_row += '<tr class="tax_single_row" id="tax_row_'+new_row_number+'">'; 
            show_tax_row += '<td>'+new_row_number+'</td>'; 
            show_tax_row += '<td><input type="text" name="taxes[]" class="form-control"/></td>'; 
            show_tax_row += '<td><input type="text" name="percentages[]" class="form-control integerchk"/></td>'; 
            show_tax_row += '<td><span class="remove_this_tax_row" id="remove_this_tax_row_'+new_row_number+'" style="cursor:pointer;">X</span></td>'; 
            show_tax_row += '</tr>';

            table_tax_body.append(show_tax_row); 
        });
        $('input[type=radio][name=collect_vat]').change(function() {
            if (this.value == 'Yes') {
                $('#vat_reg_no_container').show();
            }
            else if (this.value == 'No') {
                $('#vat_reg_no_container').hide();
            }
        });

 
    })
</script>
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
        Tax Setting
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
                $attributes = array('id' => 'tax_setting_form');
                echo form_open(base_url('Tax_setting/taxSetting/'),$attributes); ?>
                <div class="box-body">                      
                    <div class="row"> 
                        <div class="col-md-6">
                            <div class="form-group radio_button_problem">
                                <label><?php echo lang('collect_tax'); ?> <span class="required_star">*</span></label>  
                                <div class="radio">
                                    <label> 
                                        <input type="radio" name="collect_tax" id="collect_tax_yes" value="Yes" 
                                        <?php
                                        if ($tax_information->collect_tax == "Yes") {
                                            echo "checked";
                                        };
                                        ?>
                                               >Yes </label>
                                    <label>

                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

                                        <input type="radio" name="collect_tax" id="collect_tax_no" value="No" 
                                        <?php
                                        if ($tax_information->collect_tax == "No" || ($tax_information->collect_tax != "Yes" && $tax_information->collect_tax != "No")) {
                                            echo "checked";
                                        };
                                        ?>
                                               >No 
                                    </label>
                                </div>
                            </div>
                            <?php if (form_error('collect_tax')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('collect_tax'); ?></p>
                                </div>
                            <?php } ?>  
                        </div>  
                    </div> 
                    <div id="tax_yes_section" style="display:<?php if($tax_information->collect_tax=="Yes"){echo "block;";}else{echo "none;";}?>"> 

                        <div class="row">  
                            <div class="col-md-6">

                                <div class="form-group">
                                    <label><?php echo lang('tax_registration_no'); ?> <span class="required_star">*</span></label>
                                    <input type="text" id="tax_registration_no" name="tax_registration_no" class="form-control" placeholder="<?php echo lang('tax_registration_no'); ?>" value="<?php echo $tax_information->tax_registration_no; ?>">
                                </div>
                                <?php if (form_error('tax_registration_no')) { ?>
                                    <div class="alert alert-error" style="padding: 5px !important;">
                                        <p><?php echo form_error('tax_registration_no'); ?></p>
                                    </div>
                                <?php } ?>
                                <div class="alert alert-error" style="padding: 5px !important;display:none;" id="tax_registration_no_error">
                                    <p>The Tax Registration No field is required.</p>
                                </div>

                            </div>
                             
                            
                        </div> 
                        <br>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group radio_button_problem">
                                    <label><?php echo lang('tax_is_gst'); ?> <span class="required_star">*</span></label>  
                                    <div class="radio">
                                        <label> 
                                            <input type="radio" name="tax_is_gst" id="tax_is_gst_yes" value="Yes" 
                                            <?php
                                            if ($tax_information->tax_is_gst == "Yes") {
                                                echo "checked";
                                            };
                                            ?>
                                                   >Yes </label>
                                        <label>

                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

                                            <input type="radio" name="tax_is_gst" id="tax_is_gst_no" value="No" 
                                            <?php
                                            if ($tax_information->tax_is_gst == "No" || ($tax_information->tax_is_gst != "Yes" && $tax_information->tax_is_gst != "No")) {
                                                echo "checked";
                                            };
                                            ?>
                                                   >No 
                                        </label>
                                    </div>
                                </div>
                                <?php if (form_error('tax_is_gst')) { ?>
                                    <div class="alert alert-error" style="padding: 5px !important;">
                                        <p><?php echo form_error('tax_is_gst'); ?></p>
                                    </div>
                                <?php } ?>  
                                <button id="what_will_happen_if_i_say_yes" type="button" class="btn c-btn" data-toggle="modal" data-target="#what_will_happen_if_i_say_yes_modal" style="color: white;"><?php echo lang('if_i_say_yes'); ?></button>

                            </div>
                        </div>
                        <div id="gst_yes_section" style="display:<?php if($tax_information->tax_is_gst=="Yes"){echo "block;";}else{echo "none;";} ?>">
                            <div class="row"> 
                                <div class="col-md-6">

                                    <div class="form-group">
                                        <label><?php echo lang('state_code'); ?> <span class="required_star">*</span></label>
                                        <input type="text" id="state_code" name="state_code" class="form-control" placeholder="<?php echo lang('state_code'); ?>" value="<?php echo $tax_information->state_code; ?>">
                                    </div>
                                    <?php if (form_error('state_code')) { ?>
                                        <div class="alert alert-error" style="padding: 5px !important;">
                                            <p><?php echo form_error('state_code'); ?></p>
                                        </div>
                                    <?php } ?>
                                    <div class="alert alert-error" style="padding: 5px !important;display:none;" id="state_code_error">
                                        <p>The State Code field is required.</p>
                                    </div>

                                </div>

                                  
                            </div>    
                        </div> 
                        <br>
                     
                    <div class="row">
                        <div class="col-md-6">

                            <div class="form-group">
                                <label><?php echo lang('my_tax_fields');?> <span class="required_star">*</span></label>
                                <table id="datatable" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width: 1%">SN</th>
                                            <th style="width: 20%">Name</th>
                                            <th style="width: 20%">Percentage</th>
                                            <th style="width: 10%"><span id="remove_all_taxes" style="cursor:pointer;">X</span></th>
                                        </tr>
                                    </thead>
                                    <tbody id="tax_table_body">
                                        <?php 
                                            $new_row_number = 1;
                                            $show_tax_row = '';
                                            if(isset($tax_fields) && count($tax_fields)>0){
                                                foreach($tax_fields as $single_tax){
                                                    $show_tax_row .= '<tr class="tax_single_row" id="tax_row_'.$new_row_number.'">'; 
                                                    $show_tax_row .= '<td>'.$new_row_number.'</td>'; 
                                                    $show_tax_row .= '<td><input type="text" name="taxes[]" class="form-control" value="'.$single_tax->tax.'"/></td>'; 
                                                    $show_tax_row .= '<td><input type="text" name="percentages[]" class="form-control integerchk" value="'.$single_tax->percentage.'"/></td>'; 
                                                    $show_tax_row .= '<td><span class="remove_this_tax_row" id="remove_this_tax_row_'.$new_row_number.'" style="cursor:pointer;">X</span></td>'; 
                                                    $show_tax_row .= '</tr>';
                                                    $new_row_number++;
                                                }    
                                            }
                                            
                                            echo $show_tax_row;
                                        ?>
                                    </tbody>
                                </table>
                                <button id="add_tax" class="btn c-btn" type="button"><?php echo lang('add_more'); ?></button>
                                <!-- <input type="text" name="state_code" class="form-control" placeholder="State Code" value="<?php echo set_value('state_code'); ?>" /> -->
                            </div>
                            <?php if (form_error('taxes[]')) { ?>
                                <div class="alert alert-error" style="padding: 5px !important;">
                                    <p><?php echo form_error('taxes[]'); ?></p>
                                </div>
                            <?php } ?> 
                        </div> 
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <button type="submit" name="submit" value="submit" class="btn c-btn"><?php echo lang('submit'); ?></button>
                    <!-- <a href="<?php echo base_url() ?>Tax_settings/setting"><button type="button" class="btn c-btn">Back</button></a> -->
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div> 
</section>

 

<!-- Modal -->
<div id="show_how_tax_title_works_modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><?php echo lang('how_tax_title_works'); ?></h4>
      </div>
      <div class="modal-body">
        <p>
            Which will be shown in Invoice<br>
            Like GST for India<br>
            HST for Canada<br>
            VAT for Bangladesh<br>
            Sales Tax for Other etc.<br>
            It will be shown at Top of the invoice like:   <br>
            TAX TITLE Registration Number: XXXXXXX<br>
            It will be shown at bottom of the invoice like: <br>
            Total TAX TITLE = XXX Amount  <br>
            Note that UPPERCASE texts are variable
            </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<!-- Modal -->
<div id="what_will_happen_if_i_say_yes_modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">What will happen if I say Yes</h4>
      </div>
      <div class="modal-body">
        <p> 
        If you dont enter customer's GST number, system will apply CGST and SGST<br>
        But for this you have to add CGST, SGST, IGST and VAT in Tax Fields<br>
        In Proposal/Invoice, when selecting customer you will get option to set customer's GST Number and system will match your state code with customer's state code, if these match, system will apply CGST and IGST, if does not, system will apply CGST and SGST<br>  
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>