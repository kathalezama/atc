<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Puntos extends CI_Controller {

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

		$datos['servicios'] = $this->puntos_model->listServicios();
		$datos['preferencial'] = $this->puntos_model->listPreferencial();
		$datos['analista'] = $this->puntos_model->listAnalista();
		$data = $this->puntos_model->list();

		if ($data<>"") {
		foreach($data as $sheet) {
			$i++;		
			
			$lista[$i]["id_pto"]=$sheet->id_pto;
			$lista[$i]["analista"]=$sheet->nombre_completo;
			$lista[$i]["nombre"]=$sheet->nombre;
			$lista[$i]["estatus"]=$sheet->estatus;
			$lista[$i]["id_estatus"]=$sheet->id_estatus;
			$lista[$i]["servicios"]=$this->puntos_model->serv_pto($sheet->id_pto);		
			$lista[$i]["preferencial"]=$this->puntos_model->preferencial_pto($sheet->id_pto);
		 }
		}

		$vista['ptos'] = $lista;

		$this->menu();
		$vista['view_agregar']=$this->load->view('puntos_atc/agregar', $datos , true);
		$vista['view_editar']=$this->load->view('puntos_atc/editar', $datos , true);
		$this->load->view('puntos_atc/puntos',$vista);
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

		$motivo = $this->puntos_model->buscar($_POST);

		echo $motivo['nombre'];
	}

	public function editar(){

		$motivo = $this->puntos_model->editar($_POST);
		echo "<script> alert('".$motivo."') </script>";
		redirect('servicios/' , 'refresh');

	}
}
