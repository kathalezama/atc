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

	public function save(){

		$save = $this->motivos_model->save($_POST);

		echo "<script> alert('".$save."') </script>";

		redirect('motivos/' , 'refresh');

	}

	public function bloquear(){
		
		$bloc = $this->motivos_model->bloquear($_POST);
		echo $bloc;

	}

	public function buscar_motivo(){

		$motivo = $this->motivos_model->buscar_motivo($_POST);

		echo $motivo['motivo'];
	}

	public function editar(){

		$motivo = $this->motivos_model->editar($_POST);
		echo "<script> alert('".$motivo."') </script>";
		redirect('motivos/' , 'refresh');

	}
}
