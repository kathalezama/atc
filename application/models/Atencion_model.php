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
	
	/*function save($datos)
	{
		$sql="";

		$this->db->where('cedula',$datos['cedula']);

		$cliente = $this->db->get('public.t_clientes');
		
		if($cliente->num_rows()>0)
		{
			$id = $cliente->row()->id_cliente;
			
		}else{

			$data = array(
				'cedula'=>$datos['cedula'],
				'nombre_completo'=>$datos['nombres'],
				'correo'=>$datos['correo'],
				'telefono'=>$datos['telefono'],
				'id_usuario'=>$this->session->userdata['id_user'],
				'fecha_registro'=>date('Y-m-d'),
				'estatus'=>'0',
			);

			$this->db->insert('public.t_clientes',$data);

			$sql=$this->db->last_query();

			$id = $this->db->insert_id();
		}	

	
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

		$sql=$sql.'; '.$this->db->last_query();


		$this->welcome_model->log($this->session->userdata['id_user'] ,'Creación de ticket',$sql);

		$retorno='ticket creado';

		return $retorno;
	}*/

	function buscar()
	{
		$this->db->select('nombre_completo, telefono, correo, cedula, t_servicios.nombre, motivo');
		$this->db->join('t_clientes','t_clientes.id_cliente = t_atencion.id_cliente','left');
		$this->db->join('t_servicios','t_servicios.id_servicio = t_atencion.id_servicio','left');
		$this->db->join('t_motivos','t_motivos.id_motivo = t_atencion.id_motivo','left');
		//$this->db->where('cedula',$datos);
		$listMotivos = $this->db->get('public.t_atencion');


		//return $this->db->last_query();
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->row_array();
		}

	}

 }