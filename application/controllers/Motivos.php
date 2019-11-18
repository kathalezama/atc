<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Motivos extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
    	$this->load->model('motivos_model');
    	$this->load->model('welcome_model');
    	$this->load->helper('date');
	}

	public function index()
	{

		$vista['motivos'] = $this->motivos_model->listMotivos();


		$this->menu();
		$vista['view_editar']=$this->load->view('motivos/editar', null, true);
		$vista['view_agregar']=$this->load->view('motivos/agregar', null, true);
		$this->load->view('motivos/motivos',$vista);
		$this->load->view('layout/footer');
	}

	public function menu(){
		
		$menu = $this->welcome_model->menu();
		if (isset($this->session->userdata->nombre_completo)) {
			$this->session->sess_destroy();
			redirect('login/' , 'refresh');
		}
		$this->load->view('layout/header',$menu);
	}
}
