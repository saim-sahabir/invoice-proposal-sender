<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Payment_system extends Cl_Controller {

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

//////////////////////////////////////////////////////////////////////////////
  

         function api_settings(){

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
                $data['main_content'] = $this->load->view('payment/setup_payment_api',$data, TRUE);
                $this->load->view('userHome', $data);
            }

        } else {
           $data['main_content'] = $this->load->view('payment/setup_payment_api',$data, TRUE);
                $this->load->view('userHome', $data);
        }

                      }


      function ins_api(){
           $id = $this->input->post($this->security->xss_clean('id'));
         $data['api_name'] = $this->input->post($this->security->xss_clean('step'));
           $a_key = $this->input->post($this->security->xss_clean('api_secret_key'));
         if ($a_key == '') {
            $data['api_secret_key'] = $this->input->post($this->security->xss_clean('secret_key'));
         }
         else{

            $data['api_secret_key'] = $a_key;
         }
         $data['publishable_key'] = $this->input->post($this->security->xss_clean('publishable_key'));
         $data['api_clinet_id'] = $this->input->post($this->security->xss_clean('clinet_id'));
         $data['company_id'] = $this->session->userdata($this->security->xss_clean('company_id'));
         $data['user_id'] = $this->session->userdata($this->security->xss_clean('user_id'));
         if ($id=='') {
            $id = $this->Common_model->insertInformation($data,'tbl_payment_api');
            $res = ['id' =>  $id,'message' =>'Data Insart success!']; 
              echo json_encode($res);
         }
         else{
               $c_id = $this->session->userdata('company_id');
              $this->db->where('id', $id);
              $this->db->where('company_id', $c_id);
              $this->db->update('tbl_payment_api', $data);
              $res = ['id' =>  $id,'message' =>'Data Update success!']; 
              echo json_encode($res);
           
         }
             

        }

   function get_api() {
      $company_id = $this->session->userdata('company_id');
        $data1 = $this->db->query("SELECT * FROM tbl_payment_api
              WHERE company_id=$company_id")->result();

              echo json_encode($data1);     

     }


}