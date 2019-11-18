<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Motivos_model extends CI_Model{
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

	function listMotivos()
	{
		$this->db->join('t_estatus','t_estatus.id_estatus = t_motivos.estatus','left');
		//$this->db->where('estatus','0');
		$listMotivos = $this->db->get('public.t_motivos');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->result_array();
		}
	}

	function save($datos)
	{
		$data = array(
			'motivo'=>$datos['motivo'],
			'id_usuario'=>$this->session->userdata['id_user'],
			'fecha_registro'=>date('Y-m-d'),
			'estatus'=>'0',
			);


			$this->db->insert('public.t_motivos',$data);

			$this->welcome_model->log($this->session->userdata['id_user'] ,'Creación de Motivo',$this->db->last_query());
			$retorno="Motivo Creado";

			return $retorno;
	}

	function bloquear($datos)
	{

		$data = [
			$_POST['name'] => $_POST['valor']
		];

		$this->db->where('id_motivo', $_POST['id']);
		$this->db->update('public.'.$_POST['tb'], $data);

		if ($_POST['valor']==0) { $return = 'Activo'; $log = 'Activar Motivo'; }
		elseif ($_POST['valor']==1) { $return = 'Inactivo'; $log = 'Inactivar Motivo'; }

		$this->welcome_model->log($this->session->userdata['id_user'],$log,$this->db->last_query());


		return $return;
	}

}