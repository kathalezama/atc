<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('welcome_model');
    	$this->load->model('usuarios_model');
    	$this->load->library('session');
    	$this->load->helper('date');
	}

	public function index()
	{
		$data['roles'] = $this->usuarios_model->roles();
		$vista['usuarios'] = $this->usuarios_model->listUsuarios();

		$this->menu();
		$vista['view_nuevo_usuario']=$this->load->view('usuarios/nuevo_usuario', $data, true);
		$vista['view_cambiar_clave']=$this->load->view('usuarios/cambiar_clave', null, true);
		$vista['view_editar']=$this->load->view('usuarios/editar_usuario', null, true);
		$this->load->view('usuarios/usuarios',$vista);
		$this->load->view('layout/footer');

	}

	public function menu(){
		
		$menu = $this->welcome_model->menu();
		$this->load->view('layout/header',$menu);
	}

	public function save_nuevo_usuario(){
		
		//[cedula] > [nombres] > [apellidos] > [correo] > [telefono] > [rol] > [username] > [clave] > [rclave] 

		$save = $this->usuarios_model->save_nuevo_usuario($_POST);

		echo "<script> alert('".$save."') </script>";

		redirect('usuarios/' , 'refresh');
	}

	public function bloquear_usuario(){
		$bloc = $this->usuarios_model->bloquear_usuario($_POST);
		echo $bloc;
	}
}
