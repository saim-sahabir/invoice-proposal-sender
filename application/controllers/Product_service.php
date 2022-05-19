<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Product_service extends Cl_Controller {

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

    /* ----------------------Product/Service Start-------------------------- */

    public function productsServices() {
        $company_id = $this->session->userdata('company_id'); 
        $data = array(); 
        $data['productsServices'] = $this->Common_model->getAllByCompanyId($company_id, "tbl_products_services"); 
        $data['main_content'] = $this->load->view('productService/productsServices', $data, TRUE);
        $this->load->view('userHome', $data); 
    }

    public function deleteProductService($id) {
        $id = $this->custom->encrypt_decrypt($id, 'decrypt');

        $this->Common_model->deleteStatusChange($id, "tbl_products_services");

        $this->session->set_flashdata('exception', lang('delete_success'));
        redirect('Product_service/productsServices');
    }

    public function addEditProductService($encrypted_id = "") {

        $id = $this->custom->encrypt_decrypt($encrypted_id, 'decrypt');
        $company_id = $this->session->userdata('company_id');  
        if ($this->input->post('submit')) { 

            $this->form_validation->set_rules('name', lang('name'), 'required|max_length[50]'); 
            $this->form_validation->set_rules('price', "Price", 'required|numeric|max_length[50]'); 
            $this->form_validation->set_rules('description', lang('description'), 'max_length[250]');
            /*if ($_FILES['photo']['name'] != "") {
                $this->form_validation->set_rules('photo', lang('photo'), 'callback_validate_photo');
            }*/
            if ($this->form_validation->run() == TRUE) { 
                $data = array();
                $data['name'] = str_replace("'","", htmlspecialchars($this->input->post($this->security->xss_clean('name')))) ;  
                $data['price'] = $this->input->post($this->security->xss_clean('price'));
                $data['description'] = $this->input->post($this->security->xss_clean('description')); 
                $data['user_id'] = $this->session->userdata('user_id');
                $data['company_id'] = $this->session->userdata('company_id');
                /*if ($_FILES['photo']['name'] != "") {  
                    $data['photo'] = $this->session->userdata('photo'); 
                    $this->session->unset_userdata('photo'); 
                }*/ 
                if ($id == "") {
                    $this->Common_model->insertInformation($data, "tbl_products_services");  
                    $this->session->set_flashdata('exception',lang('insertion_success'));
                } else {
                    $this->Common_model->updateInformation($data, $id, "tbl_products_services"); 
                    $this->session->set_flashdata('exception', lang('update_success'));
                } 
                redirect('Product_service/productsServices');
            } else {
                if ($id == "") {
                    $data = array(); 
                    $data['main_content'] = $this->load->view('productService/addProductService', $data, TRUE);
                    $this->load->view('userHome', $data);
                } else { 
                    $data = array();
                    $data['encrypted_id'] = $encrypted_id;     
                    $data['product_service_information'] = $this->Common_model->getDataById($id, "tbl_products_services"); 
                    $data['main_content'] = $this->load->view('productService/editProductService', $data, TRUE);
                    $this->load->view('userHome', $data);
                }
            }
        } else {
            if ($id == "") {
                $data = array(); 
                $data['main_content'] = $this->load->view('productService/addProductService', $data, TRUE);
                $this->load->view('userHome', $data);
            } else {
                $data = array();
                $data['encrypted_id'] = $encrypted_id; 
                $data['product_service_information'] = $this->Common_model->getDataById($id, "tbl_products_services");
                $data['main_content'] = $this->load->view('productService/editProductService', $data, TRUE);
                $this->load->view('userHome', $data);
            }
        }
    } 

    /*public function validate_photo() { 
        if ($_FILES['photo']['name'] != "") {
            $config['upload_path'] = './assets/POS/images';
            $config['allowed_types'] = 'jpg|jpeg|png';
            $config['max_size'] = '2048';
            $config['maintain_ratio'] = TRUE;
            $config['encrypt_name'] = TRUE;
            $config['detect_mime'] = TRUE;
            $this->load->library('upload', $config);
            if ($this->upload->do_upload("photo")) { 
                $upload_info = $this->upload->data(); 
                $photo = $upload_info['file_name'];  
                $config['image_library'] = 'gd2';
                $config['source_image'] = './assets/POS/images/'.$photo;
                // $config['create_thumb'] = TRUE;
                $config['maintain_ratio'] = TRUE;
                $config['width'] = 200;
                $config['height'] = 100; 
                $this->load->library('image_lib', $config);  
                $this->image_lib->resize();
                $this->session->set_userdata('photo', $upload_info['file_name']); 
            } else {
                $this->form_validation->set_message('validate_photo', $this->upload->display_errors());
                return FALSE;
            }
        }
    }*/ 

    /* ----------------------Product/Service End-------------------------- */ 
}
