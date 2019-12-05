<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Canales extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
    	$this->load->model('canales_model');
    	$this->load->model('welcome_model');
    	$this->load->helper('date');
	}

	public function index()
	{

		$vista['canales'] = $this->canales_model->lista();


		$this->menu();
		$vista['view_editar']=$this->load->view('canales/editar', null, true);
		$vista['view_agregar']=$this->load->view('canales/agregar', null, true);
		$this->load->view('canales/canales',$vista);
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

		$save = $this->canales_model->save($_POST);

		echo "<script> alert('".$save."') </script>";

		redirect('canales/' , 'refresh');

	}

	public function bloquear(){
		
		$bloc = $this->canales_model->bloquear($_POST);
		echo $bloc;

	}

	public function buscar(){

		$motivo = $this->canales_model->buscar($_POST);

		echo $motivo['canal'];
	}

	public function editar(){

		$motivo = $this->canales_model->editar($_POST);
		echo "<script> alert('".$motivo."') </script>";
		redirect('canales/' , 'refresh');

	}
}
