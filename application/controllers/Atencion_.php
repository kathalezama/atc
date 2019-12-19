<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Atencion_ extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
    	$this->load->model('atenciont_model');
    	$this->load->model('puntos_model');
    	$this->load->model('welcome_model');
    	$this->load->helper('date');
	}

	public function index()
	{
		$i=0;

		$vista['preferencial'] = $this->puntos_model->listPreferencial();
		$vista['servicios'] = $this->puntos_model->listServicios();
		$vista['motivos'] = $this->puntos_model->listMotivos();
		$vista['canales'] = $this->puntos_model->listCanales();

		$this->menu();
		$this->load->view('atencion/atencion_',$vista);
		$this->load->view('layout/footer');
	}

	public function monitor(){

		$this->load->view('layout/header_login');
		$this->load->view('recepcion/monitor');

	}

	public function ticket(){
		 
		print_r(json_encode($this->atenciont_model->ticket()));
	}

	public function atendido(){
		 
		$this->atenciont_model->atendido($_POST);
	}

	public function monitor_p(){
		 
		print_r(json_encode($this->atenciont_model->monitor_p($_POST)));
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

		$save = $this->atenciont_model->save($_POST);

		echo "<script> alert('".$save."') </script>";

		redirect('atencion_' , 'refresh');

	}

	public function buscar(){

		$lista = $this->atenciont_model->buscar($_POST['id']);
		echo json_encode($lista);
	}

}
