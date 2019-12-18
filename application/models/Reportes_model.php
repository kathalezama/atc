<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reportes_model extends CI_Model{
    function __construct(){
        parent::__construct();
    }    

	function analistas()
	{

		$this->db->select('id_user,nombre_completo');
		$this->db->where('estatus','0');
		$this->db->where('id_rol','3');

		$listMotivos = $this->db->get('public.t_usuarios');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->result_array();
		}

	}

	function motivos()
	{
		$this->db->select('id_motivo,motivo');

		$listMotivos = $this->db->get('public.t_motivos');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->result_array();
		}
	}

	function contar_mot($motivo,$analista)
	{
		$this->db->select('count(*) as total');
		$this->db->where('id_motivo',$motivo);
		$this->db->where('id_analista',$analista);

		$listMotivos = $this->db->get('public.t_atencion');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->row()->total;
		}
	}
 }