<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Usuarios_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->model('welcome_model');
    }    

	function menu()
	{
		$this->db->order_by('t_menu.orden','asc');
		$menu = $this->db->get('public.t_menu');
		
		if($menu->num_rows()>0)
		{
			return $menu->result_array();
		}

	}

	function roles()
	{
		$this->db->where('estatus_rol','0');
		$roles = $this->db->get('public.t_roles');
		
		if($roles->num_rows()>0)
		{
			return $roles->result_array();
		}
	}

	function save_nuevo_usuario($datos)
	{


		$data = array(
			'cedula'=>$datos['cedula'],
			'id_rol'=>$datos['rol'],
			'nombre_completo'=>$datos['apellidos'].' '.$datos['nombres'],	
			'correo'=>$datos['correo'],	
			'telefono'=>$datos['telefono'],	
			'username'=>$datos['username'],
			'clave'=>MD5($datos['clave']),
			'id_usuario'=>$this->session->userdata['id_user'],
			'fecha_registro'=>date('Y-m-d'),
			'estatus'=>'0',
			);


			$this->db->insert('public.t_usuarios',$data);

			$this->welcome_model->log($this->session->userdata['id_user'] ,'Creación de Usuario',$this->db->last_query());
			$retorno="Usuario Creado";

			return $retorno;
	}

	function listUsuarios()
	{
		$this->db->join('t_estatus','t_estatus.id_estatus = t_usuarios.estatus','left');
		$this->db->join('t_roles','t_roles.id_rol = t_usuarios.id_rol','left');
		//$this->db->where('estatus','0');
		$listUsuarios = $this->db->get('public.t_usuarios');
		
		if($listUsuarios->num_rows()>0)
		{
			return $listUsuarios->result_array();
		}
	}

	function bloquear_usuario($datos)
	{

		$data = [
			$_POST['name'] => $_POST['valor']
		];

		$this->db->where('id_user', $_POST['id']);
		$this->db->update('public.'.$_POST['tb'], $data);

		if ($_POST['valor']==0) { $return = 'Activo'; $log = 'Activar Usuario'; }
		elseif ($_POST['valor']==2) { $return = 'Bloqueado'; $log = 'Bloquear Usuario'; }

		$this->welcome_model->log($this->session->userdata['id_user'],$log,$this->db->last_query());


		return $return;
	}

	function cambiar_clave($datos)
	{

		$data = [
			'clave' => MD5($_POST['c_clave'])
		];

		$this->db->where('id_user', $_POST['c_id_user']);
		$this->db->update('public.t_usuarios', $data);

		$this->welcome_model->log($this->session->userdata['id_user'],'Cambio de clave',$this->db->last_query());


		return 'Clave Actualizado';
	}

	function buscar_usuario($datos)
	{
		$this->db->where('id_user', $_POST['id']);
		$user = $this->db->get('public.t_usuarios');


		if($user->num_rows()>0)
		{
			return $user->row_array();
		}

	}

	function edit_usuario($datos)
	{
		 $data = array(
			'id_rol'=>$datos['e_rol'],
			'nombre_completo'=>$datos['e_nombres'],	
			'correo'=>$datos['e_correo'],	
			'telefono'=>$datos['e_telefono'],	
			'id_usuario'=>$this->session->userdata['id_user'],
			'ult_mod'=>date('Y-m-d'),
		);

		$this->db->where('id_user', $datos['e_id_user']);
		$this->db->update('public.t_usuarios', $data);

		$this->welcome_model->log($this->session->userdata['id_user'],'Usuario Modificado',$this->db->last_query());


		return 'Usuario Modificado';
	}
}