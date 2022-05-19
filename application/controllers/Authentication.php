 <?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Authentication extends Cl_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Authentication_model');
        $this->load->model('Common_model');
        $this->load->library('form_validation');
    }

    public function index() {
 
        if ($this->session->userdata('user_id')) { 
            if ($this->session->userdata('role') == 'Admin') {        
				redirect("Dashboard/dashboard");
            } else { 	
                redirect("Authentication/userProfile");
            }
        }
        $this->load->view('authentication/login');
    }

    public function loginCheck() {
        if ($this->input->post('submit') != 'submit') {
            redirect("Authentication/index");
        }

        $this->form_validation->set_rules('email_address', lang('email'), 'required|valid_email');
        $this->form_validation->set_rules('password', lang('password'), "required|max_length[25]");
        if ($this->form_validation->run() == TRUE) {
            $email_address = $this->input->post($this->security->xss_clean('email_address'));
            $password = $this->input->post($this->security->xss_clean('password'));
            $user_information = $this->Authentication_model->getUserInformation($email_address, $password);
            //If user exists
            if ($user_information) {

                //If the user is Active
                if ($user_information->active_status == 'Active') {
                    $company_info = $this->Authentication_model->getCompanyInformation($user_information->company_id);  

                    $login_session = array();
                    //User Information
                    $login_session['user_id'] = $user_information->id;
                    $login_session['language'] = $user_information->language;
                    $login_session['full_name'] = $user_information->full_name;
                    $login_session['phone'] = $user_information->phone;
                    $login_session['email_address'] = $user_information->email_address; 
                    $login_session['role'] = $user_information->role;
                    $login_session['company_id'] = $user_information->company_id;  

                    //Company Information 

                    $login_session['currency_position'] = $company_info->currency_position;
                    $login_session['currency'] = $company_info->currency;
                    $login_session['time_zone'] = $company_info->time_zone;
                    $login_session['date_format'] = $company_info->date_format; 
                    $login_session['name_company_name'] = $company_info->name_company_name;
                    $login_session['address'] = $company_info->address;
                    $login_session['email'] = $company_info->email;
                    $login_session['cphone'] = $company_info->phone;
                    $login_session['logo'] = $company_info->logo;

                    //Set session
                    $this->session->set_userdata($login_session); 

                         
                    if ($this->session->userdata('user_id')) { 
                        if ($this->session->userdata('role') == 'Admin') {        
                            redirect("Authentication/userProfile");
                            //redirect("Dashboard/dashboard");
                        } else {    
                            redirect("Authentication/userProfile");
                        }
                    }  
                } else {
                    $this->session->set_flashdata('exception_1', lang('user_not_active'));
                    redirect('Authentication/index');
                }
            } else {
                $this->session->set_flashdata('exception_1', lang('incorrect_email_password'));
                redirect('Authentication/index');
            }
        } else {
            $this->load->view('authentication/login');
        }
    } 

    public function userProfile() {
        if (!$this->session->has_userdata('user_id')) {
            redirect('Authentication/index');
        } 
        $data = array();
        $data['main_content'] = $this->load->view('authentication/userProfile', $data, TRUE);
        $this->load->view('userHome', $data);
    }

    public function companyProfile() {
        if (!$this->session->has_userdata('user_id')) {
            redirect('Authentication/index');
        }
        $data = array();
        $company_id = $this->session->userdata('company_id');
        $data['company_information'] = $this->Common_model->getDataById($company_id, 'tbl_companies');
        $data['main_content'] = $this->load->view('authentication/updateCompanyProfile', $data, TRUE);
        $this->load->view('outlet/outletHome', $data);
    }

    public function changePassword() {
        if (!$this->session->has_userdata('user_id')) {
            redirect('Authentication/index');
        }
        if ($this->input->post('submit') == 'submit') {
            $this->form_validation->set_rules('old_password',lang('old_password'), 'required|max_length[50]');
            $this->form_validation->set_rules('new_password', lang('new_password'), 'required|max_length[50]|min_length[6]');
            if ($this->form_validation->run() == TRUE) {
                $old_password = $this->input->post($this->security->xss_clean('old_password'));
                $user_id = $this->session->userdata('user_id');

                $password_check = $this->Authentication_model->passwordCheck($old_password, $user_id);

                if ($password_check) {
                    $new_password =$this->input->post($this->security->xss_clean('new_password'));

                    $this->Authentication_model->updatePassword($new_password, $user_id);

                    mail($this->session->userdata['email_address'], "Change Password", "Your new password is : " . $new_password);

                    $this->session->set_flashdata('exception',lang('password_changed'));
                    redirect('Authentication/changePassword');
                } else {
                    $this->session->set_flashdata('exception_1',lang('old_password_not_match'));
                    redirect('Authentication/changePassword');
                }
            } else {
                $data = array();
                $data['main_content'] = $this->load->view('authentication/changePassword', $data, TRUE);
                $this->load->view('userHome', $data);
            }
        } else {
            $data = array();
            $data['main_content'] = $this->load->view('authentication/changePassword', $data, TRUE);
            $this->load->view('userHome', $data);
        }
    }

    public function passwordChange() {

        if (!$this->session->has_userdata('user_id')) {
            redirect('Authentication/index');
        }
        if ($this->input->post('submit') == 'submit') {
            $this->form_validation->set_rules('old_password',lang('old_password'), 'required|max_length[50]');
            $this->form_validation->set_rules('new_password', lang('new_password'), 'required|max_length[50]|min_length[6]');
            if ($this->form_validation->run() == TRUE) {
                $old_password = $this->input->post($this->security->xss_clean('old_password'));
                $user_id = $this->session->userdata('user_id');

                $password_check = $this->Authentication_model->passwordCheck($old_password, $user_id);

                if ($password_check) {
                    $new_password = $this->input->post($this->security->xss_clean('new_password'));

                    $this->Authentication_model->updatePassword($new_password, $user_id);

                    $this->session->set_flashdata('exception', lang('password_changed'));
                    redirect('Authentication/passwordChange');
                } else {
                    $this->session->set_flashdata('exception_1', lang('old_password_not_match'));
                    redirect('Authentication/passwordChange');
                }
            } else {
                $data = array();
                $data['main_content'] = $this->load->view('authentication/passwordChange', $data, TRUE);
                $this->load->view('outlet/outletHome', $data);
            }
        } else {
            $data = array();
            $data['main_content'] = $this->load->view('authentication/passwordChange', $data, TRUE);
            $this->load->view('outlet/outletHome', $data);
        }
    }

    public function forgotPassword() {
        $this->load->view('authentication/forgotPassword');
    }

    public function sendAutoPassword() {
        if ($this->input->post('submit') == 'submit') {
            $this->form_validation->set_rules('email_address', lang('email_address'), 'required|valid_email|callback_checkEmailAddressExistance');
            if ($this->form_validation->run() == TRUE) {
                $email_address = $this->input->post($this->security->xss_clean('email_address'));

                $user_details = $this->Authentication_model->getAccountByMobileNo($email_address);

                $user_id = $user_details->id;

                $auto_generated_password = mt_rand(100000, 999999);

                $this->Authentication_model->updatePassword($auto_generated_password, $user_id);

                //Send Password by Email
                $this->load->library('email');

                $config['protocol'] = 'sendmail';
                $config['mailpath'] = '/usr/sbin/sendmail';
                $config['charset'] = 'iso-8859-1';
                $config['wordwrap'] = TRUE;
                $this->email->initialize($config);

                mail($email_address, "Change Password", "Your new password is : " . $auto_generated_password);

                $this->load->view('authentication/forgotPasswordSuccess');
            } else {
                $this->load->view('authentication/forgotPassword');
            }
        } else {
            $this->load->view('authentication/forgotPassword');
        }
    }

    public function checkEmailAddressExistance() {
        $email_address = $this->input->post($this->security->xss_clean('email_address'));

        $checkEmailAddressExistance = $this->Authentication_model->getAccountByMobileNo($email_address);

        if (count($checkEmailAddressExistance) <= 0) {
            $this->form_validation->set_message('checkEmailAddressExistance', 'Email Address does not exist');
            return false;
        } else {
            return true;
        }
    }

    public function logOut() {
        //User Information 
        $this->session->unset_userdata('user_id');
        $this->session->unset_userdata('full_name');
        $this->session->unset_userdata('phone');
        $this->session->unset_userdata('email_address');
        $this->session->unset_userdata('role');
        $this->session->unset_userdata('customer_id');
        $this->session->unset_userdata('company_id');

        //Shop Information
        $this->session->unset_userdata('outlet_id');
        $this->session->unset_userdata('outlet_name');
        $this->session->unset_userdata('address');
        $this->session->unset_userdata('phone');
        $this->session->unset_userdata('collect_tax');
        $this->session->unset_userdata('tax_registration_no');
        $this->session->unset_userdata('invoice_print');
        $this->session->unset_userdata('print_select');
        $this->session->unset_userdata('kot_print');

        //company Information
        $this->session->unset_userdata('currency');
        $this->session->unset_userdata('time_zone');
        $this->session->unset_userdata('date_format');

        redirect('Authentication/index');
    }

    public function setting($id = '') {
        $company_id = $this->session->userdata('company_id');

        if ($this->input->post('submit')) {

            $this->form_validation->set_rules('date_format', lang('date_format'), "required|max_length[50]");
            $this->form_validation->set_rules('time_zone', lang('country_time_zone'), "required|max_length[50]");
            $this->form_validation->set_rules('currency',lang('currency'), "required|max_length[50]");
            if ($this->form_validation->run() == TRUE) {
                $org_information = array();
                $org_information['date_format'] = $this->input->post($this->security->xss_clean('date_format'));
                $org_information['time_zone'] = $this->input->post($this->security->xss_clean('time_zone'));
                $org_information['currency'] = $this->input->post($this->security->xss_clean('currency'));
                $org_information['company_id'] = $this->session->userdata('company_id');
 
                $this->Common_model->updateInformation($org_information, $id, "tbl_settings");
                $this->session->set_flashdata('exception', lang('update_success'));
                //set session on update
                $this->session->set_userdata('currency', $org_information['currency']);  
                $this->session->set_userdata('time_zone', $org_information['time_zone']);  
                $this->session->set_userdata('date_format', $org_information['date_format']);  
                redirect('Authentication/setting/'.$org_information['company_id']);
            } else { 
                $data = array();
                $data['setting_information'] = $this->Authentication_model->getSettingInformation($company_id);
                $data['time_zones'] = $this->Common_model->getAllForDropdown("tbl_time_zone");
                $data['main_content'] = $this->load->view('authentication/setting', $data, TRUE);
                $this->load->view('userHome', $data); 
            }
        } else { 
            $data = array();
            $data['setting_information'] = $this->Authentication_model->getSettingInformation($company_id);
            $data['time_zones'] = $this->Common_model->getAllForDropdown("tbl_time_zone");
            $data['main_content'] = $this->load->view('authentication/setting', $data, TRUE);
            $this->load->view('userHome', $data); 
        }
    }

    public function SMSSetting($id='') {
        $company_id = $this->session->userdata('company_id');

        if ($this->input->post('submit')) {

            $this->form_validation->set_rules('email_address',lang('email_address'), "required|valid_email|max_length[50]");
            $this->form_validation->set_rules('password',lang('password'), "required|max_length[50]"); 
            if ($this->form_validation->run() == TRUE) {
                $sms_info = array();
                $sms_info['email_address'] = $this->input->post($this->security->xss_clean('email_address'));
                $sms_info['password'] = $this->input->post($this->security->xss_clean('password')); 
                $sms_info['company_id'] = $this->session->userdata('company_id');
 
                $this->Common_model->updateInformation($sms_info, $id, "tbl_sms_settings");
                $this->session->set_flashdata('exception', lang('update_success')); 
                redirect('Authentication/SMSSetting/'.$sms_info['company_id']);
            } else { 
                $data = array();
                $data['sms_information'] = $this->Authentication_model->getSMSInformation($company_id); 
                $data['main_content'] = $this->load->view('authentication/sms_setting', $data, TRUE);
                $this->load->view('userHome', $data); 
            }
        } else { 
            $data = array();
            $data['sms_information'] = $this->Authentication_model->getSMSInformation($company_id); 
            $data['main_content'] = $this->load->view('authentication/sms_setting', $data, TRUE);
            $this->load->view('userHome', $data); 
        }
    }

    public function changeUserProfile($id = '') {
        $id = $this->custom->encrypt_decrypt($id, 'decrypt');
        $company_id = $this->session->userdata('company_id');
        if ($id != '') {
            $user_details = $this->Common_model->getDataById($id, "tbl_users");
        }

        if ($this->input->post('submit')) {

            if ($id != '') {
                $post_email_address = $this->input->post($this->security->xss_clean('email_address'));
                $existing_email_address = $user_details->email_address;
                if ($post_email_address != $existing_email_address) {
                    $this->form_validation->set_rules('email_address', lang('email_address'), "required|valid_email|max_length[50]|is_unique[tbl_users.email_address]");
                } else {
                    $this->form_validation->set_rules('email_address',lang('email_address'), "required|valid_email|max_length[50]");
                }
            } else {
                $this->form_validation->set_rules('email_address', lang('email_address'), "required|valid_email|max_length[50]|is_unique[tbl_users.email_address]");
            }

            if ($this->form_validation->run() == TRUE) {
                $user_info = array();
                $user_info['full_name'] = $this->input->post($this->security->xss_clean('full_name'));
                $user_info['email_address'] = $this->input->post($this->security->xss_clean('email_address'));
                $user_info['phone'] = $this->input->post($this->security->xss_clean('phone'));
                $this->Common_model->updateInformation($user_info, $id, "tbl_users");
                $this->session->set_flashdata('exception', lang('update_success'));
   
                $this->session->set_userdata('full_name', $user_info['full_name']);  
                $this->session->set_userdata('phone', $user_info['phone']);  
                $this->session->set_userdata('email_address', $user_info['email_address']);  

                redirect('Authentication/changeProfile');
            } else {
                if ($id == "") {
                    $data = array();
                    $data['profile_info'] = $this->Authentication_model->getProfileInformation();
                    $data['main_content'] = $this->load->view('authentication/changeProfile', $data, TRUE);
                    $this->load->view('userHome', $data);
                } else {
                    $data = array();
                    $data['profile_info'] = $this->Authentication_model->getProfileInformation();
                    $data['main_content'] = $this->load->view('authentication/changeProfile', $data, TRUE);
                    $this->load->view('userHome', $data);
                }
            }
        } else {
            if ($id == "") {
                $data = array();
                $data['profile_info'] = $this->Authentication_model->getProfileInformation();
                $data['main_content'] = $this->load->view('authentication/changeProfile', $data, TRUE);
                $this->load->view('userHome', $data);
            } else {
                $data = array();
                $data['profile_info'] = $this->Authentication_model->getProfileInformation();
                $data['main_content'] = $this->load->view('authentication/changeProfile', $data, TRUE);
                $this->load->view('userHome', $data);
            }
        }
    }
    public function setlanguage(){
    $id=$this->session->userdata('user_id');
    $language=$this->input->post('language');
    if ($language == "") {
        $language = "english";
    }
    $data['language']=$language;
    $this->session->set_userdata('language', $language);
    $this->db->WHERE('id',$id);
    $this->db->update('tbl_users',$data);
    redirect($_SERVER["HTTP_REFERER"]);
   }
 
 

}
