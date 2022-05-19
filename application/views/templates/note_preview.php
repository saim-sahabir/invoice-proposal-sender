<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Preview Proposal</title>
        <style>
            body{
                width:100%;
                margin: 0;
                padding: 0;
                color:#000;
                font-family:"Helvetica Neue", Helvetica, Arial, sans-serif;
                font-size:14px;
                background-color: #fff;
            }
            #main{
                width: 860px;
                margin:0 auto;
                /*border:1px solid #ccc;*/
                padding:10px;
            }
            .section{
                padding:10px;
                /*border-bottom:1px solid #ccc;*/
                margin-bottom:15px;
                padding-bottom:15px;
            }
            .left{
                float:left;
            }
            .right{
                float:right;
            }
            .segment{
                width:300px;
            }
            .head-section p{
                margin: 3px;

            }
            .head-section h2,.head-section h3{
                margin:3px;
                text-indent: 10px;
            }
            .head-section h3{
                background-color: <?php echo $proposal_info->template_bg_color; ?>;
                padding:10px 4px;
                width:100%;
                color:<?php echo $proposal_info->template_text_color; ?>;
            }
            .standard p{
                margin: 3px;
                color:<?php echo $proposal_info->template_text_color; ?>;

            }
            .standard h2,.standard h3{
                margin:3px;
                color:<?php echo $proposal_info->template_text_color; ?>;
                text-indent: 10px;
            }
            img.logo{
                width:100px;
                height:auto;
                max-height: 100px;
            }
            .hide-colunm{
                border:none;
            }
            .head-section h2,.head-section h3{
                margin:10px 0px;
                margin-left:0px;
                margin-right:0px;
                text-indent: 10px;
            }

        </style>
    </head>
    <body>
        <div id="main">

            <?php
            if (isset($proposal_info) && !empty($proposal_info->note)):
                ?>
                <div class="section head-section " style="padding:0px 0px 15px 0px;margin:0px 0px 15px 0px;">
                    <h3>Additional Note:</h3>
                    <p><?php echo $proposal_info->note; ?></p>
                </div>
                <!--    .section-->
            <?php endif; ?>
            <div style="clear: both"></div>
        </div>
        <!--.main-->
    </body>
</html>