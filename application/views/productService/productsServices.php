<script type="text/javascript">  
    var ingredient_id_container = [];


    $(function () {
        //Initialize Select2 Elements
        $('.select2').select2();
    })

</script>
<style>
    .input-sm{
        font-size:17px;
    }
    .input-sm{
        padding: 0 10px;
    }
    .c-btn{
    position: relative;
    background-color: #3f6ad8;
    color: #fff;
    box-shadow: 0 16px 26px -10px rgba(63,106,216,0.56), 0 4px 25px 0px rgba(0,0,0,0.12), 0 8px 10px -5px rgba(63,106,216,0.2);
    }
    .c-btn:hover{
    color: #fff;
    }
    .pagination>.active>a{
        background-color: #3f6ad8;
        border-color: #3f6ad8;
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

<style type="text/css">
    .top-left-header{
        margin-top: 0px !important;
    }
</style> 
<section class="content-header">
    <div class="row">
        <div class="col-md-6">
            <h2 class="top-left-header">Products/Services </h2>
        </div>
        <div class="col-md-offset-4 col-md-2">
            <a href="<?php echo base_url() ?>Product_service/addEditProductService"><button type="button" class="btn btn-block c-btn pull-right">Add Product/Service</button></a>
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
                                <th style="width: 1%"><?php echo lang('sn'); ?></th> 
                                <th style="width: 15%"><?php echo lang('name'); ?></th> 
                                <th style="width: 8%">Price</th>
                                <th style="width: 30%">Description</th>
                                <th style="width: 10%"><?php echo lang('added_by'); ?></th>
                                <th style="width: 6%;text-align: center"><?php echo lang('actions'); ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if ($productsServices && !empty($productsServices)) {
                                $i = count($productsServices);
                            }
                            foreach ($productsServices as $value) {
                                ?>                       
                                <tr> 
                                    <td style="text-align: center"><?php echo $i--; ?></td> 
                                    <td><?php echo $value->name; ?></td>    
                                    <td><?php echo $value->price; ?></td>    
                                    <td><?php echo $value->description; ?></td>    
                                    <td><?php echo userName($value->user_id); ?></td>  
                                    <td style="text-align: center">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                <i class="fa fa-gear tiny-icon"></i><span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right" role="menu">  
                                                <li><a href="<?php echo base_url() ?>Product_service/addEditProductService/<?php echo $this->custom->encrypt_decrypt($value->id, 'encrypt'); ?>" ><i class="fa fa-pencil tiny-icon"></i><?php echo lang('edit'); ?></a></li> 
                                                <li><a class="delete" href="<?php echo base_url() ?>Product_service/deleteProductService/<?php echo $this->custom->encrypt_decrypt($value->id, 'encrypt'); ?>" ><i class="fa fa-trash tiny-icon"></i><?php echo lang('delete'); ?></a></li> 
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
                                <th style="width: 1%"><?php echo lang('sn'); ?></th> 
                                <th style="width: 15%"><?php echo lang('name'); ?></th> 
                                <th style="width: 8%">Price</th>
                                <th style="width: 30%">Description</th>
                                <th style="width: 10%"><?php echo lang('added_by'); ?></th>
                                <th style="width: 6%;text-align: center"><?php echo lang('actions'); ?></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <!-- /.box-body -->
            </div> 
        </div> 
    </div> 
</section>
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
