<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome_model extends CI_Model{
    function __construct(){
        parent::__construct();
        $this->load->database();
    }    

	function menu()
	{
		$this->db->order_by('t_menu.orden','asc');
		$menu = $this->db->get('public.t_menu');
		
		if($menu->num_rows()>0)
		{
			return $menu->result_array();
		}

	}
}