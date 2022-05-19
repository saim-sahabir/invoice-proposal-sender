<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Mailcontroller extends CI_Controller {

   public function __construct() {
        parent::__construct();

        $this->load->model('Authentication_model');
        $this->load->model('Common_model'); 
        $this->load->model('Proposal_Invoice_model'); 
        $this->load->library('form_validation');
        $this->Common_model->setDefaultTimezone();
        
    } 


    ////////////////////////////////////////////////
    ////////// DOWNLOAD PDF FILE
    ////////////////////////////////////////////////
    public function downloadPDF($file = "") {
        // load ci download helder
        $this->load->helper('download');
        $data = file_get_contents("files/attachments/" . $file); // Read the file's 
        $name = $file;
        force_download($name, $data);
    }

    ////////////////////////////////////////////////
    ////////// PROPOSAL ACCEPTANCE
    ////////////////////////////////////////////////
    public function proposalAcceptance($encrypt_id, $enc_status) {
        $proposalId = decode_url(urldecode($encrypt_id));
        $status = decode_url(urldecode($enc_status));
        $data = array();
        $data['proposal_status'] = $status;
        $this->db->where('id', $proposalId);
        $this->db->update('tbl_proposal_invoice', $data);
        $pinfo = $this->db->query("SELECT c.name,p.company_id,p.invoice_user_id 
                FROM tbl_proposal_invoice p, tbl_customers c 
                WHERE p.customer_id=c.id AND p.id=$proposalId")->row();
        $afftectedRows = $this->db->affected_rows();
        if ($afftectedRows == 1) {
            if ($status == 'Accepted') {
                $message = 1;
                $data3 = array();
                $data3['notification_note'] = "Your estimate has been accepted by $pinfo->name";
                $data3['notification_date'] = date('Y-m-d');
                $data3['company_id'] = $pinfo->company_id;
                $data3['user_id'] = $pinfo->invoice_user_id;
                $this->db->insert('notification_infos', $data3);
            } else if ($status == 'Declined') {
                $message = 2;
                $data3 = array();
                $data3['notification_note'] = "Your estimate has been declined by $pinfo->name";
                $data3['notification_date'] = date('Y-m-d');
                $data3['company_id'] = $pinfo->company_id;
                $data3['user_id'] = $pinfo->invoice_user_id;
                $this->db->insert('notification_infos', $data3);
            } else {
                $message = 0;
            }
        } else {
            $message = 0;
        }

        $data = array();
        $data['message'] = $message;
         $this->load->view('proposalInvoice/proposal_acceptance_message', $data,);
        
    }

    ////////////////////////////////////////////////
    ////////// PROPOSAL HTML PREVIEW EMAIL
    ////////////////////////////////////////////////

    function proposalHtmlPreviewEmail($encrypt_key) {
        $proposal_id = decode_url(urldecode($encrypt_key));

        $customer_id = $this->db->where('id', $proposal_id)->SELECT('customer_id')->get('tbl_proposal_invoice')->row();
        $customer = $this->db->get_where('tbl_customers', array('id' => $customer_id->customer_id))->row();
        $proposal = $this->db->get_where('tbl_proposal_invoice', array('id' => $proposal_id))->row();
        $company_id = $proposal->company_id;
        $company = $this->db->query("SELECT * from tbl_companies where id = $company_id")->row();
        $customer_id = $this->db->where('id', $proposal_id)->SELECT('customer_id')->get('tbl_proposal_invoice')->row();
        $data['attachments'] = $this->db->query("SELECT pa.*,a.file,a.title FROM tbl_proposal_pdf pa, tbl_attachments a WHERE a.id=pa.attachment_id AND pa.proposal_id=$proposal_id")->result();
        $data['photos'] = $this->db->query("SELECT * FROM tbl_proposal_photo WHERE proposal_id=$proposal_id ORDER BY id ASC")->result();
        $data['service_products'] = $this->db->get_where('tbl_proposal_invoice_products_services', array('proposal_invoice_id' => $proposal_id))->result();
        $data['compnay_info'] = $company;
        $data['customer_info'] = $customer;
        $data['proposal_info'] = $proposal;
        $data['proposal_id'] = $proposal_id;

        $customize_body = $this->Common_model->GetCustomizeById($company->id);
        $tmpPropoBody = $customize_body->proposal_body;
        $find = array("[CUSTOMER_CONTACT_PERSON]");
        $replace = array($customer->c_person);
        $tmpPropoBody = str_replace($find, $replace, $tmpPropoBody);

        $tmpPropoBody = str_replace(array("[CUSTOMER_FULL_NAME]"), array($customer->name), $tmpPropoBody);
        $tmpPropoBody = str_replace(array("[CUSTOMER_SERVICE_ADDRESS]"), array($customer->address), $tmpPropoBody);
        $tmpPropoBody = str_replace(array("[COMPANY_PHONE]"), array($company->phone), $tmpPropoBody);
        $tmpPropoBody = str_replace(array("[COMPANY_EMAIL]"), array($company->email), $tmpPropoBody);

        $tmpPropoBody = str_replace(array("[COMPANY_NAME]"), array($company->name_company_name), $tmpPropoBody);
        $tmpPropoBody = str_replace(array("[COMPANY_ADDRESS]"), array($company->address), $tmpPropoBody);
        $tmpPropoBody = str_replace(array("[COMPANY_PHONE]"), array($company->phone), $tmpPropoBody);
        $tmpPropoBody = str_replace(array("[COMPANY_EMAIL]"), array($company->email), $tmpPropoBody);
        $tmpPropoBody = str_replace(array("[COMPANY_WEBSITE]"), array($company->website), $tmpPropoBody);

        $data['proposal_body'] = $tmpPropoBody;
        $data['proposal_body'] = $tmpPropoBody;

        //////////////////////////////////////////////////////////////////////////
        $this->load->view('templates/email_html_preview_template', $data);
    }

}

?>