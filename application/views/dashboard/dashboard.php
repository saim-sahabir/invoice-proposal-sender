<!-- bootstrap datepicker -->
<script src="<?php echo base_url(); ?>assets/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script> 
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<script type="text/javascript" src="<?php echo base_url(); ?>assets/POS/js/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<style type="text/css">
  .btn-glyphicon { padding:8px; background:#ffffff; margin-right:4px; }
  .icon-btn { padding: 1px 15px 3px 2px; border-radius:50px; transition: opacity 0.4s;}
  .icon-btn:hover{
    opacity: .9;
  }
  .text-info{ color: white; padding: 10px; }
  #operation_comparision_range_fields{
    width: 300px;
    height: 100px;
    position: absolute;
    background-color: #ffffff;
    border: 1px solid #d8dce0;
    top: 0;
    right: 0;
    box-shadow: 0px 0px 12px #8e8e8e;
    border-radius: 5px;
    display: none;
    z-index:1;
  }
  #operation_comparision_input{
      border: 1px solid #cfcfcf;
      height: 30px;
      width: 90%;
      padding: 0px 0px 0px 5px;
      margin: 5%;
  }

  .btn-info{ margin-bottom: 15px; margin-right: 30px; }
</style>
  
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?php echo lang('dashboard'); ?>
        <small><?php echo lang('business_intelligence'); ?></small>
      </h1> 
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->

        
          
</section>

          <!-- /.box --> 
      <!-- /.row (main row) --> 
    <!-- /.content --> 
<!-- /.content -->
<!-- bootstrap datepicker -->
<script src="<?php echo base_url(); ?>assets/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

<!-- bootstrap datepicker -->
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css"> 
<!-- ChartJS -->
<script src="<?php echo base_url(); ?>assets/bower_components/chart.js/Chart.js"></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script src="<?php echo base_url(); ?>assets/bower_components/raphael/raphael.min.js"></script>
<script src="<?php echo base_url(); ?>assets/bower_components/morris.js/morris.min.js"></script>
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/morris.js/morris.css">
<script> 

  $(function () {

    //BAR CHART
    var bar = new Morris.Bar({
      element: 'operational_comparision',
      resize: true,
      data: [
        {y: '<?php echo lang('purchase'); ?>', a: <?php echo $purchase_sum->purchase_sum; ?>},
        {y: '<?php echo lang('sale'); ?>', a: <?php echo $sale_sum->sale_sum; ?>},
        {y: '<?php echo lang('waste'); ?>', a: <?php echo $waste_sum->waste_sum; ?>},
        {y: '<?php echo lang('expense'); ?>', a: <?php echo $expense_sum->expense_sum; ?>},
        {y: '<?php echo lang('cust_rcv'); ?>', a: <?php echo $customer_due_receive_sum->customer_due_receive_sum; ?>},
        {y: '<?php echo lang('supp_pay'); ?>', a: <?php echo $supplier_due_payment_sum->supplier_due_payment_sum; ?>} 
      ],
      barColors: ['#00a65a', '#f56954'],
      xkey: 'y',
      ykeys: ['a'],
      labels: ['Amount'],
      hideHover: 'auto'
    });

  $('#low_stock_ingredients, #top_ten_food_menu, #top_ten_customer, #customer_receivable, #supplier_payable').slimscroll({
    height: '220px'
  });

  // -------------
  // - PIE CHART -
  // -------------
  // Get context with jQuery - using jQuery's .get() method.
  var pieChartCanvas = $('#pieChart').get(0).getContext('2d');
  var pieChart       = new Chart(pieChartCanvas);
  var PieData        = [
    {
      value    : <?php echo $dinein_count->dinein_count; ?>,
      color    : '#DD4B39',
      highlight: '#DD4B39',
      label    : 'Dine In'
    },
    {
      value    : <?php echo $take_away_count->take_away_count; ?>,
      color    : '#4c1c00',
      highlight: '#4c1c00',
      label    : 'Take Away'
    },
    {
      value    : <?php echo $delivery_count->delivery_count; ?>,
      color    : '#6F61AA',
      highlight: '#6F61AA',
      label    : 'Delivery'
    } 
  ];
  var pieOptions     = {
    // Boolean - Whether we should show a stroke on each segment
    segmentShowStroke    : true,
    // String - The colour of each segment stroke
    segmentStrokeColor   : '#fff',
    // Number - The width of each segment stroke
    segmentStrokeWidth   : 1,
    // Number - The percentage of the chart that we cut out of the middle
    percentageInnerCutout: 50, // This is 0 for Pie charts
    // Number - Amount of animation steps
    animationSteps       : 100,
    // String - Animation easing effect
    animationEasing      : 'easeOutBounce',
    // Boolean - Whether we animate the rotation of the Doughnut
    animateRotate        : true,
    // Boolean - Whether we animate scaling the Doughnut from the centre
    animateScale         : false,
    // Boolean - whether to make the chart responsive to window resizing
    responsive           : true,
    // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
    maintainAspectRatio  : false,
    // String - A legend template
    legendTemplate       : '<ul class=\'<%=name.toLowerCase()%>-legend\'><% for (var i=0; i<segments.length; i++){%><li><span style=\'background-color:<%=segments[i].fillColor%>\'></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>',
    // String - A tooltip template
    tooltipTemplate      : '<%=value %> <%=label%> Orders'
  };
  // Create pie or douhnut chart
  // You can switch between pie and douhnut using the method below.
  pieChart.Doughnut(PieData, pieOptions);
  // -----------------
  // - END PIE CHART -
  // -----------------  
  })

</script>


<script type="text/javascript">
  var currency = "<?php echo $this->session->userdata('currency') ?>";
        var base_url = "<?php echo base_url();?>";
  $(document).ready(function(){
      selectMonth(12);
      $('#operational_coparision_range').on('click',function(){
        $('#operation_comparision_range_fields').show();
      });
      $('#operation_comparision_cancel').on('click',function(){
        $('#operation_comparision_range_fields').hide();
      })
      $('#operation_comparision_input').daterangepicker({
        opens: 'left',
        locale: {
          format: 'YYYY-MM-DD'
        }
      });
      $('#operation_comparision_submit').on('click',function(){
        
        var date_range = $('#operation_comparision_input').val();
        var date_range_array = date_range.split(" - ");
        var from_this_day = date_range_array[0];
        var to_this_day = date_range_array[1];
        $.ajax({
            url: '<?php echo base_url("Dashboard/operation_comparision_by_date_ajax") ?>',
            method:"POST",
            data:{
                from_this_day : from_this_day,
                to_this_day : to_this_day,
                '<?php echo $this->security->get_csrf_token_name(); ?>': '<?php echo $this->security->get_csrf_hash(); ?>'
            },
            success:function(response) {
              response = JSON.parse(response);
              //BAR CHART
              var bar = new Morris.Bar({
                element: 'operational_comparision',
                resize: true,
                data: [
                  {y: 'Purchase', a: response.purchase_sum.purchase_sum},
                  {y: 'Sale', a: response.sale_sum.sale_sum},
                  {y: 'Waste', a: response.waste_sum.waste_sum},
                  {y: 'Expense', a: response.expense_sum.expense_sum},
                  {y: 'Cust Rcv', a: response.customer_due_receive_sum.customer_due_receive_sum},
                  {y: 'Supp Pay', a: response.supplier_due_payment_sum.supplier_due_payment_sum} 
                ],
                barColors: ['#00a65a', '#f56954'],
                xkey: 'y',
                ykeys: ['a'],
                labels: ['Amount'],
                hideHover: 'auto'
              });
              
            },
            error:function(){
                alert("error");
            }
        });
        $('#operation_comparision_range_fields').hide();
      });
  });

function  selectMonth(value) {
        $.ajax({
            url: '<?= base_url() ?>Dashboard/comparison_sale_report_ajax_get',
            type: 'get',
            datatype: 'json',
            data: {
              months: value,
              '<?php echo $this->security->get_csrf_token_name(); ?>': '<?php echo $this->security->get_csrf_hash(); ?>'
            },
            success: function (response) {
                var json = $.parseJSON(response);
                google.charts.load('current', {'packages':['corechart', 'bar']});
                google.charts.setOnLoadCallback(drawStuff);
                function drawStuff() {
                    var chartDiv = document.getElementById('chart_div');

                    var data = '';
                    var dataArray = [];
                    var dataArrayValue = [];
                    dataArrayValue = [];
                    dataArrayValue.push('');
                    dataArrayValue.push('');
                    dataArray.push(dataArrayValue);

                    $.each(json, function (i, v) {
                        window['monthName'+i]=v.month;
                        window['collection'+i]=v.saleAmount;
                        dataArrayValue = [];
                        dataArrayValue.push(v.month);
                        dataArrayValue.push(v.saleAmount);
                        dataArray.push(dataArrayValue);
                    });
                    data = google.visualization.arrayToDataTable(dataArray);
                    var options = {
                        legend: { position: "none" },
                        colors: ['#00a65a', '#00a65a', '#00a65a'],
                        axes: {
                            y: {
                                all: {
                                    format: {
                                        pattern: 'decimal'
                                    }
                                }
                            }
                        },
                        series: {
                            0: { axis: '0' }
                        }
                    };

                    function drawMaterialChart() {
                        var materialChart = new google.charts.Bar(chartDiv);
                        materialChart.draw(data,options);
                    }
                    function drawClassicChart() {
                        var classicChart = new google.visualization.ColumnChart(chartDiv);
                        classicChart.draw(data, classicOptions);

                    }
                    drawMaterialChart();
                }
            }
        });

    }
</script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/POS/js/jquery.cookie.js"></script>