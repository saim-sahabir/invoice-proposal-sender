<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Tax_setting extends Cl_Controller {

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

    public function taxSetting() { 
        $company_id=$this->session->has_userdata('company_id');
        if ($this->input->post('submit')) { 
            $this->form_validation->set_rules('collect_tax', 'Collect Tax', 'required|max_length[10]');
            if ($this->input->post('collect_tax') == "Yes") { 
                $this->form_validation->set_rules('tax_registration_no', 'Tax Registration No', 'required|max_length[50]');
                $this->form_validation->set_rules('tax_is_gst', 'Tax is GST', 'required|max_length[50]');
                if ($this->input->post('tax_is_gst') == "Yes") {
                    $this->form_validation->set_rules('state_code', 'State Code', 'required|max_length[50]');

                }
                $this->form_validation->set_rules('taxes[]', 'Tax Fields', 'required|max_length[20]');
                $this->form_validation->set_rules('percentages[]', 'Percentages', 'required|numeric|max_length[10]');
            }  
            if ($this->form_validation->run() == TRUE) {

                $data = array(); 
                $data['collect_tax'] = $this->input->post($this->security->xss_clean('collect_tax'));
                if ($this->input->post('collect_tax') == "Yes") { 
                    $data['tax_registration_no'] = $this->input->post($this->security->xss_clean('collect_tax'));
                    $data['tax_is_gst'] = $this->input->post($this->security->xss_clean('tax_is_gst'));
                    if ($this->input->post('tax_is_gst') == "Yes") {
                        $data['state_code'] = $this->input->post($this->security->xss_clean('state_code'));
                    }
                }

                $this->Common_model->updateInformation($data, $company_id, "tbl_tax_settings");
                $this->Common_model->deletingMultipleFormData('company_id', $company_id, 'tbl_tax_fields');
				if(!empty($_POST['taxes'])){
					$this->saveTaxFields();
				} 

                $this->session->set_flashdata('exception', 'Information has been updated successfully!');
                redirect('Tax_setting/taxSetting/'.$this->session->userdata('company_id'));
            } else { 
                $data = array();
                $data['encrypted_id'] = $encrypted_id; 
                $data['tax_information'] = $this->Common_model->getByCompanyId($company_id, "tbl_tax_settings");
                $data['tax_fields'] = $this->Common_model->getByCompanyIdForTax($company_id, "tbl_tax_fields");
                $data['main_content'] = $this->load->view('taxSetting/taxSetting', $data, TRUE);
                $this->load->view('userHome', $data);
            }
        } else { 
            $data = array();
            $data['company_id'] = $company_id;
            $data['tax_information'] = $this->Common_model->getByCompanyId($company_id, "tbl_tax_settings");
            $data['tax_fields'] = $this->Common_model->getByCompanyIdForTax($company_id, "tbl_tax_fields");
            $data['main_content'] = $this->load->view('taxSetting/taxSetting', $data, TRUE);
            $this->load->view('userHome', $data);
        }
        
    }
    public function saveTaxFields(){
        $tax_fields = $_POST['taxes'];
        $percentages = $_POST['percentages'];
        foreach($tax_fields as $key => $value){
            $tax_fields = array();
            $tax_fields['tax'] = $value;  
            $tax_fields['percentage'] = $percentages[$key];  
            $tax_fields['company_id'] = $this->session->userdata('company_id');
            $this->Common_model->insertInformation($tax_fields, "tbl_tax_fields");
        }
    }
}
