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

	function contar_mot($motivo,$analista,$fechas)
	{
		$this->db->select('count(*) as total');
		$this->db->where('id_motivo',$motivo);
		$this->db->where('id_analista',$analista);
		$this->db->where('id_canal','0');
		$this->db->where("fecha_registro BETWEEN '".$fechas['desde']."' AND '".$fechas['hasta']."'");


		$listMotivos = $this->db->get('public.t_atencion');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->row()->total;
		}
	}

	function contar_mot2($motivo,$analista,$fechas)
	{
		$this->db->select('count(*) as total');
		$this->db->where('id_motivo',$motivo);
		$this->db->where('id_analista',$analista);
		$this->db->where('id_canal !=','0');
		$this->db->where("fecha_registro BETWEEN '".$fechas['desde']."' AND '".$fechas['hasta']."'");

		//echo $this->db->last_query();


		$listMotivos = $this->db->get('public.t_atencion');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->row()->total;
		}
	}

	function atencion(){

		$this->db->select('cedula, nombre_completo, hora_recepcion, hora_atc_i, hora_atc_f, t_clientes.id_cliente as cliente, t_atencion.id_cliente as atencion, motivo, t_atencion.fecha_registro');
		$this->db->join('t_clientes','t_clientes.id_cliente = t_atencion.id_cliente');
		$this->db->join('t_motivos','t_motivos.id_motivo = t_atencion.id_motivo','left');
		//$this->db->where("fecha_registro BETWEEN '".$fechas['desde']."' AND '".$fechas['hasta']."'");
		$this->db->order_by('t_atencion.fecha_registro, hora_recepcion');

		$listMotivos = $this->db->get('public.t_atencion');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->result_array();
		}

	}
 }