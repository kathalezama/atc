<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('welcome_model');
    	$this->load->model('usuarios_model');
    	$this->load->library('session');
    	$this->load->helper('date');
	}

	public function index()
	{
		$this->menu();
		$this->load->view('usuarios/usuarios');
		$this->load->view('layout/footer');
	}

	public function menu(){
		
		$menu = $this->welcome_model->menu();
		$this->load->view('layout/header',$menu);
	}
}
