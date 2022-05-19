<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Customer extends Cl_Controller {

    public function __construct() {
        parent::__construct();

        $this->load->library('excel'); //load PHPExcel library 
        $this->load->model('Authentication_model');
        $this->load->model('Common_model'); 
        $this->load->library('form_validation');
        $this->Common_model->setDefaultTimezone();
        
        if (!$this->session->has_userdata('user_id')) {
            redirect('Authentication/index');
        } 
    } 

    /* ----------------------Customer Start-------------------------- */

    public function customers() {
        $company_id = $this->session->userdata('company_id');

        $data = array();
        $data['customers'] = $this->Common_model->getAllByCompanyId($company_id, "tbl_customers");
        $data['main_content'] = $this->load->view('customer/customers', $data, TRUE);
        $this->load->view('userHome', $data);
    }

    public function deleteCustomer($id) {
        $id = $this->custom->encrypt_decrypt($id, 'decrypt');

        $this->Common_model->deleteStatusChange($id, "tbl_customers");

        $this->session->set_flashdata('exception',lang('delete_success'));
        redirect('Customer/customers');
    }

    public function addEditCustomer($encrypted_id = "") {
        $id = $this->custom->encrypt_decrypt($encrypted_id, 'decrypt');
        if ($this->input->post('submit')) {
            $this->form_validation->set_rules('name', 'Name/Company Name', 'required|max_length[50]');
            $this->form_validation->set_rules('c_person', 'person', 'required|max_length[50]');
            $this->form_validation->set_rules('phone', 'Phone', 'required|max_length[50]');
            $this->form_validation->set_rules('email', 'Email', "valid_email|max_length[100]");
            if ($this->input->post('website')) {
                $this->form_validation->set_rules('website', 'Website', "callback_valid_url_format|max_length[100]"); 
            }
             $this->form_validation->set_rules('billing_address', 'Billing Address', "required|max_length[250]");
            $this->form_validation->set_rules('address', 'Address', "required|max_length[250]");
            if ($this->session->userdata('tax_is_gst') == 'Yes') {
                $this->form_validation->set_rules('gst_number', 'GST Number', "required|max_length[100]");
            }
            if ($this->form_validation->run() == TRUE) {
                $customer_info = array();
                $customer_info['name'] = htmlspecialchars($this->input->post($this->security->xss_clean('name'))); 
                $customer_info['phone'] = $this->input->post($this->security->xss_clean('phone'));
                $customer_info['c_person'] = $this->input->post($this->security->xss_clean('c_person'));
                $customer_info['email'] = $this->input->post($this->security->xss_clean('email'));
                $customer_info['website'] = $this->input->post($this->security->xss_clean('website'));
                $customer_info['billing_address'] = $this->input->post($this->security->xss_clean('billing_address'));
                $customer_info['address'] = $this->input->post($this->security->xss_clean('address')); 
                if ($this->session->userdata('tax_is_gst') == 'Yes') {
                    $customer_info['gst_number'] = $this->input->post($this->security->xss_clean('gst_number'));
                }
                $customer_info['user_id'] = $this->session->userdata('user_id');
                $customer_info['company_id'] = $this->session->userdata('company_id'); 
                if ($id == "") {
                    $this->Common_model->insertInformation($customer_info, "tbl_customers");
                    $this->session->set_flashdata('exception', lang('insertion_success'));
                } else {
                    $this->Common_model->updateInformation($customer_info, $id, "tbl_customers");
                    $this->session->set_flashdata('exception',lang('update_success'));
                }
                redirect('Customer/customers');
            } else {
                if ($id == "") {
                    $data = array();
                    $data['main_content'] = $this->load->view('customer/addCustomer', $data, TRUE);
                    $this->load->view('userHome', $data);
                } else {
                    $data = array();
                    $data['encrypted_id'] = $encrypted_id;
                    $data['customer_information'] = $this->Common_model->getDataById($id, "tbl_customers");
                    $data['main_content'] = $this->load->view('customer/addCustomer', $data, TRUE);
                    $this->load->view('userHome', $data);
                }
            }
        } else {
            if ($id == "") {
                $data = array();
                $data['main_content'] = $this->load->view('customer/addCustomer', $data, TRUE);
                $this->load->view('userHome', $data);
            } else {
                $data = array();
                $data['encrypted_id'] = $encrypted_id;
                $data['customer_information'] = $this->Common_model->getDataById($id, "tbl_customers");
                $data['main_content'] = $this->load->view('customer/editCustomer', $data, TRUE);
                $this->load->view('userHome', $data);
            }
        }
    }

    function valid_url_format($str) {
        $pattern = "@^(http\:\/\/|https\:\/\/)?([a-z0-9][a-z0-9\-]*\.)+[a-z0-9/][a-z0-9\-/]*$@i";
        if (!preg_match($pattern, $str)) {
            $this->form_validation->set_message('valid_url_format', 'URL should be valid.');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    /* ----------------------Customer End-------------------------- */ 
}
