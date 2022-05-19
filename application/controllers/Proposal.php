 <?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Proposal extends Cl_Controller {

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

    /* ----------------------Product/Service Start-------------------------- */

    public function proposals() {
        $company_id = $this->session->userdata('company_id'); 
        $data = array(); 
        $data['lists'] = $this->Proposal_Invoice_model->getAllproposal_inoviceByCompanyId($company_id, "Proposal"); 
        $data['main_content'] = $this->load->view('proposalInvoice/lists', $data, TRUE);
        $this->load->view('userHome', $data); 
    }

    public function deleteproposalInvoice($id) {
        $id = $this->custom->encrypt_decrypt($id, 'decrypt');

        $this->Common_model->deleteStatusChange($id, "tbl_products_services");

        $this->session->set_flashdata('exception', lang('delete_success'));
        redirect('Product_service/productsServices');
    }

    public function addEditProposalInvoice($encrypted_id = "") {

        $id = $this->custom->encrypt_decrypt($encrypted_id, 'decrypt');
        $company_id = $this->session->userdata('company_id');  
        if ($this->input->post('submit')) {  
            $this->form_validation->set_rules('name', lang('name'), 'required|max_length[50]'); 
            $this->form_validation->set_rules('price', "Price", 'required|numeric|max_length[50]'); 
            $this->form_validation->set_rules('description', lang('description'), 'max_length[200]'); 
            if ($this->form_validation->run() == TRUE) { 
                $data = array();
                $data['name'] = str_replace("'","", htmlspecialchars($this->input->post($this->security->xss_clean('name')))) ;  
                $data['price'] = $this->input->post($this->security->xss_clean('price')); 
                $data['user_id'] = $this->session->userdata('user_id');
                $data['company_id'] = $this->session->userdata('company_id'); 
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
                    $data['encrypted_id'] = $encrypted_id;
                    $data['tax_information'] = $this->Common_model->getByCompanyIdForTax($company_id, "tbl_tax_fields"); 
                    $data['customers'] = $this->Common_model->getAllByCompanyIdForDropdown($company_id, "tbl_customers");
                    $data['productsServices'] = $this->Common_model->getAllByCompanyIdForDropdown($company_id, "tbl_products_services"); 
                    $data['attach_information'] = $this->Common_model->getByCompanyIdForTax($company_id, "tbl_attachments"); 
                    $data['main_content'] = $this->load->view('proposalInvoice/addEditProposalInvoice', $data, TRUE);
                    $this->load->view('userHome', $data);
                } else { 
                    $data = array();
                    $data['encrypted_id'] = $encrypted_id; 
                    $data['tax_information'] = $this->Common_model->getByCompanyIdForTax($company_id, "tbl_tax_fields"); 
                    $data['customers'] = $this->Common_model->getAllByCompanyIdForDropdown($company_id, "tbl_customers"); 
                    $data['productsServices'] = $this->Common_model->getAllByCompanyIdForDropdown($company_id, "tbl_products_services");
                    $data['attach_information'] = $this->Common_model->getByCompanyIdForTax($company_id, "tbl_attachments"); 
                    $data['product_service_information'] = $this->Common_model->getDataById($id, "tbl_products_services"); 

                    $data['main_content'] = $this->load->view('proposalInvoice/addEditProposalInvoice', $data, TRUE);
                    $this->load->view('userHome', $data);
                }
            }
        } else {
            if ($id == "") {
                $data = array();
                $data['encrypted_id'] = $encrypted_id; 
                $data['tax_information'] = $this->Common_model->getByCompanyIdForTax($company_id, "tbl_tax_fields"); 
                    $data['customers'] = $this->Common_model->getAllByCompanyIdForDropdown($company_id, "tbl_customers"); 
                    $data['productsServices'] = $this->Common_model->getAllByCompanyIdForDropdown($company_id, "tbl_products_services");
                    $data['attach_information'] = $this->Common_model->getByCompanyIdForTax($company_id, "tbl_attachments"); 

                $data['main_content'] = $this->load->view('proposalInvoice/addEditProposalInvoice', $data, TRUE);
                $this->load->view('userHome', $data);
            } else {
                $data = array();
                $data['encrypted_id'] = $encrypted_id; 
                $data['product_service_information'] = $this->Common_model->getDataById($id, "tbl_products_services");
                $data['tax_information'] = $this->Common_model->getByCompanyIdForTax($company_id, "tbl_tax_fields"); 
                    $data['customers'] = $this->Common_model->getAllByCompanyIdForDropdown($company_id, "tbl_customers"); 
                    $data['productsServices'] = $this->Common_model->getAllByCompanyIdForDropdown($company_id, "tbl_products_services");
                $data['main_content'] = $this->load->view('proposalInvoice/addEditProposalInvoice', $data, TRUE);
                $this->load->view('userHome', $data);
            }
        }
    }


  function saveProposalInvoice($id=FALSE){
        $data = array();
        $data['type'] = $this->input->post('type');
        $data['date'] = $this->input->post('date');
        $data['customer_id'] = $this->input->post('customer_id');
        $data['title'] = $this->input->post('title');
        $data['subtotal'] = $this->input->post('subtotal');
        $data['discount_type'] = $this->input->post('discount_type');
        $data['discount_value'] = $this->input->post('discount_value');
        $data['actual_discount'] = $this->input->post('actual_discount');
        $data['after_discount'] = $this->input->post('after_discount');
        $data['tax'] = $this->input->post('sumoftax');
        $data['shipping_other'] = $this->input->post('shipping_other');
        $data['grand_total'] = $this->input->post('grand_total');
        $data['proposal_no'] = $this->input->post('proposal_no');
        $data['template_bg_color'] = $this->input->post('template_bg_color');
        $data['template_text_color'] = $this->input->post('template_text_color');
        $data['proposal_user_id'] = $this->session->userdata('user_id');
        $data['invoice_no'] = $this->input->post('invoice_no');
        $data['invoice_date'] = $this->input->post('date');
        $data['due_date'] = $this->input->post('date');
        $data['payment_method'] = $this->input->post('payment_method');
        $data['term_condition'] = $this->input->post('term_condition');
        $data['note'] = $this->input->post('note');
        $data['payment_status'] = $this->input->post('payment_select_invoice');
        $data['invoice_user_id'] = $this->session->userdata('user_id');
        $data['company_id'] = $this->session->userdata('company_id');
          if ($id == FALSE) {

          $id = $this->Common_model->insertInformation($data,'tbl_proposal_invoice');
            
          } else {

            $this->db->where('proposal_invoice_id', $id)->delete('tbl_proposal_invoice_products_services');
            $result = $this->Common_model->updateInformation( $data, $id, 'tbl_proposal_invoice');
          }

     if (isset($_POST['product_service_id'])) {
         foreach ($_POST['product_service_id'] as $row => $service):
            $data2 = array();
            $data2['product_service_id'] = $service;
            $data2['quantity_amount'] = $_POST['quantity_amount'][$row];
            $data2['description'] = htmlspecialchars($_POST['description'][$row]);
            $data2['rate'] = $_POST['rate'][$row];
            $data2['total'] = $_POST['total'][$row];
            $data2['tax_rate'] = $_POST['taxpercentage'][0];
            $data2['tax_amount'] = $_POST['taxamount'][0];
            $data2['tax_rate'] = $_POST['taxpercentage'][1];
            $data2['tax_amount'] = $_POST['taxamount'][1];
            $data2['proposal_invoice_id'] = $id;
            $data2['user_id'] = $this->session->userdata('user_id');
            $data2['company_id'] = $this->session->userdata('company_id');
             $this->Common_model->insertInformation($data2,'tbl_proposal_invoice_products_services');
         endforeach;
             }

     if (isset($_POST['files'])) {
        foreach ($_POST['files'] as $row => $files):
            $data3 = array();
              $data3['proposal_id'] = $id;
              $data3['attachment_id'] = $files;
              $data3['user_id'] = $this->session->userdata('user_id');
              $data3['company_id'] = $this->session->userdata('company_id');
              $this->Common_model->insertInformation($data3, ' tbl_proposal_pdf');    
         endforeach;
            }
      if (isset($_POST['fileNameList'])) {  
         foreach ($_POST['fileNameList'] as $row => $image):
            $data4 = array();
              $data4['title'] = $_POST['fileTitleList'][$row];
              $data4['file'] = $image;
              $data4['proposal_id'] = $id;
              $data4['user_id'] = $this->session->userdata('user_id');
              $data4['company_id'] = $this->session->userdata('company_id');
              $this->Common_model->insertInformation($data4, ' tbl_proposal_photo'); 
          endforeach;
             } 
               $ss = $this->input->post('submit');
            $re_data = array('status' =>$ss, 'message' =>'Save success', 'ins_proposal_id'=> $id);
            echo json_encode($re_data);

      }
  

 public function downloadProposal($proposal_id = FALSE) {
        $proposal_id = $this->input->get('last_id');
        $step = $this->input->get('step');
        $pro_type = $this->input->get('r_type');
        $proposal_id = $this->custom->encrypt_decrypt($proposal_id, 'decrypt');
            if ($pro_type == 'Proposal') {
               $filename = $this->Proposal_Invoice_model->proposalPDF($proposal_id);
               // load ci download helder
               $filename = $filename . '.pdf';
               //$this->load->helper('download');
              $data = file_get_contents("proposalPdf/" . $filename); // Read the file's contents
              $name = base_url("proposalPdf/" . $filename);

              //force_download($name, $data);
             if ($data) {
               $res = ['file' =>  $name,'message' =>'Save success'];
                echo json_encode($res);
               }

            }
            else{
                  $filename = $this->Proposal_Invoice_model->InvoicePdf($proposal_id);
               // load ci download helder
               $filename = $filename . '.pdf';
               //$this->load->helper('download');
              $data = file_get_contents("InvoicePdf/" . $filename); // Read the file's contents
              $name = base_url("InvoicePdf/" . $filename);

              //force_download($name, $data);
             if ($data) {
               $res = ['file' =>  $name,'message' =>'Save success'];
                echo json_encode($res);
               }

            }

            if ($step == 'preview') {
                $this->db->where('id', $proposal_id)->update('tbl_proposal_invoice', array('del_status' => 'delete')); 
            }
            
            else{

          $this->db->where('id', $proposal_id)->update('tbl_proposal_invoice', array('state' => $step, 'created_at' => date('Y-m-d H:i:s')));   
      }
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
    public function downloadProposalFromPreview($proposal_id) {
        // load ci download helder
        $filename = $this->Admin_model->proposalPDF($proposal_id);
        $filename = $filename . '.pdf';
        $this->load->helper('download');
        $data = file_get_contents("proposalPdf/" . $filename); // Read the file's contents
        $name = $filename;
        force_download($name, $data);
    }




   
    function addNewCustomerByAjax() {
        $data['name'] = $_GET['name']; 
        $data['phone'] = $_GET['phone'];
        $data['c_person'] = $_GET['c_person'];
        $data['email'] = $_GET['email'];
        $data['billing_address'] = $_GET['billing_address'];
        $data['website'] = $_GET['website'];
        $data['address'] = $_GET['address']; 
        $data['user_id'] = $this->session->userdata('user_id');
        $data['company_id'] = $this->session->userdata('company_id');
        $this->db->insert('tbl_customers', $data);
        $customer_id = $this->db->insert_id();
        $data1 = array('customer_id' => $customer_id);
        echo json_encode($data1);
    }

    function getCustomerList() {
        $company_id = $this->session->userdata('company_id');
        $data1 = $this->db->query("SELECT * FROM tbl_customers 
              WHERE company_id=$company_id")->result();
        echo '<option value="">Select</option>';
        foreach ($data1 as $value) {
            echo '<option value="' . $value->id . '" >' . $value->name . ' (' . $value->phone . ')</option>';
        }
        exit;
    }

    function addNewProductServiceByAjax() {
        $data['name'] = $_GET['name']; 
        $data['price'] = $_GET['price'];
        $data['description'] = $_GET['description']; 
        $data['user_id'] = $this->session->userdata('user_id');
        $data['company_id'] = $this->session->userdata('company_id');
        $this->db->insert('tbl_products_services', $data);
        $customer_id = $this->db->insert_id();
        $company_id = $this->session->userdata('company_id');
        $data1 = $this->db->query("SELECT * FROM tbl_products_services 
              WHERE company_id=$company_id AND id=$customer_id")->row();
         $customer_data = $data1->id.'|'.$data1->name.'|'.$data1->price.'|'.$data1->description;
        $data2 = array('product_service_id' => $customer_data);
        echo json_encode($data2);
    }

    function getProductServiceList() {
        $company_id = $this->session->userdata('company_id');
        $data1 = $this->db->query("SELECT * FROM tbl_products_services 
              WHERE company_id=$company_id")->result();
        echo '<option value="">Select Product/Service</option>';
        foreach ($data1 as $value) {
        echo '<option value="'. $value->id.'|'.$value->name.'|'.$value->price.'|'.$value->description.'">'.$value->name.'</option>';

        }
        exit;
    }
    function uploadProposalPhoto() {
        $proposal_id = 3333;
        $fileType = pathinfo($_FILES['uploadedFile']['name'], PATHINFO_EXTENSION);
        //echo $_FILES['uploadedFile']['name']; exit();
        ///////////////////////////////////////////////////////
        $output_dir = "proposalPhoto/";
        $uploadedFile = $proposal_id . "_PHOTO_" . time() . "." . $fileType;
        if (move_uploaded_file($_FILES['uploadedFile']['tmp_name'], $output_dir . $uploadedFile)) {
            list($width, $height) = getimagesize("proposalPhoto/$uploadedFile");
            if ($width > 550) {
                $config['image_library'] = 'gd2';
                $config['source_image'] = './proposalPhoto/' . $uploadedFile;
                $config['maintain_ratio'] = TRUE;
                $config['width'] = '661';
                $config['height'] = '830';
                $this->load->library('image_lib', $config);
                $this->image_lib->resize();
            }
            echo $uploadedFile;
        }
    }

    function deleteProposalPhoto() {
        $fileName = $this->input->post('_fileName');
        $proposalId = $this->input->post('_proposalId');
        $path1 = "proposalPhoto/".$fileName;
        $path = str_replace(' ','',$path1);

       /* $this->db->where('proposal_id', $proposalId);
        $this->db->where('file', $fileName);
        if ($this->db->delete('attached_photo')) {*/
            if (file_exists($path)) {
                $done = unlink($path);
                if ($done) {
                    echo "1";
                }
            }
         else {
            echo $string;
        }
    }

public function sendProposalViaEmailForm() {

        $proposal_id = $this->input->get('proposal_id');
        $data = array();

        $customer_id = $this->db->where('id', $proposal_id)->SELECT('customer_id')->get('tbl_proposal_invoice')->row('customer_id');
        $company = $this->Common_model->thisGetCompanyInfo();
        $customer = $this->db->get_where('tbl_customers', array('id' => $customer_id))->row();
        $pro_info = $this->db->get_where('tbl_proposal_invoice', array('id' => $proposal_id))->row();
        $data['proposal_info'] = $pro_info;
        ///////////////////////
        ////////////////////////////
          $type = $pro_info->type;
            if ($type == 'Proposal') {
           $customize = $this->Common_model->GetCustomize();
           $tmpPropoEmail = $customize->proposal_email;
            }else{
           $customize = $this->Common_model->GetCustomize();
           $tmpPropoEmail = $customize->invoice_email;
            }

        $date = $data['proposal_info']->date;

        $find = array("[CUSTOMER_CONTACT_PERSON]");
        $replace = array($customer->c_person);
        $tmpPropoEmail = str_replace($find, $replace, $tmpPropoEmail);

        $tmpPropoEmail = str_replace(array("[CUSTOMER_FULL_NAME]"), array($customer->name), $tmpPropoEmail);
        $tmpPropoEmail = str_replace(array("[DATE]"), array($date), $tmpPropoEmail);
        $tmpPropoEmail = str_replace(array("[COMPANY_PHONE]"), array($company->phone), $tmpPropoEmail);
        $tmpPropoEmail = str_replace(array("[COMPANY_EMAIL]"), array($company->email), $tmpPropoEmail);

        $tmpPropoEmail = str_replace(array("[COMPANY_NAME]"), array($company->name_company_name), $tmpPropoEmail);
        $tmpPropoEmail = str_replace(array("[COMPANY_ADDRESS]"), array($company->address), $tmpPropoEmail);
        $tmpPropoEmail = str_replace(array("[COMPANY_PHONE]"), array($company->phone), $tmpPropoEmail);
        $tmpPropoEmail = str_replace(array("[COMPANY_EMAIL]"), array($company->email), $tmpPropoEmail);
        $tmpPropoEmail = str_replace(array("[COMPANY_WEBSITE]"), array($company->website), $tmpPropoEmail);

     $redata = ['send_to'=>$customer->email, 'sub_for'=>$customer->name,'email_body'=> $tmpPropoEmail,'proposal_id'=>$proposal_id];
         echo json_encode($redata);
    }

    //////////////////////////////////////////////////////////////////////////////////


  public function sendProposalViaEmail() {

            $company = $this->Common_model->thisGetCompanyInfo();

            $proposal_id = $this->input->post('proposal_id');

                
            $company_email_setting = json_decode($company->email_setting);
              


           $config = Array(
            'protocol' => 'smtp',
            'smtp_host' => $company_email_setting->host_name,
            'smtp_port' => $company_email_setting->port_address,
            'smtp_user' => $company_email_setting->user_name, // change it to yours
            'smtp_pass' => $company_email_setting->password, // change it to yours
            'mailtype' => 'html',
            'charset' => 'utf-8',
            'wordwrap' => TRUE
                              );
            $this->load->library('email', $config);
            $this->email->set_mailtype("html");
            $this->email->set_newline("\r\n");
            $this->email->from($company->email, $company->name_company_name);
            $this->email->to($this->input->post('email_to'));
            $this->email->subject($this->input->post('subject'));
            $data = array();
            $data['email_address'] = $company->email;
            $data['compnay_info'] = $this->Common_model->thisGetCompanyInfo();
            $data['proposal_id'] = urlencode(encode_url($proposal_id));
            $type = $this->db->get_where('tbl_proposal_invoice', array('id' => $proposal_id))->row()->type;
            if ($type == 'Proposal') {

            $filename = $this->Proposal_Invoice_model->proposalPDF($proposal_id);
            $filename = "$filename.pdf";

            $logof = base_url('files/logo/'.$company->logo);
            $this->email->attach($logof);
            $cid = $this->email->attachment_cid($logof);
            $data['logo'] = '<img src="cid:'.$cid.'" alt="photo1" style="width:80%;  height:78%; margin-left:10px;" />';
            $data['messages'] = $this->input->post('message');
            $this->load->view('templates/proposal_email_template', $data);
            $messages = $this->load->view('templates/proposal_email_template', $data, TRUE);
            $this->email->message($messages);
            $this->email->attach('proposalPdf/' . $filename);

            }else{

            $filename = $this->Proposal_Invoice_model->InvoicePdf($proposal_id);
            $filename = "$filename.pdf";
            
            $logof = base_url('files/logo/'.$company->logo);
            $this->email->attach($logof);
            $cid = $this->email->attachment_cid($logof);
            $data['logo'] = '<img src="cid:'.$cid.'" alt="photo1" style="width:80%;  height:78%; margin-left:10px;" />';
            $data['messages'] = $this->input->post('message');
            $this->load->view('templates/invoice_email_template', $data);
            $messages = $this->load->view('templates/invoice_email_template', $data, TRUE);
            $this->email->message($messages);
            $this->email->attach('InvoicePdf/' . $filename);

            }
            
            $data1 = array();
            $data1 = ['state' => 'EMAILED', 'created_at' => date('Y-m-d H:i:s')];
            $this->db->where('id', $proposal_id)->update('tbl_proposal_invoice', $data1);
            //redirect('proposal/viewAllProposal');
        if($this->email->send())
     {
       $Send_data = ['msg'=> 'Email Sent success!','color'=>'green'];
         echo json_encode($Send_data);
     }
     else
    {
       show_error($this->email->print_debugger());
       $Send_data = ['msg'=> 'Email Sent Failed!','color'=>'red'];
         echo json_encode($Send_data);
    }
       
        
    }



    public function getProposalNo(){
        $type = $this->input->post('type');
        $counts = $this->db->query("SELECT count(*) as counts 
            FROM tbl_proposal_invoice 
          WHERE type='$type' ")->row('counts');
        if($type=='Proposal'){
           $proposal_no='Proposal-'.str_pad($counts + 1, 6, '0', STR_PAD_LEFT);   
        }else{
            $proposal_no='Invoice-'.str_pad($counts + 1, 6, '0', STR_PAD_LEFT);
        }
        $data=array('proposal_no' => $proposal_no);
        echo json_encode($data);
    }
     public function getAttachmentInfo($id) {
        echo $this->db->get_where('tbl_attachments', ['id' => $id])->row()->file;
    }

}
