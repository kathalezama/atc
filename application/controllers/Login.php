<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('login_model');
    	$this->load->library('session');
    	$this->load->helper('date');
	}

	public function index()
	{
        $this->session->sess_destroy();
		$this->load->view('layout/header_login');
		$this->load->view('login/login');
	}

	public function login()
    {

		$valuser = $this->login_model->login($_POST);

		if ($valuser==0) {
			
        	echo "<script> alert('Usuario o clave invalida') </script>";

			redirect('login/' , 'refresh');

		}else{

       		$this->session->set_userdata($valuser);
       		
			redirect('welcome/' , 'refresh');

		}
   
    }

    public function logout()
    {
        $this->session->sess_destroy();
    }
	
}
