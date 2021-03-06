<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Expense extends Cl_Controller {

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

    /* -------------------Expense Start------------------------ */

    public function expenses() {
        $company_id = $this->session->userdata('company_id');

        $data = array();
        $data['expenses'] = $this->Common_model->getAllByCompanyId($company_id, "tbl_expenses");
        $data['main_content'] = $this->load->view('expense/expenses', $data, TRUE);
        $this->load->view('userHome', $data);
    }

    public function deleteExpense($id) {
        $id = $this->custom->encrypt_decrypt($id, 'decrypt');

        $this->Common_model->deleteStatusChange($id, "tbl_expenses");

        $this->session->set_flashdata('exception',lang('delete_success'));
        redirect('Expense/expenses');
    }

    public function addEditExpense($encrypted_id = "") {
        $encrypted_id = $encrypted_id;
        $id = $this->custom->encrypt_decrypt($encrypted_id, 'decrypt');
        $company_id = $this->session->userdata('company_id');
        $company_id = $this->session->userdata('company_id');
        if ($this->input->post('submit')) {
            $this->form_validation->set_rules('date',lang('date'), 'required|max_length[50]');
            $this->form_validation->set_rules('amount',lang('amount'), 'required|max_length[50]');
            $this->form_validation->set_rules('category_id',lang('category'), 'required|max_length[10]');
            $this->form_validation->set_rules('note',lang('note'), 'max_length[200]');
            if ($this->form_validation->run() == TRUE) {
                $expnse_info = array();

                $expnse_info['date'] = date("Y-m-d", strtotime($this->input->post($this->security->xss_clean('date'))));
                $expnse_info['amount'] = $this->input->post($this->security->xss_clean('amount'));
                $expnse_info['category_id'] = $this->input->post($this->security->xss_clean('category_id'));
                $expnse_info['note'] = $this->input->post($this->security->xss_clean('note'));
                $expnse_info['user_id'] = $this->session->userdata('user_id');
                $expnse_info['company_id'] = $this->session->userdata('company_id');

                if ($id == "") {
                    $this->Common_model->insertInformation($expnse_info, "tbl_expenses");
                    $this->session->set_flashdata('exception', lang('insertion_success'));
                } else {
                    $this->Common_model->updateInformation($expnse_info, $id, "tbl_expenses");
                    $this->session->set_flashdata('exception', lang('update_success'));
                }
                redirect('Expense/expenses');
            } else {
                if ($id == "") {
                    $data = array();
                    $data['expense_categories'] = $this->Common_model->getAllByCompanyId($company_id, "tbl_expense_items"); 
                    $data['main_content'] = $this->load->view('expense/addExpense', $data, TRUE);
                    $this->load->view('userHome', $data);
                } else {
                    $data = array();
                    $data['encrypted_id'] = $encrypted_id;
                    $data['expense_categories'] = $this->Common_model->getAllByCompanyId($company_id, "tbl_expense_items"); 
                    $data['expense_information'] = $this->Common_model->getDataById($id, "tbl_expenses");
                    $data['main_content'] = $this->load->view('expense/editExpense', $data, TRUE);
                    $this->load->view('userHome', $data);
                }
            }
        } else {
            if ($id == "") {
                $data = array();
                $data['expense_categories'] = $this->Common_model->getAllByCompanyId($company_id, "tbl_expense_items"); 
                $data['main_content'] = $this->load->view('expense/addExpense', $data, TRUE);
                $this->load->view('userHome', $data);
            } else {
                $data = array();
                $data['encrypted_id'] = $encrypted_id;
                $data['expense_categories'] = $this->Common_model->getAllByCompanyId($company_id, "tbl_expense_items"); 
                $data['expense_information'] = $this->Common_model->getDataById($id, "tbl_expenses");
                $data['main_content'] = $this->load->view('expense/editExpense', $data, TRUE);
                $this->load->view('userHome', $data);
            }
        }
    } 

    /* ----------------------Expense End-------------------------- */
}
