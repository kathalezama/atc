<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Motivos_model extends CI_Model{
    function __construct(){
        parent::__construct();
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

}