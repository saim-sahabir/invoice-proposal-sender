<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Dashboard_model
 *
 * @author user
 */
class Proposal_Invoice_model extends CI_Model {



 public function proposalPDF($proposal_id) {
        $data = array();
        $org_id = $this->session->userdata('user_id');
        $company = $this->db->query("SELECT * from tbl_companies where id=$org_id")->row();
        $customer_id = $this->db->where('id', $proposal_id)->SELECT('customer_id')->get('tbl_proposal_invoice')->row();
        $customer = $this->db->get_where('tbl_customers', array('id' => $customer_id->customer_id))->row();
        $proposal = $this->db->get_where('tbl_proposal_invoice', array('id' => $proposal_id))->row();
        $customer_id = $this->db->where('id', $proposal_id)->SELECT('customer_id')->get('tbl_proposal_invoice')->row();
        $data['attachments'] = $this->db->get_where('tbl_proposal_pdf', array('proposal_id' => $proposal_id))->result();
        $data['photos'] = $this->db->query("SELECT * FROM tbl_proposal_photo WHERE proposal_id=$proposal_id ORDER BY id ASC")->result();
        $data['service_products'] = $this->db->get_where('tbl_proposal_invoice_products_services', array('  proposal_invoice_id' => $proposal_id))->result();
        $data['compnay_info'] = $company;
        $data['customer_info'] = $customer;
        $data['proposal_info'] = $proposal;

        $tmpPropoBody = $company->proposal_body;
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
        //$this->load->view('templates/preview_proposal', $data);
        // exit();
        // //////////////PDF SECTION ////////////////////////////
        $first_name = "Proposal_" . $proposal->proposal_no;
        $filename = "Proposal_Number_$proposal->proposal_no";
        $filename.='_' . str_replace(" ", "_", "$company->name_company_name");


        $pdfFilePath = $_SERVER['DOCUMENT_ROOT'] . str_replace('index.php', '', $_SERVER['SCRIPT_NAME']) . "/proposalPdf/" . $first_name . ".pdf";

        ini_set("pcre.backtrack_limit", "1000000000");
        ini_set('memory_limit', '256M');
        $html = $this->load->view('templates/preview_proposal', $data, true);
        require_once 'vendor/autoload.php';

        $pdf = new \Mpdf\Mpdf(); 
        $pdf->WriteHTML($html); 

        if (!empty($data['proposal_info']->note)) {
            $pdf->AddPage();
            $html1 = $this->load->view('templates/note_preview', $data, true);
            $pdf->WriteHTML($html1);
        }
        if (isset($data['photos']) && count($data['photos']) > 0) {
            $pdf->AddPage();
            $html2 = $this->load->view('templates/photo_preview', $data, true);
            $pdf->WriteHTML($html2);
        }
        if (isset($data['attachments']) && count($data['attachments']) > 0) {
            $pdf->AddPage();
            $html3 = $this->load->view('templates/attachemnt_preview', $data, true);
            $pdf->WriteHTML($html3);
        }

        $pdf->Output($pdfFilePath, 'F'); //F for save D for download
         //$pdf->Output($pdfFilePath, 'D');

        if (count($data['attachments']) > 0) {

            require_once(APPPATH . 'libraries/PDFMerger.php');
            $merger = new PDFMerger;

            $pdfFilePath_cover = 'proposalPdf/' . $first_name . '.pdf';
            $merger->addPDF($pdfFilePath_cover);

            foreach ($data['attachments'] as $attachment):
                $merger->addPDF('files/attachments/' . findAttahment($attachment->attachment_id));
            endforeach;

            $merger->merge('file', "proposalPdf/" . $filename . ".pdf");
        }else {
            rename("proposalPdf/" . $first_name . ".pdf", "proposalPdf/" . $filename . ".pdf");
        }
        return $filename;
      }
 

    public function InvoicePdf($id) {
        $data = array();
        $company_id = $this->session->userdata('user_id');
        //////////////////////////////
        $propsal_data = $this->db->query("SELECT * FROM tbl_proposal_invoice WHERE id = $id")->row();
        $company = $this->db->query("SELECT * from tbl_companies where id= $company_id")->row();
        $filename = "Invoice_Number_$propsal_data->invoice_no";
        $filename.='_' . str_replace(" ", "_", "$company->name_company_name");


        $data['customer_info'] = $this->db->where('id', $propsal_data->customer_id)->get('tbl_customers')->row();
        $data['proposal_info'] = $propsal_data;
        $data['service_products'] = $this->db->where('proposal_invoice_id', $id)->get('tbl_proposal_invoice_products_services')->result();
        $data['compnay_info'] = $company;

        ////////////////PDF SECTION ////////////////////////////
        $pdfFilePath = $_SERVER['DOCUMENT_ROOT'] . str_replace('index.php', '', $_SERVER['SCRIPT_NAME']) . "/InvoicePdf/" . $filename . ".pdf";
        ini_set("pcre.backtrack_limit", "1000000000");
        ini_set('memory_limit', '256M');
        $html = $this->load->view('templates/invoice_template', $data, true);
        require_once 'vendor\autoload.php';

        $pdf = new \Mpdf\Mpdf(); 
        $pdf->WriteHTML($html); 
        $pdf->Output($pdfFilePath, 'F'); //F for save D for download
        return $filename;
    }


public function getAllproposal_inoviceByCompanyId($company_id, $type) {
        $result = $this->db->select('*');
                  $this->db->from('tbl_proposal_invoice');
                  $this->db->where('company_id', $company_id);
                  $this->db->where('type', $type);
                  $this->db->where('del_status', 'Live'); 
                  $this->db->order_by('id','DESC');
                  
             return $this->db->get()->result();
    }





}