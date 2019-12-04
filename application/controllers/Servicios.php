<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Servicios extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
    	$this->load->model('servicios_model');
    	$this->load->model('welcome_model');
    	$this->load->helper('date');
	}

	public function index()
	{

		$vista['servicios'] = $this->servicios_model->lista();


		$this->menu();
		$vista['view_editar']=$this->load->view('servicios/editar', null, true);
		$vista['view_agregar']=$this->load->view('servicios/agregar', null, true);
		$this->load->view('servicios/servicios',$vista);
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

	public function save(){

		$save = $this->servicios_model->save($_POST);

		echo "<script> alert('".$save."') </script>";

		redirect('servicios/' , 'refresh');

	}

	public function bloquear(){
		
		$bloc = $this->servicios_model->bloquear($_POST);
		echo $bloc;

	}

	public function buscar(){

		$motivo = $this->servicios_model->buscar($_POST);

		echo $motivo['nombre'];
	}

	public function editar(){

		$motivo = $this->servicios_model->editar($_POST);
		echo "<script> alert('".$motivo."') </script>";
		redirect('servicios/' , 'refresh');

	}
}
