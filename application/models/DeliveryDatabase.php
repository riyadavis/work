<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class DeliveryDatabase extends CI_Model{

    public function InsertAddress()
    {
        $insertAddress = array('customerName'=>$this->input->post('customerName'),
                                'customerAddress'=>$this->input->post('customerAddress'),
                                'deliveryPincode'=>$this->input->post('deliveryPincode'),
                                'landmark'=>$this->input->post('landmark'),
                                'mobileNumber'=>$this->input->post('mobileNumber'),
                                'deliverTo'=>$this->input->post('deliverTo'));

        // as input attribute 'required' is used in html 'if(not empty)' is not checked
        
        $this->db->trans_start();
            $this->db->insert('deliveryaddress',$insertAddress);
        $this->db->trans_complete();
        if($this->db->trans_status() === TRUE)
        {
           return "success";
        }
        else
        {
            return "error";
        }
    }
}