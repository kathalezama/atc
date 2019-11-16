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
		$this->load->view('layout/header_login');
		$this->load->view('login/login');
		//$this->load->view('layout/footer');

	}
	
}
