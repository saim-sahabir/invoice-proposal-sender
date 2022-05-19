<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Attachment extends Cl_Controller {

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

    /* -------------------Attachment Start------------------------ */

    public function attachments() {
        $company_id = $this->session->userdata('company_id');

        $data = array();
        $data['attachments'] = $this->Common_model->getAllByCompanyId($company_id, "tbl_attachments");
        $data['main_content'] = $this->load->view('attachment/attachments', $data, TRUE);
        $this->load->view('userHome', $data);
    }

    public function deleteAttachment($id) {
        $id = $this->custom->encrypt_decrypt($id, 'decrypt');

        $this->Common_model->deleteStatusChange($id, "tbl_attachments");

        $this->session->set_flashdata('exception',lang('delete_success'));
        redirect('Attachment/attachments');
    }

    public function addEditAttachment($encrypted_id = "") {
        $id = $this->custom->encrypt_decrypt($encrypted_id, 'decrypt');
        if ($this->input->post('submit')) {
            $this->form_validation->set_rules('title', 'Title', 'required|max_length[100]');
            $this->form_validation->set_rules('file', 'File', 'callback_validate_file');
            if ($this->form_validation->run() == TRUE) {
                $data = array();
                $data['title'] = htmlspecialchars($this->input->post('title'));
                if ($_FILES['file']['name'] != "") {  
                    $data['file'] = $this->session->userdata('file'); 
                    $this->session->unset_userdata('file'); 
                }
                $data['user_id'] = $this->session->userdata('user_id');
                $data['company_id'] = $this->session->userdata('company_id');
                if ($id == "") {
                    $this->Common_model->insertInformation($data, "tbl_attachments");
                    $this->session->set_flashdata('exception', lang('insertion_success'));
                } else {
                    $this->Common_model->updateInformation($data, $id, "tbl_attachments");
                    $this->session->set_flashdata('exception', lang('update_success'));
                }
                redirect('Attachment/attachments');
            } else {
                if ($id == "") {
                    $data = array();
                    $data['main_content'] = $this->load->view('attachment/addAttachment', $data, TRUE);
                    $this->load->view('userHome', $data);
                } else {
                    $data = array();
                    $data['encrypted_id'] = $encrypted_id;
                    $data['attachment_information'] = $this->Common_model->getDataById($id, "tbl_attachments");
                    $data['main_content'] = $this->load->view('attachment/editAttachment', $data, TRUE);
                    $this->load->view('userHome', $data);
                }
            }
        } else {
            if ($id == "") {
                $data = array();
                $data['main_content'] = $this->load->view('attachment/addAttachment', $data, TRUE);
                $this->load->view('userHome', $data);
            } else {
                $data = array();
                $data['encrypted_id'] = $encrypted_id;
                $data['attachment_information'] = $this->Common_model->getDataById($id, "tbl_attachments");
                $data['main_content'] = $this->load->view('attachment/editAttachment', $data, TRUE);
                $this->load->view('userHome', $data);
            }
        }
    }

    public function validate_file() { 
        /*if ($_FILES['file']['name'] != "") {*/
            $config['upload_path'] = './files/attachments';
            $config['allowed_types'] = 'pdf|PDF';
            $config['max_size'] = '2048'; 
            $config['encrypt_name'] = TRUE;
            $config['detect_mime'] = TRUE;
            $this->load->library('upload', $config);
            if ($this->upload->do_upload("file")) { 
                $upload_info = $this->upload->data();  
                $this->session->set_userdata('file', $upload_info['file_name']); 
            } else {
                $this->form_validation->set_message('validate_file', $this->upload->display_errors());
                return FALSE;
            }
        /*}*/
    }

    public function downloadPDF($file = "") {
        // load ci download helder
        $this->load->helper('download');
        $data = file_get_contents("files/attachments/" . $file); // Read the file's 
        $name = $file;
        force_download($name, $data);
    }

    /* ----------------------Attachment End-------------------------- */

}
