<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Atencion extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
    	//$this->load->model('atencion_model');
    	$this->load->model('welcome_model');
    	$this->load->helper('date');
	}

	public function index()
	{
		//echo "hola";

		//$vista['preferencial'] = $this->puntos_model->listPreferencial();
		//$vista['servicios'] = $this->puntos_model->listServicios();
		//$vista['motivos'] = $this->puntos_model->listMotivos();

		$this->menu();
		//$vista['view_agregar']=$this->load->view('puntos_atc/agregar', $datos , true);
		//$vista['view_editar']=$this->load->view('puntos_atc/editar', $datos , true);
		$this->load->view('atencion/atencion');
		$this->load->view('layout/footer');
	}

	/*public function ticket(){
		 
		print_r(json_encode($this->recepcion_model->ticket()));
	}*/

	public function menu(){
		
		$menu = $this->welcome_model->menu();
		if (isset($this->session->userdata->nombre_completo)) {
			$this->session->sess_destroy();
			redirect('login/' , 'refresh');
		}
		$this->load->view('layout/header',$menu);
	}
/*
	public function save(){

		

		$save = $this->recepcion_model->save($_POST);

		echo "<script> alert('".$save."') </script>";

		redirect('recepcion/' , 'refresh');

	}

	public function bloquear(){
		
		$bloc = $this->puntos_model->bloquear($_POST);
		echo $bloc;

	}

	public function buscar(){

		$lista = $this->recepcion_model->buscar($_POST['id']);
		echo json_encode($lista);
	}

	public function editar(){

		$motivo = $this->puntos_model->editar($_POST);
		echo "<script> alert('".$motivo."') </script>";
		redirect('servicios/' , 'refresh');

	}*/
}
