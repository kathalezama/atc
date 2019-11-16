<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login_model extends CI_Model{
    function __construct(){
        parent::__construct();
    }    

	function login($datos)
	{
		$this->db->where('t_usuarios.username',$datos['user']);
		$this->db->where('t_usuarios.clave',$datos['clave']);
		$this->db->where('t_usuarios.estatus','0');
		$user = $this->db->get('public.t_usuarios');


		if($user->num_rows()>0)
		{
			return $user->result_array();

		}else{

			$error = 0;
            return $error;

		}

	}
}