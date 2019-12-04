<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Canales_model extends CI_Model{
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
		$this->db->join('t_estatus','t_estatus.id_estatus = t_canales.estatus','left');
		//$this->db->where('estatus','0');
		$listMotivos = $this->db->get('public.t_canales');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->result_array();
		}
	}

	function save($datos)
	{
		$data = array(
			'canal'=>$datos['canal'],
			'id_usuario'=>$this->session->userdata['id_user'],
			'fecha_registro'=>date('Y-m-d'),
			'estatus'=>'0',
			);


			$this->db->insert('public.t_canales',$data);

			$this->welcome_model->log($this->session->userdata['id_user'] ,'Creación de canal de atc',$this->db->last_query());
			$retorno="Canal Creado";

			return $retorno;
	}

	function bloquear($datos)
	{

		$data = [
			$_POST['name'] => $_POST['valor']
		];

		$this->db->where('id_canal', $_POST['id']);
		$this->db->update('public.'.$_POST['tb'], $data);

		if ($_POST['valor']==0) { $return = 'Activo'; $log = 'Activar canal de atc'; }
		elseif ($_POST['valor']==1) { $return = 'Inactivo'; $log = 'Inactivar canal de atc'; }

		$this->welcome_model->log($this->session->userdata['id_user'],$log,$this->db->last_query());


		return $return;
	}

	function buscar($datos)
	{
		$this->db->where('id_canal', $_POST['id']);
		$user = $this->db->get('public.t_canales');


		if($user->num_rows()>0)
		{
			return $user->row_array();
		}

	}

	function editar($datos)
	{
		 $data = array(
			'canal'=>$datos['e_canal'],
			'id_usuario'=>$this->session->userdata['id_user'],
			'ult_mod'=>date('Y-m-d'),
		);

		$this->db->where('id_canal', $datos['e_id']);
		$this->db->update('public.t_canales', $data);

		$this->welcome_model->log($this->session->userdata['id_user'],'Canal de atc modificado',$this->db->last_query());


		return 'Canal Modificado';
	}

}