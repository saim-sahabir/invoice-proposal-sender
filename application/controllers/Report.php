<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Report extends Cl_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Authentication_model');
        $this->load->model('Common_model');
        $this->load->model('Report_model'); 
        $this->load->library('form_validation');
        $this->Common_model->setDefaultTimezone();
        
        if (!$this->session->has_userdata('user_id')) {
            redirect('Authentication/index');
        }  
    }

    /* ----------------------Daily Summary Report-------------------------- */

   
    public function expenseReport() {
        $data = array();
        $company_id = $this->session->userdata('company_id');
        if ($this->input->post('submit')) {
            $start_date = $this->input->post($this->security->xss_clean('startDate'));
            $end_date = $this->input->post($this->security->xss_clean('endDate'));
            $expense_item_id = $this->input->post($this->security->xss_clean('expense_item_id'));
            $data['expense_item_id'] = $expense_item_id;
            $data['start_date'] = $start_date;
            $data['end_date'] = $end_date;
            $data['expenseReport'] = $this->Report_model->expenseReport($start_date, $end_date, $expense_item_id);
        }
        $data['expense_items'] = $this->Common_model->getAllByCompanyIdForDropdown($company_id, 'tbl_expense_items');
        $data['main_content'] = $this->load->view('report/expenseReport', $data, TRUE);
        $this->load->view('userHome', $data);
    }

    public function proposalReport() {
        $data = array();
        $company_id = $this->session->userdata('company_id');
        if ($this->input->post('submit')) {
            $start_date = $this->input->post($this->security->xss_clean('startDate'));
            $end_date = $this->input->post($this->security->xss_clean('endDate'));
            $status = $this->input->post($this->security->xss_clean('status'));
            $data['status'] = $status;
            $data['start_date'] = $start_date;
            $data['end_date'] = $end_date;
            $data['proposal_report'] = $this->Report_model->proposalReport($start_date, $end_date, $status);
        }
        $data['report_proposal'] = $this->Common_model->getAllByCompanyIdForDropdown($company_id, 'tbl_proposal_invoice');
        $data['main_content'] = $this->load->view('report/proposalReport', $data, TRUE);
        $this->load->view('userHome', $data);
    }

    public function invoiceReport() {
        $data = array();
        $company_id = $this->session->userdata('company_id');
        if ($this->input->post('submit')) {
            $start_date = $this->input->post($this->security->xss_clean('startDate'));
            $end_date = $this->input->post($this->security->xss_clean('endDate'));
            $expense_item_id = $this->input->post($this->security->xss_clean('expense_item_id'));
            $data['expense_item_id'] = $expense_item_id;
            $data['start_date'] = $start_date;
            $data['end_date'] = $end_date;
            $data['expenseReport'] = $this->Report_model->expenseReport($start_date, $end_date, $expense_item_id);
        }
        $data['expense_items'] = $this->Common_model->getAllByCompanyIdForDropdown($company_id, 'tbl_expense_items');
        $data['main_content'] = $this->load->view('report/invoiceReport', $data, TRUE);
        $this->load->view('userHome', $data);
    }

    public function incomeReport() {
        $data = array();
        $company_id = $this->session->userdata('company_id');
        if ($this->input->post('submit')) {
            $start_date = $this->input->post($this->security->xss_clean('startDate'));
            $end_date = $this->input->post($this->security->xss_clean('endDate'));
            $expense_item_id = $this->input->post($this->security->xss_clean('expense_item_id'));
            $data['expense_item_id'] = $expense_item_id;
            $data['start_date'] = $start_date;
            $data['end_date'] = $end_date;
            $data['expenseReport'] = $this->Report_model->expenseReport($start_date, $end_date, $expense_item_id);
        }
        $data['expense_items'] = $this->Common_model->getAllByCompanyIdForDropdown($company_id, 'tbl_expense_items');
        $data['main_content'] = $this->load->view('report/incomeReport', $data, TRUE);
        $this->load->view('userHome', $data);
    }

    

}
