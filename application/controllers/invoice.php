 <?php
defined('BASEPATH') OR exit('No direct script access allowed');

class invoice extends Cl_Controller {

    public function __construct() {
        parent::__construct();

        $this->load->model('Authentication_model');
        $this->load->model('Common_model'); 
        $this->load->model('Proposal_Invoice_model'); 
        $this->load->library('form_validation');
        $this->Common_model->setDefaultTimezone();
        
        if (!$this->session->has_userdata('user_id')) {
            redirect('Authentication/index');
        } 
    } 

    function invoices() {

        $company_id = $this->session->userdata('company_id'); 
         $data = array(); 
         $data['lists'] = $this->Proposal_Invoice_model->getAllproposal_inoviceByCompanyId($company_id, "Invoice"); 
         $data['main_content'] = $this->load->view('proposalInvoice/invoice_list', $data, TRUE);
         $this->load->view('userHome', $data); 
 

     }


}