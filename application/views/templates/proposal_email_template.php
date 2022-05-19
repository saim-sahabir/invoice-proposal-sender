<div style="background-color:#F7F2F7; width:700px; padding:20px 0px;">
    <div style="margin:0px 30px; font-family:arial; background-color:#fff; border:5px solid #3F6AD8; -webkit-border-radius:10px; -moz-border-radius:10px; border-radius:10px; padding:0px; color:#666;">
        <div style="padding:10px; font-size:22px; text-align:center; color:#3F6AD8; font-family: arial; border-bottom:1px solid #999; clear: both;height: 74px;">
            <div style="width:150px; float:left;height: 100px;">
                <?php echo $logo; ?>
            </div>
            <div style="width:450px;">
                <h2 style="margin:0px; margin-top:20px;">Estimate for you!</h2>
            </div> 
        </div>
        <div style="padding:10px;margin-bottom:0px;padding-bottom:10px;">
            <?php echo $messages; ?>
        </div>
        <h2 align="center">
            <a href="<?php echo base_url(); ?>mailcontroller/proposalHtmlPreviewEmail/<?php echo $proposal_id; ?>" style="width:auto;padding:6px 10px;color:#fff;background-color:#3F6AD8;text-align: center;font-size:18px;border:1px solid #357EBD;text-decoration: none;border-radius:4px;">Preview</a>
            <a href="<?php echo base_url(); ?>mailcontroller/proposalAcceptance/<?php echo $proposal_id; ?>/<?php echo urlencode(encode_url('Accepted')); ?>" style="width:auto;padding:6px 10px;margin:0 0 0 15px;color:#fff;background-color:#3F6AD8;text-align: center;font-size:18px;border:1px solid #357EBD;text-decoration: none;border-radius:4px;">Accept</a>
            <a href="<?php echo base_url(); ?>mailcontroller/proposalAcceptance/<?php echo $proposal_id; ?>/<?php echo urlencode(encode_url('Declined')); ?>" style="width:auto;padding:6px 10px;margin:0 0 0 15px;color:#fff;background-color:#cd0606;text-align: center;font-size:18px;border:1px solid #cd0606;text-decoration: none;border-radius:4px;">Decline</a>
        </h2>
        <div style="border-top:1px solid #999;">
            <h3 align="center">
                <p style="text-decoration: none; color:#666; width: 100%; display: block; font-size: 15px; margin: 0px;"> Sent by <br> <a target="_blank" href="#">FLYPAPYRUS</a>: Small Business Accounting Software</p>
                <p style="text-decoration: none; color:#666; width: 100%; display: block; font-size: 13px; margin: 0px;"> Software by <a href="http://doorsoft.xyz">Door Soft</a> </p>
            </h3>
        </div>
    </div>
</div> 