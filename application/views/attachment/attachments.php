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
    .top-left-header{
        margin-top: 0px !important;
    }
</style>

<script>
    $(document).ready(function(){
        $(".preview").click(function(e){
            e.preventDefault();
            var file="<?php echo base_url(); ?>files/attachments/"+$(this).data('file');
            $("#pdfFIle").attr("src",file);
            $("#pdfModal").modal('show');
        }); 
    }) 
</script>

<section class="content-header">
    <div class="row">
        <div class="col-md-6">
            <h2 class="top-left-header">Attachments </h2>
        </div>
        <div class="col-md-offset-4 col-md-2">
            <a href="<?php echo base_url() ?>Attachment/addEditAttachment"><button type="button" class="btn btn-block c-btn pull-right">Add Attachment</button></a>
        </div>
    </div> 
</section>

<section class="content">
    <div class="row">
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary"> 
                <!-- /.box-header -->
                <div class="box-body table-responsive"> 
                    <table id="datatable" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width: 1%">SN</th>
                                <th style="width: 25%">Title</th>
                                <th style="width: 25%">File(Download)</th>
                                <th style="width: 25%">File(Preview)</th>
                                <th style="width: 15%">Added By</th>
                                <th style="width: 6%; text-align: center"><?php echo lang('actions'); ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if ($attachments && !empty($attachments)) {
                                $i = count($attachments);
                            }
                            foreach ($attachments as $value) {
                                ?>                       
                                <tr> 
                                    <td style="text-align: center"><?php echo $i--; ?></td>
                                    <td><?php echo $value->title; ?></td> 
                                    <td><a href="<?php echo base_url(); ?>Attachment/downloadPDF/<?php echo $value->file; ?>" class="btn btn-primary"><i class="fa fa-download" aria-hidden="true"></i> Download</a></td> 
                                    <td><a href="#" class="btn btn-primary preview" data-file="<?php echo $value->file; ?>" ><i class="fa fa-eye tiny-icon"></i> Preview</a></td> 
                                    <td><?php echo userName($value->user_id); ?></td>  
                                    <td style="text-align: center">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                <i class="fa fa-gear tiny-icon"></i><span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right" role="menu"> 
                                                <li><a class="delete" href="<?php echo base_url() ?>Attachment/deleteAttachment/<?php echo $this->custom->encrypt_decrypt($value->id, 'encrypt'); ?>" ><i class="fa fa-trash tiny-icon"></i><?php echo lang('delete'); ?></a></li> 
                                            </ul> 
                                        </div>
                                    </td>
                                </tr>
                                <?php
                            }
                            ?> 
                        </tbody>
                        <tfoot>
                            <tr>
                                <th style="width: 1%">SN</th>
                                <th style="width: 25%">Title</th>
                                <th style="width: 25%">File(Download)</th>
                                <th style="width: 25%">File(Preview)</th>
                                <th style="width: 15%">Added By</th>
                                <th style="width: 6%; text-align: center"><?php echo lang('actions'); ?></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <!-- /.box-body -->
            </div> 
        </div> 
    </div> 
</section> 

<div class="modal fade" id="pdfModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-2x">×</i></span></button>
                    <h4 class="modal-title" id="myModalLabel"><i style="color:#3c8dbc" class="fa fa-eye"></i> Preview</h4>
                </div>
                <div class="modal-body"> 
                    <div class="row">
                        <embed src="" id="pdfFIle"  width="570" height="600"></embed>
                    </div>
                </div> 
            </div>
        </div>
    </div>

<!-- DataTables -->
<script src="<?php echo base_url(); ?>assets/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<?php echo base_url(); ?>assets/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<script>
    $(function () { 
        $('#datatable').DataTable({ 
            'autoWidth'   : false,
            'ordering'    : false
        })
    })
</script>


