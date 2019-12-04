<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Preferencial_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->model('welcome_model');
    }    

	function menu()
	{
		$this->db->join('menu_rol','menu_rol.id_menu = t_menu.id_menu','left');
		$this->db->where('menu_rol.id_rol',$this->session->userdata['id_rol']);
		$this->db->order_by('t_menu.orden','asc');
		$menu = $this->db->get('public.t_menu');
		
		if($menu->num_rows()>0)
		{
			return $menu->result_array();
		}

	}

	function lista()
	{
		$this->db->join('t_estatus','t_estatus.id_estatus = t_tclientes.estatus','left');
		//$this->db->where('estatus','0');
		$listMotivos = $this->db->get('public.t_tclientes');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->result_array();
		}
	}

	function save($datos)
	{
		$data = array(
			'tcliente'=>$datos['preferencial'],
			'id_usuario'=>$this->session->userdata['id_user'],
			'fecha_registro'=>date('Y-m-d'),
			'estatus'=>'0',
			);


			$this->db->insert('public.t_tclientes',$data);

			$this->welcome_model->log($this->session->userdata['id_user'] ,'Creación de atencion preferencial',$this->db->last_query());
			$retorno="Atención preferencial Creado";

			return $retorno;
	}

	function bloquear($datos)
	{

		$data = [
			$_POST['name'] => $_POST['valor']
		];

		$this->db->where('id_tcliente', $_POST['id']);
		$this->db->update('public.'.$_POST['tb'], $data);

		if ($_POST['valor']==0) { $return = 'Activo'; $log = 'Activar atc preferencial'; }
		elseif ($_POST['valor']==1) { $return = 'Inactivo'; $log = 'Inactivar atc preferencial'; }

		$this->welcome_model->log($this->session->userdata['id_user'],$log,$this->db->last_query());


		return $return;
	}

	function buscar($datos)
	{
		$this->db->where('id_tcliente', $_POST['id']);
		$user = $this->db->get('public.t_tclientes');


		if($user->num_rows()>0)
		{
			return $user->row_array();
		}

	}

	function editar($datos)
	{
		 $data = array(
			'tcliente'=>$datos['e_preferencial'],
			'id_usuario'=>$this->session->userdata['id_user'],
			'ult_mod'=>date('Y-m-d'),
		);

		$this->db->where('id_tcliente', $datos['e_id']);
		$this->db->update('public.t_tclientes', $data);

		$this->welcome_model->log($this->session->userdata['id_user'],'Atc preferencial modificado',$this->db->last_query());


		return 'Atención preferencial modificado';
	}

}