<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class DeliveryApi extends CI_Controller{

    public function __construct()
    {
        parent :: __construct();
        header("Access-Control-Allow-Origin: *");
        header('Access-Control-Allow-Credentials: true');    
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
        $this->load->model('DeliveryDatabase');
    }

    public function DeliveryAddress()
    {
        $this->load->view('DeliveryAddress');
    }

    public function index()
    {

    }

    public function InsertAddress()
    {
        $data = $this->DeliveryDatabase->InsertAddress();
        echo $data;
    }

    // public function retrieveNumber()
    // {
    //     // assuming the phone number is stored as session value
    //     // considering 'username' as session variable and 'username' has phone number in it

    //     if($this->session->has_userdata('username'))
    //     {
    //         $mobile = $_SESSION['username'];
    //         echo json_encode($mobile);
    //     }
    //     else
    //     {
    //         $mobile = "error";
    //         echo json_encode($mobile);
    //     }
    // }
}