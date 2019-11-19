<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Preferencial extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
    	$this->load->model('preferencial_model');
    	$this->load->model('welcome_model');
    	$this->load->helper('date');
	}

	public function index()
	{

		$vista['preferencial'] = $this->preferencial_model->list();


		$this->menu();
		$vista['view_editar']=$this->load->view('preferencial/editar', null, true);
		$vista['view_agregar']=$this->load->view('preferencial/agregar', null, true);
		$this->load->view('preferencial/preferencial',$vista);
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

		$save = $this->preferencial_model->save($_POST);

		echo "<script> alert('".$save."') </script>";

		redirect('preferencial/' , 'refresh');

	}

	public function bloquear(){
		
		$bloc = $this->preferencial_model->bloquear($_POST);
		echo $bloc;

	}

	public function buscar(){

		$motivo = $this->preferencial_model->buscar($_POST);

		echo $motivo['tcliente'];
	}

	public function editar(){

		$motivo = $this->preferencial_model->editar($_POST);
		echo "<script> alert('".$motivo."') </script>";
		redirect('preferencial/' , 'refresh');

	}
}
