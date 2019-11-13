<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Usuarios_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
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
			'id_rol'=>$datos['rol'],
			'nombre_completo'=>$datos['apellidos'].' '.$datos['nombres'],	
			'correo'=>$datos['correo'],	
			'telefono'=>$datos['telefono'],	
			'username'=>$datos['username'],
			'clave'=>$datos['clave'],
			'id_usuario'=>'0',
			'fecha_registro'=>date('Y-m-d'),
			'estatus'=>'0',
			);


			$this->db->insert('public.t_usuarios',$data);
			$retorno="Usuario Creado";

			return $retorno;
	}
}