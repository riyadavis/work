<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class DeliveryDatabase extends CI_Model{

    public function InsertAddress()
    {
        //customer id is set in the session
        $this->session->set_userdata('userid',1);
        $id =$this->session->userdata('userid');

        $insertAddress = array( 'customerAddress'=>$this->input->post('customerAddress'),
                                'deliveryPincode'=>$this->input->post('deliveryPincode'),
                                'landmark'=>$this->input->post('landmark'),
                                'mobileNumber'=>$this->input->post('mobileNumber'),
                               );
        $insert =  json_encode($insertAddress);
        
        
        $deliverTo = $this->input->post('deliverTo');

        if($_POST['mobileNumber']!=null)
        {
            $rows = $this->db->query("select * from deliveryinfo where customer_id = '$id'")->row();
            if($this->db->affected_rows()<0)
            {
                $idInput = array('customer_id'=>$id);
                $this->db->insert('deliveryinfo',$idInput);
            }
           
            if($deliverTo == 'Workplace')
            {
                $insertArray = array('customer_id'=>$id,
                            'WorkAddress'=>$insert);
                $this->db->trans_start();
                    $this->db->where('customer_id',$id);
                        $this->db->update('deliveryinfo',$insertArray);
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
            else if($deliverTo == 'Home')
            {
                $insertArray = array('customer_id'=>$id,
                            'HomeAddress'=>$insert);
                $this->db->trans_start();
                    $this->db->where('customer_id',$id);
                        $this->db->update('deliveryinfo',$insertArray);
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
            else
            {
                $insertArray = array('customer_id'=>$id,
                            'Other'=>$insert);
                $this->db->trans_start();
                    $this->db->where('customer_id',$id);
                        $this->db->update('deliveryinfo',$insertArray);
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
        else
        {
            return "empty";
        }
                                

        // as input attribute 'required' is used in html 'if(not empty)' is not checked
        // if($_POST['mobileNumber']!=null)
        // {
        //     $this->db->trans_start();
        //         $this->db->insert('deliveryaddress',$insertAddress);
        //     $this->db->trans_complete();
        //     if($this->db->trans_status() === TRUE)
        //     {
        //     return "success";
        //     }
        //     else
        //     {
        //         return "error";
        //     }
        // }
        // else
        // {
        //     return "empty";
        // }
        
    }
}