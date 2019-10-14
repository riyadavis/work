<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class GetDeliveryApi extends CI_Controller{

    public function __construct()
    {
        parent :: __construct();
        header("Access-Control-Allow-Origin: *");
        header('Access-Control-Allow-Credentials: true');    
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
        $this->load->model('DeliveryDatabase');
        if($this->session->has_userdata('userauth') == FALSE)
        {
			$this->AddToCartDatabase->SaltData();
			if($this->session->has_userdata('userauth') == FALSE)
			{
                echo json_encode("error");
                die();
			}
		}
    }

    public function retrieveNumber()
    {      
           $data = $this->DeliveryDatabase->retrieveNumber();
           echo json_encode($data);
    }
}