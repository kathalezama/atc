<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Atencion extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
    	$this->load->model('atencion_model');
    	$this->load->model('welcome_model');
    	$this->load->helper('date');
	}

	public function index()
	{

		$this->menu();
		$this->load->view('atencion/atencion');
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

		$save = $this->atencion_model->save($_POST);
		echo "<script> alert('".$save."') </script>";
		redirect('atencion/' , 'refresh');

	}

	public function buscar(){

		$lista = $this->atencion_model->buscar();
		if ($lista==0) {

			echo $lista;

		}else{

			echo json_encode($lista);

		}
	}


}
