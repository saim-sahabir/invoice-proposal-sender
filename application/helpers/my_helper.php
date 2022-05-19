<?php

function dd($value){
    dump($value);
    exit;
}
function dump($value){
    echo "<pre>";
    var_dump($value);
    echo "</pre>";
}
 function getCompanyInfo() {
     
     $CI = & get_instance();
     $CI->db->select("*");
     $CI->db->from("tbl_companies");
     $CI->db->order_by("id", "DESC");
     $CI->db->limit(1);
    return $CI->db->get()->row();
}
function totalUsers($company_id) {
    $CI = & get_instance();
    $total_users = $CI->db->query("SELECT * FROM tbl_users 
        WHERE `company_id`='$company_id'")->num_rows();
    return $total_users;
}
function currencyP($amount) {
    $CI = & get_instance();
    $currency_position = $CI->session->userdata('currency_position');
    $currency = $CI->session->userdata('currency');
    if($currency_position=='Left')
    return "$currency$amount";
    else 
    return "$amount$currency";
}
function userName($user_id) {
    $CI = & get_instance();
    $user_information = $CI->db->query("SELECT * FROM tbl_users 
        WHERE `id`='$user_id'")->row();
    return $user_information->full_name;
}

function getCustomerName($customer_id) {
    $CI = & get_instance();
    $information = $CI->db->query("SELECT * FROM tbl_customers 
        WHERE `id`='$customer_id'")->row();
    return $information->name;
}

function findService($id=''){
    $CI = & get_instance();
    $row=$CI->db->query("SELECT * FROM  tbl_products_services WHERE id='$id'")->row(); 
    return $row->name;
}

function getOrderType($order_type_id) {
    if ($order_type_id == 1) {
       return "Dine In";
    }elseif ($order_type_id == 2) {
        return "Take Away";
    }elseif ($order_type_id == 3) {
        return "Delivery";
    }
}

function getTableName($table_id) {
    $CI = & get_instance();
    $information = $CI->db->query("SELECT * FROM tbl_tables WHERE `id`='$table_id'")->row();
    return $information->name;
}

function getConsumptionID($id) {
    $CI = & get_instance();
    $selectRow = $CI->db->query("SELECT * FROM tbl_sale_consumptions WHERE `sale_id`='$id'")->row();
    if (!empty($selectRow)) {
        return $selectRow->id;
    } else {
        return '0';
    }
}

function vatName($id){
    $CI = & get_instance();
    $expense_item_information = $CI->db->query("SELECT * FROM tbl_vats WHERE `id`='$id'")->row();

    return $expense_item_information->name;
}

function expenseItemName($id) {
    $CI = & get_instance();
    $expense_item_information = $CI->db->query("SELECT * FROM tbl_expense_items WHERE `id`='$id'")->row();

    return $expense_item_information->name;
}

function employeeName($id) {
    $CI = & get_instance();
    $employee_information = $CI->db->query("SELECT * FROM tbl_users WHERE `id`='$id'")->row();

    if (!empty($employee_information)) {
       return $employee_information->full_name;
    }else{
        return "N/A";
    } 
}

function categoryName($category_id) {
    $CI = & get_instance();
    $category_information = $CI->db->query("SELECT * FROM tbl_ingredient_categories WHERE `id`='$category_id'")->row();

    return $category_information->category_name;
}

function foodMenucategoryName($category_id) {
    $CI = & get_instance();
    $category_information = $CI->db->query("SELECT * FROM tbl_food_menu_categories WHERE `id`='$category_id'")->row();

    return $category_information->category_name;
}

function foodMenuName($id) {
    $CI = & get_instance();
    $food_information = $CI->db->query("SELECT * FROM tbl_food_menus WHERE `id`='$id'")->row();
    return $food_information->name;
}

function foodMenuNameCode($id) {
    $CI = & get_instance();
    $food_information = $CI->db->query("SELECT * FROM tbl_food_menus WHERE `id`='$id'")->row();
    return "(" . $food_information->code . ")";
}

function unitName($unit_id) {
    $CI = & get_instance();
    $unit_information = $CI->db->query("SELECT * FROM tbl_units WHERE `id`='$unit_id'")->row();

    if (!empty($unit_information)) {
        return $unit_information->unit_name;
    } else {
        return '';
    }
}

function totalIngredients($food_menu_id) {
    $CI = & get_instance();
    $total_count = $CI->db->query("SELECT * FROM tbl_food_menus_ingredients WHERE `food_menu_id`='$food_menu_id'")->num_rows();
    return $total_count;
}

function foodMenuIngredients($food_menu_id) {
    $CI = & get_instance();
    $food_menu_ingredients = $CI->db->query("SELECT * FROM tbl_food_menus_ingredients WHERE `food_menu_id`='$food_menu_id'")->result();
    return $food_menu_ingredients;
}

function modifierIngredients($modifier_id) {
    $CI = & get_instance();
    $food_menu_ingredients = $CI->db->query("SELECT * FROM tbl_modifier_ingredients WHERE `modifier_id`='$modifier_id'")->result();
    return $food_menu_ingredients;
}

function getPaymentName($id) {
    $CI = & get_instance();
    $getPaymentName = $CI->db->query("SELECT * FROM tbl_payment_methods WHERE `id`='$id'")->row();
    return $getPaymentName->name;
}

function getAlertCount() {
    $CI = & get_instance();
    $company_id = $CI->session->userdata('company_id');
    $outlet_id = $CI->session->userdata('outlet_id');
    $result = $CI->db->query("SELECT i.*,(select SUM(quantity_amount) from tbl_purchase_ingredients WHERE ingredient_id=i.id AND outlet_id='$outlet_id' AND del_status='Live') total_purchase, 
(select SUM(consumption) from tbl_sale_consumptions_of_menus WHERE ingredient_id=i.id AND outlet_id='$outlet_id' AND del_status='Live') total_consumption,
(select SUM(waste_amount) from tbl_waste_ingredients WHERE ingredient_id=i.id AND outlet_id='$outlet_id' AND del_status='Live') total_waste,
(select category_name from tbl_ingredient_categories WHERE id=i.category_id AND del_status='Live') category_name,
(select unit_name from tbl_units WHERE id=i.unit_id AND del_status='Live') unit_name
FROM tbl_ingredients i WHERE del_status='Live' AND i.company_id= '$company_id'  ORDER BY i.name ASC")->result();
    $alertCount = 0;
    foreach ($result as $value) {
        $totalStock = $value->total_purchase - $value->total_consumption - $value->total_waste;
        if ($totalStock <= $value->alert_quantity) {
            $alertCount++;
        }
    }
    return $alertCount;
}
function collectGST(){
    $CI = & get_instance();
    $company_id = $CI->session->userdata('company_id');
    $outlet_id = $CI->session->userdata('outlet_id');
    if($outlet_id){
        $outlet_info = $CI->db->query("SELECT * FROM tbl_outlets WHERE `id`='$outlet_id'")->row();
        return $outlet_info->tax_is_gst;    
    }else{
        return "No";
    }
    

}

function getIngredientNameById($id) {
    $CI = & get_instance();
    $ig_information = $CI->db->query("SELECT * FROM tbl_ingredients WHERE `id`='$id'")->row();
    if (!empty($ig_information)) {
        return $ig_information->name;
    } else {
        return '';
    }
}

function getModifierNameById($id) {
    $CI = & get_instance();
    $m_information = $CI->db->query("SELECT * FROM tbl_modifier WHERE `id`='$id'")->row();
    if (!empty($m_information)) {
        return $m_information->name;
    } else {
        return '';
    }
}

function getIngredientCodeById($id) {
    $CI = & get_instance();
    $ig_information = $CI->db->query("SELECT * FROM tbl_ingredients WHERE `id`='$id'")->row();

    return $ig_information->code;
}

function getSupplierNameById($id) {
    $CI = & get_instance();
    $supplier_information = $CI->db->query("SELECT * FROM tbl_suppliers WHERE `id`='$id'")->row();

    return $supplier_information->name;
}

function getUnitIdByIgId($id) {
    $CI = & get_instance();
    $ig_information = $CI->db->query("SELECT * FROM tbl_ingredients WHERE `id`='$id'")->row();
    if (!empty($ig_information)) {
        return $ig_information->unit_id;
    } else {
        return '';
    }
}

function getLastPurchaseAmount($id) {
    $CI = & get_instance();
    $purchase_ingredients = $CI->db->query("SELECT * FROM tbl_purchase_ingredients WHERE `ingredient_id`='$id' ORDER BY id DESC")->row();
    if (!empty($purchase_ingredients)) {
        $returnPrice = $purchase_ingredients->unit_price;
    } else {
        $returnPrice = 0.0;
    }
    return $returnPrice;
}

function getPurchaseIngredients($id) {
    $CI = & get_instance();
    $purchase_ingredients = $CI->db->query("SELECT * FROM tbl_purchase_ingredients WHERE `purchase_id`='$id'")->result();

    if (!empty($purchase_ingredients)) { 

        $pur_ingr_all = "";
        //$pur_ingr_all = "<div style='width: 100%; float: left;'>";
        $key = 1;

        $pur_ingr_all .= "<b>SN-Ingredient-Qty/Amount-Unit Price-Total</b><br>";
        foreach ($purchase_ingredients as $value) { 
            $pur_ingr_all .= $key ."-". getIngredientNameById($value->ingredient_id)."-".$value->quantity_amount ."-". $value->unit_price ."-". $value->total."<br>";
            $key++;
            /*$pur_ingr_all .= $value->ingredient_id;
            $pur_ingr_all .= $value->quantity_amount;
            $pur_ingr_all .= $value->unit_price;
            $pur_ingr_all .= $value->total;*/
            /*$pur_ingr_all .= "<div style='width: 100%; float: left;'>";
            $pur_ingr_all .= "<div style='float: left; width: 5%;'>". $key. "</div>";
            $pur_ingr_all .= "<div style='float: left; width: 25%;'>". getIngredientNameById($value->ingredient_id)."</div>";
            $pur_ingr_all .= "<div style='float: left; width: 10%;'>". $value->quantity_amount."</div>";
            $pur_ingr_all .= "<div style='float: left; width: 10%;'>". $value->unit_price."</div>";
            $pur_ingr_all .= "<div style='float: left; width: 15%;'>". $value->total."</div>";
            $pur_ingr_all .= "</div'>";*/
        }
        //$pur_ingr_all = "</div>"; 

        return $pur_ingr_all;

    }else{
        return "Not found!";
    }
}

function getLastPurchasePrice($ingredient_id) {
    $CI = & get_instance();
    $purchase_info = $CI->db->query("SELECT *
    FROM tbl_purchase_ingredients
    WHERE ingredient_id = $ingredient_id
    ORDER BY id DESC
    LIMIT 1")->row();

    if (!empty($purchase_info)) {
        return $purchase_info->unit_price;
    } else {
        $ig_information = $CI->db->query("SELECT * FROM tbl_ingredients WHERE `id`='$ingredient_id'")->row();

        return $ig_information->purchase_price;
    }
}

function ingredientCount($id) {
    $CI = & get_instance();
    $ingredient_count = $CI->db->query("SELECT COUNT(*) AS ingredient_count
    FROM tbl_waste_ingredients
    WHERE waste_id = $id")->row();

    return $ingredient_count->ingredient_count;
}

function ingredientCountConsumption($id) {
    $CI = & get_instance();
    $ingredient_count = $CI->db->query("SELECT COUNT(*) AS ingredient_count
    FROM tbl_inventory_adjustment_ingredients
    WHERE inventory_adjustment_id = $id")->row();

    return $ingredient_count->ingredient_count;
}

function findCustomer($id='',$fieldName=''){
    $CI = & get_instance();
    $row=$CI->db->query("SELECT * FROM tbl_customers WHERE id='$id' ")->row(); 
    return $row->$fieldName;
}

function companyInformation($company_id) {
    $CI = & get_instance();
    $company_info = $CI->db->query("SELECT * FROM tbl_companies WHERE `id`='$company_id'")->row();

    return $company_info;
}

//////////////GET DIFFERENT DATE FORMAT///////////////
function findDate($date) {
    //$query1=mysql_query("SELECT date_format FROM company_info WHERE id='1'");
    //$row=mysql_fetch_array($query1);
    $format = null;
    if ($date == '') {
        return '';
    } else {
        $format = 'd/m/Y';
    }
    return date($format, strtotime($date));
}

/////////////////// alterDateFormat////////////////
function alterDateFormat($date) {
    $query1 = mysql_query("SELECT date_format FROM company_info WHERE id='1'");
    $row = mysql_fetch_array($query1);
    $format = null;
    if ($date != "") {
        $dateSlug = explode('/', $date);
        //return $dateSlug[2].'-'.$dateSlug[1].'-'.$dateSlug[0];
        switch ($row['date_format']) {
            case 'dd/mm/yyyy':
                $format = $dateSlug[2] . '-' . $dateSlug[1] . '-' . $dateSlug[0];
                break;
            case 'mm/dd/yyyy':
                $format = $dateSlug[2] . '-' . $dateSlug[0] . '-' . $dateSlug[1];
                break;
            case 'yyyy/mm/dd':
                $format = $dateSlug[0] . '-' . $dateSlug[1] . '-' . $dateSlug[2];
                break;
            default:
                $format = $dateSlug[2] . '-' . $dateSlug[1] . '-' . $dateSlug[0];
                break;
        }
        return $format;
    } else {
        return "0000-00-00 00:00:00";
    }
}

function getCustomerDueReceive($customer_id){
    $CI = & get_instance();
    $information = $CI->db->query("SELECT sum(amount) as amount FROM tbl_customer_due_receives WHERE `customer_id`='$customer_id' and del_status='Live'")->row(); 
    return $information->amount;
}

function getSupplierDuePayment($supplier_id){
    $CI = & get_instance();
    $information = $CI->db->query("SELECT sum(amount) as amount FROM tbl_supplier_payments WHERE `supplier_id`='$supplier_id' and del_status='Live'")->row(); 
    return $information->amount;
}






////////////////////////////
function findTax($id=''){
    $CI = & get_instance();
    $sql=$CI->db->query("SELECT tax_rate FROM tax 
        WHERE id='$id'")->row();
     
    return $sql->tax_rate;
}
///////////////////findAttahment///////////////
function findAttahment($id=''){
    $CI = & get_instance();
    $row=$CI->db->query("SELECT * FROM tbl_attachments WHERE id='$id' ")->row(); 
    return $row->file;
}

/////////////// GET Addendum Name//////////////////////
function findattachmentName($id=''){
    $CI = & get_instance();
    $row=$CI->db->query("SELECT * FROM tbl_attachments WHERE id='$id'")->row();  
    return $row->title;
}


////////////////////FIND PROPOSAL INFO DATA//////// Check Again
function findProposalInfo($id,$fieldName){ 
    $CI = & get_instance();
    $sql=$CI->db->query("SELECT * FROM tbl_proposal_invoice
        WHERE id='$id'")->row(); 
    return $sql->$fieldName;
}
////////////////////FIND INVOICE INFO DATA//////// Check Again
function findInvoiceInfo($id,$fieldName){
    $CI = & get_instance();
    $sql=$CI->db->query("SELECT * FROM  tbl_proposal_invoice WHERE id='$id'")->row(); 
    return $sql->$fieldName;
}
////////////////////FIND INVOICE INFO DATA VIA PROPOSAL ID////////
function findInvoiceViaProposal($id,$fieldName){
    $CI = & get_instance();
    $sql=$CI->db->query("SELECT * FROM  tbl_proposal_invoice WHERE proposal_id='$id' AND del_status=1")->row(); 
    return $sql->$fieldName;
}

//////////////////////CHECK INVOICE STATUS///////////
function checkInvoice($proposal_id){
    $CI = & get_instance();
    $num_rows=$CI->db->query("SELECT * FROM  tbl_proposal_invoice 
        WHERE proposal_id=$proposal_id and del_status=1")->num_rows(); 
    if($num_rows>0){
        return true;
    }else{
        return false;
    }
}
//////////////////////CHECK Billing STATUS///////////
function checkInvoiceInBill($invoice_id){
    $CI = & get_instance();
    $num_rows=$CI->db->query("SELECT * FROM bill 
        WHERE invoice_id='$invoice_id' AND status=1")->num_rows(); 
    if($num_rows>0){
        return true;
    }else{
        return false;
    }
}
 
/////////////////// banglaDateFormat////////////////
function banglaDateFormat($date){
    if($date!=""){
        $dateSlug=explode('-',$date);
        return $dateSlug[2].'/'.$dateSlug[1].'/'.$dateSlug[0];
    }else{
        return "00/00/0000";
    }
}
//////////////////////// BILL SUM ON PROPOSAL ID////////////////
function sumBill($id){
    $CI = & get_instance();
    $sql=$CI->db->query("SELECT SUM(`amount`) as total FROM bill 
        WHERE proposal_id='$id' AND status=1")->row();
    $row=$sql;
    return $row['total'];
}

//////////////////////// BILL SUM ON INVOICE ID////////////////
function sumBillByInvoice($id){
    $CI = & get_instance();
    $row=$CI->db->query("SELECT SUM(`amount`) as total 
        FROM bill WHERE invoice_id='$id'  AND status=1")->row(); 
    return $row->total;
}
///////////////////////// CHECK INVOICE//////////////////
function checkInvoiceFromGrid($id){
    $CI = & get_instance();
    $result=$CI->db->query("SELECT COUNT(id) as num FROM bill 
        WHERE status=1 AND invoice_id='$id' ")->row();  
    if($result->num>0){
        return "EXISTS";
    }else{
       return "NOT EXISTS";
    }
}
//////////////////total propsal sent to customer/////////////
function sentEmailtoCustomer($id){
    $CI = & get_instance();
     $row=$CI->db->query("SELECT COUNT(`id`) as total 
        FROM proposal_info WHERE  customer_id='$id' AND proposal_type=1 AND del_status=1")->row();   
     return $row->total;
}
////////////////////////TOTAL COUNT PROPOSAL SENT BY USER///////////////
function totalProposalSentByUser($id){
    $CI = & get_instance();
    $sql=$CI->db->query("SELECT *  FROM proposal_info WHERE 
        prepared_by='$id'");
    $result=mysql_num_rows($sql);
    return $result;
}

function decode_url($string, $key="")
{
    /*if($key==null || $key=="")
    {
        $key="tyz_mydefaulturlencryption";
    }*/
    
    $CI =& get_instance();
    $key = "APANaga262gagtByIGI1BpVXZTJagaga6526gcsAG8GZl8pagagadwwa84";

    $string = strtr(
        $string,
        array(
            '.' => '+',
            '-' => '=',
            '~' => '/'
        )
    );

    return $CI->encrypt->decode($string, $key);

}

function encode_url($string, $key="", $url_safe=TRUE)
{
    /*if($key==null || $key=="")
    {
        $key="tyz_mydefaulturlencryption";
    }*/

    $CI =& get_instance();
    $key = "APANaga262gagtByIGI1BpVXZTJagaga6526gcsAG8GZl8pagagadwwa84";

    $ret = $CI->encrypt->encode($string, $key);

    if ($url_safe)
    {
        $ret = strtr(
            $ret,
            array(
                '+' => '.',
                '=' => '-',
                '/' => '~'
            )
        );
    }

    return $ret;
}

