<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
    	$this->load->model('welcome_model');
    	$this->load->model('usuarios_model');
    	$this->load->helper('date');
	}

	public function index()
	{
		$data['roles'] = $this->usuarios_model->roles();
		$vista['usuarios'] = $this->usuarios_model->listUsuarios();

		$this->menu();
		$vista['view_nuevo_usuario']=$this->load->view('usuarios/nuevo_usuario', $data, true);
		$vista['view_cambiar_clave']=$this->load->view('usuarios/cambiar_clave', null, true);
		$vista['view_editar']=$this->load->view('usuarios/editar_usuario', $data, true);
		$this->load->view('usuarios/usuarios',$vista);
		$this->load->view('layout/footer');

	}

	public function perfiles()
	{
		$menu['roles'] = $this->usuarios_model->roles();
		$menu['perfiles'] = $this->usuarios_model->menu();
		$this->menu();
		$this->load->view('usuarios/perfiles', $menu);
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

	public function save_nuevo_usuario(){
		
		$save = $this->usuarios_model->save_nuevo_usuario($_POST);

		echo "<script> alert('".$save."') </script>";

		redirect('usuarios/' , 'refresh');
	}

	public function save_perfiles(){

		$save = $this->usuarios_model->save_perfiles($_POST);

		echo "<script> alert('".$save."') </script>";

		redirect('usuarios/perfiles' , 'refresh');
	}

	public function bloquear_usuario(){
		
		$bloc = $this->usuarios_model->bloquear_usuario($_POST);
		echo $bloc;

	}

	public function cambiar_clave(){

		$pass = $this->usuarios_model->cambiar_clave($_POST);
		echo "<script> alert('".$pass."') </script>";
		redirect('usuarios/' , 'refresh');

	}

	public function buscar_usuario(){

		$user = $this->usuarios_model->buscar_usuario($_POST);

		echo $user['cedula'].':'.$user['nombre_completo'].':'.$user['correo'].':'.$user['telefono'].':'.$user['id_rol'];

	}

	public function buscar_p(){

		$user = $this->usuarios_model->buscar_p($_POST);

		echo json_encode($user);

	}

	public function edit_usuario(){

		$user = $this->usuarios_model->edit_usuario($_POST);
		echo "<script> alert('".$user."') </script>";
		redirect('usuarios/' , 'refresh');

	}

	public function editar_p(){
		
		$user = $this->usuarios_model->editar_p($_POST);

		echo "<script> alert('".$user."') </script>";
		redirect('usuarios/perfiles' , 'refresh');

	}
}
