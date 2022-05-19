<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Company_your_profile extends Cl_Controller {

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

    /* ----------------------Company/Your Profile Start-------------------------- */  

    public function profile($encrypted_id = "") {
        $id = $this->custom->encrypt_decrypt($encrypted_id, 'decrypt');
        if ($this->input->post('submit')) {
            $this->form_validation->set_rules('name_company_name', 'Name/Company Name', 'required|max_length[50]');
            $this->form_validation->set_rules('contact_person', 'Contact Person', 'required|max_length[50]');
            $this->form_validation->set_rules('phone', 'Phone', 'required|max_length[50]');
            $this->form_validation->set_rules('email', 'Email', "valid_email|max_length[100]");
            if ($this->input->post('website')) {
                $this->form_validation->set_rules('website', 'Website', "callback_valid_url_format|max_length[100]"); 
            }
            $this->form_validation->set_rules('address', 'Address', "required|max_length[250]");
            $this->form_validation->set_rules('currency', 'Currency', "required|max_length[3]");
            $this->form_validation->set_rules('currency_position', 'Currency Position', "required");
            $this->form_validation->set_rules('timezone', 'Timezone', "required|max_length[250]");
            $this->form_validation->set_rules('date_format', 'Date Format', "required|max_length[50]");
            $this->form_validation->set_rules('precision', 'precision', "required|max_length[50]");
            $this->form_validation->set_rules('logo', 'Logo', "callback_validate_logo|max_length[250]");
             
            if ($this->form_validation->run() == TRUE) {
                $data = array();
                $data['name_company_name'] = htmlspecialchars($this->input->post($this->security->xss_clean('name_company_name')));
                $data['contact_person'] = $this->input->post($this->security->xss_clean('contact_person'));
                $data['phone'] = $this->input->post($this->security->xss_clean('phone'));
                $data['email'] = $this->input->post($this->security->xss_clean('email'));
                $data['website'] = $this->input->post($this->security->xss_clean('website'));
                $data['address'] = $this->input->post($this->security->xss_clean('address'));
                $data['currency'] = $this->input->post($this->security->xss_clean('currency'));
                $data['timezone'] = $this->input->post($this->security->xss_clean('timezone'));
                $data['date_format'] = $this->input->post($this->security->xss_clean('date_format'));
                $data['currency_position'] = $this->input->post($this->security->xss_clean('currency_position'));
                $data['precision'] = $this->input->post($this->security->xss_clean('precision'));

               
                if ($_FILES['logo']['name'] != "") {  
                    $data['logo'] = $this->session->userdata('logo'); 
                    $this->session->unset_userdata('logo'); 
                } 
                 
                $this->Common_model->updateInformation($data, $id, "tbl_companies");
                $this->session->set_flashdata('exception',lang('update_success')); 
                redirect('Company_your_profile/profile/'.$this->session->userdata('company_id'));
            } else { 
                $data = array();
                $data['encrypted_id'] = $encrypted_id;
                $data['timezones'] = $this->Common_model->getAllForDropdown("tbl_time_zone");
                $data['company_information'] = $this->Common_model->getDataById($id, "tbl_companies");
                $data['main_content'] = $this->load->view('companyYourProfile/profile', $data, TRUE);
                $this->load->view('userHome', $data); 
            }
        } else { 
            $data = array();
            $data['encrypted_id'] = $encrypted_id;
            $data['timezones'] = $this->Common_model->getAllForDropdown("tbl_time_zone");
            $data['company_information'] = $this->Common_model->getDataById($id, "tbl_companies");
            $data['main_content'] = $this->load->view('companyYourProfile/profile', $data, TRUE);
            $this->load->view('userHome', $data); 
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


    public function validate_logo() { 
        if ($_FILES['logo']['name'] != "") {
            $config['upload_path'] = './files/logo';
            $config['allowed_types'] = 'jpg|jpeg|png';
            $config['max_size'] = '2048'; 
            $config['max_width'] = 150;
            $config['max_height'] = 100;
            $config['encrypt_name'] = TRUE;
            $config['detect_mime'] = TRUE;
            $this->load->library('upload', $config);
            if ($this->upload->do_upload("logo")) { 
                $upload_info = $this->upload->data();  
                $this->session->set_userdata('logo', $upload_info['file_name']); 
            } else {
                $this->form_validation->set_message('validate_logo', $this->upload->display_errors());
                return FALSE;
            }
        }
    }

    /* ----------------------Company/Your Profile End-------------------------- */ 
}
