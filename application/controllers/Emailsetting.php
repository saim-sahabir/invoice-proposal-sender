<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Emailsetting extends Cl_Controller {

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
   
    public function smtpEmailSetting() {
        $company_id=$this->session->userdata('company_id');
        $data['company'] = $this->Common_model->getDataById($company_id, "tbl_companies");
        if ($this->input->post('submit')) {
            $this->form_validation->set_rules('host_name', "Host Name", "required|max_length[300]");
            $this->form_validation->set_rules('port_address', "Port Address", "required|max_length[300]");
            $this->form_validation->set_rules('user_name', "Username", "required|max_length[300]");
            $this->form_validation->set_rules('password', "Password", "required|max_length[300]");
            if ($this->form_validation->run() == TRUE) {
                $data['host_name'] = $this->input->post($this->security->xss_clean('host_name'));
                $data['port_address'] = $this->input->post($this->security->xss_clean('port_address'));
                $data['user_name'] = $this->input->post($this->security->xss_clean('user_name'));
                $data['password'] = $this->input->post($this->security->xss_clean('password'));
                $data_json['smtp_enable_status'] = $this->input->post($this->security->xss_clean('enable_status'));
                $data_json['email_setting'] = json_encode($data);
                $this->Common_model->updateInformation($data_json, $company_id, "tbl_companies");
                $this->session->set_flashdata('exception', lang('update_success'));
                redirect('Emailsetting/smtpEmailSetting');
            }else{
                $data['main_content'] = $this->load->view('authentication/smtpEmailSetting', $data, TRUE);
                $this->load->view('userHome', $data);
            }

        } else {
            $data['main_content'] = $this->load->view('authentication/smtpEmailSetting', $data, TRUE);
            $this->load->view('userHome', $data);
        }
    }
    
    
    
}
