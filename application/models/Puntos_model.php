<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Puntos_model extends CI_Model{
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

	function serv_pto($id)
	{
		$this->db->select('nombre');
		$this->db->join('t_pto_serv','t_pto_serv.id_servicio = t_servicios.id_servicio','left');
		$this->db->where('t_pto_serv.id_pto',$id);	

		$serv = $this->db->get('public.t_servicios');

		$servicios = "";

		if($serv->num_rows()>0)
		{
			foreach ($serv->result_array() as $key) {
				
				$servicios = $servicios.'- '.$key['nombre'].' ';
			}

			return $servicios;
		}else{

			return 'No aplica';

		}

	}

	function serv_pto2($id)
	{
		$this->db->select('t_servicios.id_servicio');
		$this->db->join('t_pto_serv','t_pto_serv.id_servicio = t_servicios.id_servicio','left');
		$this->db->where('t_pto_serv.id_pto',$id);	

		$serv = $this->db->get('public.t_servicios');

		//return $id;

		$servicios = "";

		if($serv->num_rows()>0)
		{
			foreach ($serv->result_array() as $key) {
				
				$servicios = $servicios.$key['id_servicio'];
			}

			return $servicios;
		}else{

			return '0';

		}

	}

	function preferencial_pto($id)
	{
		$this->db->select('tcliente');
		$this->db->join('t_pto_pref','t_pto_pref.id_pre = t_tclientes.id_tcliente','left');
		$this->db->where('t_pto_pref.id_pto',$id);	

		$serv = $this->db->get('public.t_tclientes');

		$servicios = "";

		if($serv->num_rows()>0)
		{
			foreach ($serv->result_array() as $key) {
				
				$servicios = $servicios.'- '.$key['tcliente'].'<br>';
			}

			return $servicios;
		}else{

			return 'No aplica';
		}

	}

	function preferencial_pto2($id)
	{
		$this->db->select('id_tcliente');
		$this->db->join('t_pto_pref','t_pto_pref.id_pre = t_tclientes.id_tcliente','left');
		$this->db->where('t_pto_pref.id_pto',$id);	

		$serv = $this->db->get('public.t_tclientes');

		$servicios = "";

		if($serv->num_rows()>0)
		{
			foreach ($serv->result_array() as $key) {
				
				$servicios = $servicios.$key['id_tcliente'].':';
			}

			return $servicios;
		}else{

			return '0';
		}

	}

	function list()
	{
		$this->db->select('nombre_completo, nombre, id_pto, t_estatus.estatus, t_estatus.id_estatus');
		$this->db->join('t_estatus','t_estatus.id_estatus = t_ptos_atc.estatus','left');
		$this->db->join('t_usuarios','t_usuarios.id_user = t_ptos_atc.id_analista','left');
		//$this->db->where('estatus','0');
		$listMotivos = $this->db->get('public.t_ptos_atc');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->result();
		}
	}

	function listServicios()
	{
		$this->db->join('t_estatus','t_estatus.id_estatus = t_servicios.estatus','left');
		$this->db->where('t_servicios.estatus','0');
		$listMotivos = $this->db->get('public.t_servicios');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->result_array();
		}
	}

	function listMotivos()
	{
		$this->db->join('t_estatus','t_estatus.id_estatus = t_motivos.estatus','left');
		$this->db->where('t_motivos.estatus','0');
		$listMotivos = $this->db->get('public.t_motivos');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->result_array();
		}
	}

	function listPreferencial()
	{
		$this->db->join('t_estatus','t_estatus.id_estatus = t_tclientes.estatus','left');
		$this->db->where('t_tclientes.estatus','0');
		$listMotivos = $this->db->get('public.t_tclientes');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->result_array();
		}
	}

	function listAnalista()
	{
		$this->db->join('t_estatus','t_estatus.id_estatus = t_usuarios.estatus','left');
		$this->db->where('t_usuarios.estatus','0');
		$this->db->where('t_usuarios.id_rol','3');
		$this->db->where('t_usuarios.id_user NOT IN (select id_analista from t_ptos_atc where t_ptos_atc.estatus = 0)',NULL,FALSE);

		$listMotivos = $this->db->get('public.t_usuarios');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->result_array();
		}
	}

	function listAnalista2()
	{
		$this->db->join('t_estatus','t_estatus.id_estatus = t_usuarios.estatus','left');
		$this->db->where('t_usuarios.estatus','0');
		$this->db->where('t_usuarios.id_rol','3');
		//$this->db->where('t_usuarios.id_user NOT IN (select id_analista from t_ptos_atc where id_analista='.$id.')',NULL,FALSE);

		$listMotivos = $this->db->get('public.t_usuarios');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->result_array();
		}
	}

	function save($datos)
	{
		$data = array(
			'nombre'=>$datos['nombre'],
			'id_analista'=>$datos['analista'],
			'id_usuario'=>$this->session->userdata['id_user'],
			'fecha_registro'=>date('Y-m-d'),
			'estatus'=>'0',
		);


		$this->db->insert('public.t_ptos_atc',$data);

		$sql=$this->db->last_query();

		$id = $this->db->insert_id();

		if ($_POST['preferencial']!="") {
		foreach ($_POST['preferencial'] as $key) {

			$data = array(
				'id_pto'=>$id,
				'id_pre'=>$key,
			);

			$this->db->insert('public.t_pto_pref',$data);

			$sql=$sql.'; '.$this->db->last_query();

	    }
		}

	    $data = array(
			'id_pto'=>$id,
			'id_servicio'=>$_POST['servicios'],
		);

		$this->db->insert('public.t_pto_serv',$data);

		$sql=$sql.'; '.$this->db->last_query();


		$this->welcome_model->log($this->session->userdata['id_user'] ,'Creación de punto de atención',$sql);

		$retorno='Punto de atención Creado';

		return $retorno;
	}

	function bloquear($datos)
	{

		$data = [
			$_POST['name'] => $_POST['valor']
		];

		$this->db->where('id_pto', $_POST['id']);
		$this->db->update('public.'.$_POST['tb'], $data);

		if ($_POST['valor']==0) { $return = 'Activo'; $log = 'Activar punto de atención'; }
		elseif ($_POST['valor']==1) { $return = 'Inactivo'; $log = 'Inactivar punto de atención'; }

		$this->welcome_model->log($this->session->userdata['id_user'],$log,$this->db->last_query());


		return $return;
	}

	function buscar($datos)
	{
		$this->db->select('nombre_completo, nombre, id_pto, t_estatus.estatus, t_estatus.id_estatus, t_usuarios.id_user');
		$this->db->join('t_estatus','t_estatus.id_estatus = t_ptos_atc.estatus','left');
		$this->db->join('t_usuarios','t_usuarios.id_user = t_ptos_atc.id_analista','left');
		$this->db->where('id_pto',$datos);
		$listMotivos = $this->db->get('public.t_ptos_atc');
		
		if($listMotivos->num_rows()>0)
		{
			return $listMotivos->row_array();
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