<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('login_model');
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
		$vista['view_editar']=$this->load->view('usuarios/editar_usuario', $data, true);
		$this->load->view('usuarios/usuarios',$vista);
		$this->load->view('layout/footer');

	}
	
}
