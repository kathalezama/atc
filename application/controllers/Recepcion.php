<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Recepcion extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
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

		$this->menu();
		//$vista['view_agregar']=$this->load->view('puntos_atc/agregar', $datos , true);
		//$vista['view_editar']=$this->load->view('puntos_atc/editar', $datos , true);
		$this->load->view('recepcion/recepcion',$vista);
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

		

		$save = $this->puntos_model->save($_POST);

		echo "<script> alert('".$save."') </script>";

		redirect('puntos/' , 'refresh');

	}

	public function bloquear(){
		
		$bloc = $this->puntos_model->bloquear($_POST);
		echo $bloc;

	}

	public function buscar(){
		//print_r($_POST);
		$lista = $this->puntos_model->buscar($_POST['id']);
		$return = $lista['nombre_completo'].'|'.$lista['nombre'].'|'.$lista['id_pto'].'|'.$lista['id_estatus'].'|'.$lista['id_user'].'|';
		$lista=$this->puntos_model->serv_pto2($_POST['id']);
		$return=$return.$lista; 
		
		$lista=$this->puntos_model->preferencial_pto2($_POST['id']);
		$return=$return.'|'.$lista; 


		//$this->db->select('nombre_completo, nombre, id_pto, t_estatus.estatus, t_estatus.id_estatus');

		echo $return;
	}

	public function editar(){

		$motivo = $this->puntos_model->editar($_POST);
		echo "<script> alert('".$motivo."') </script>";
		redirect('servicios/' , 'refresh');

	}
}
