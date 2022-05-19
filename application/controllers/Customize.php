<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Customize extends Cl_Controller {

    public function __construct() {
        parent::__construct();
 
        $this->load->model('Authentication_model');
        $this->load->model('Common_model'); 
        $this->load->library('form_validation');
        $this->Common_model->setDefaultTimezone();
        
        if (!$this->session->has_userdata('user_id')) {
            redirect('Authentication/index');
        } 
    } 

    /* ----------------------Customize Start-------------------------- */  

    public function proposalBody() {
        $company_id = $this->session->userdata('company_id');
        if ($this->input->post('submit')) {
            $this->form_validation->set_rules('proposal_body', 'Proposal Body', 'required'); 
             
            if ($this->form_validation->run() == TRUE) {
                $data = array();
                $data['proposal_body'] = $this->input->post('proposal_body'); 
                 
                $this->Common_model->updateInformationByCompanyId($data, $company_id, "tbl_customize");
                $this->session->set_flashdata('exception',lang('update_success')); 
                redirect('Customize/proposalBody');
            } else { 
                $data = array();
                $data['customize_information'] = $this->Common_model->getByCompanyId($company_id, "tbl_customize");
                $data['main_content'] = $this->load->view('customize/proposalBody', $data, TRUE);
                $this->load->view('userHome', $data); 
            }
        } else { 
            $data = array();
            $data['customize_information'] = $this->Common_model->getByCompanyId($company_id, "tbl_customize");
            $data['main_content'] = $this->load->view('customize/proposalBody', $data, TRUE);
            $this->load->view('userHome', $data); 
        }
    }  

    public function proposalEmail() {
        $company_id = $this->session->userdata('company_id');
        if ($this->input->post('submit')) {
            $this->form_validation->set_rules('proposal_email', 'Proposal Email', 'required'); 
             
            if ($this->form_validation->run() == TRUE) {
                $data = array();
                $data['proposal_email'] = $this->input->post('proposal_email'); 
                 
                $this->Common_model->updateInformationByCompanyId($data, $company_id, "tbl_customize");
                $this->session->set_flashdata('exception',lang('update_success')); 
                redirect('Customize/proposalEmail');
            } else { 
                $data = array();
                $data['customize_information'] = $this->Common_model->getByCompanyId($company_id, "tbl_customize");
                $data['main_content'] = $this->load->view('customize/proposalEmail', $data, TRUE);
                $this->load->view('userHome', $data); 
            }
        } else { 
            $data = array();
            $data['customize_information'] = $this->Common_model->getByCompanyId($company_id, "tbl_customize");
            $data['main_content'] = $this->load->view('customize/proposalEmail', $data, TRUE);
            $this->load->view('userHome', $data); 
        }
    }  


    public function invoiceEmail() {
        $company_id = $this->session->userdata('company_id');
        if ($this->input->post('submit')) {
            $this->form_validation->set_rules('invoice_email', 'Invoice Email', 'required'); 
             
            if ($this->form_validation->run() == TRUE) {
                $data = array();
                $data['invoice_email'] = $this->input->post('invoice_email'); 
                 
                $this->Common_model->updateInformationByCompanyId($data, $company_id, "tbl_customize");
                $this->session->set_flashdata('exception',lang('update_success')); 
                redirect('Customize/invoiceEmail');
            } else { 
                $data = array();
                $data['customize_information'] = $this->Common_model->getByCompanyId($company_id, "tbl_customize");
                $data['main_content'] = $this->load->view('customize/invoiceEmail', $data, TRUE);
                $this->load->view('userHome', $data); 
            }
        } else { 
            $data = array();
            $data['customize_information'] = $this->Common_model->getByCompanyId($company_id, "tbl_customize");
            $data['main_content'] = $this->load->view('customize/invoiceEmail', $data, TRUE);
            $this->load->view('userHome', $data); 
        }
    }  

    /* ----------------------Customize End-------------------------- */ 
}
