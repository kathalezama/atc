<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Atencion_model extends CI_Model{
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
	
	function save($datos)
	{
		$sql="";

		$data = array(
			'id_cliente'=> $id,
			'id_pto'=>'0',
			'hora_recepcion'=>date('H:i:s'),
			'tiket'=>strtoupper(substr($datos['nombres'], 0, 1)).'-'.substr($datos['cedula'], -4, 4),
			'id_usuario'=>$this->session->userdata['id_user'],
			'fecha_registro'=>date('Y-m-d'),
			'id_servicio'=>$datos['servicios'],
			'id_motivo'=>$datos['motivos'],
			'id_pref'=>$datos['preferencial'],
			'id_ces'=>$datos['especial'],
		);


		$this->db->insert('public.t_atencion',$data);

		$sql=$this->db->last_query();

		$this->welcome_model->log($this->session->userdata['id_user'] ,'Creación de ticket',$sql);

		$retorno='ticket creado';

		return $retorno;
	}

	function buscar()
	{
		// [nombre_completo]  [correo]  [telefono] [username] [cedula] [id_servicio] [id_pref] [id_ces]

		$this->db->select('id_atencion, nombre_completo, telefono, correo, cedula, t_servicios.nombre, motivo');
		$this->db->join('t_clientes','t_clientes.id_cliente = t_atencion.id_cliente','left');
		$this->db->join('t_servicios','t_servicios.id_servicio = t_atencion.id_servicio','left');
		$this->db->join('t_motivos','t_motivos.id_motivo = t_atencion.id_motivo','left');
		$this->db->where('t_servicios.id_servicio',$this->session->userdata['id_servicio']);
		$this->db->where('t_atencion.estatus','4');
		$this->db->order_by('id_ces, id_pref, hora_recepcion','asc');
		$listMotivos = $this->db->get('public.t_atencion');

		$this->welcome_model->log($this->session->userdata['id_user'],'Llamando cliente',$this->db->last_query());


		if($listMotivos->num_rows()>0)
		{

			$data = array(
				'estatus'=>'5',
				'id_pto'=>$this->session->userdata['id_pto'],
				'hora_atc_i'=>date('H:i'),
			);

			$this->db->where('id_atencion', $listMotivos->row()->id_atencion);
			$this->db->update('public.t_atencion', $data);

			$this->welcome_model->log($this->session->userdata['id_user'],'Llamando cliente',$this->db->last_query());
 
			return $listMotivos->row_array();
		} else {

			return '0';
		}

	}

 }