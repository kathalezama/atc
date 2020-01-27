<?php
defined('BASEPATH') OR exit('No direct script access allowed');

//require_once APPPATH.'third_party/fpdf181/fpdf.php';


class Reportes extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
    	$this->load->library('fpdf_master');
    	$this->load->model('reportes_model');
    	$this->load->model('welcome_model');

	}

	public function v_ensitio(){

		$this->menu();
		$this->load->view('reportes/ensitio');
		$this->load->view('layout/footer');
	}

	public function v_analistas(){

		$this->menu();
		$this->load->view('reportes/analistas');
		$this->load->view('layout/footer');
	}

	public function v_otroscanales(){

		$this->menu();
		$this->load->view('reportes/otroscanales');
		$this->load->view('layout/footer');
	}

	public function menu(){
		
		$menu = $this->welcome_model->menu();
		if (isset($this->session->userdata->nombre_completo)) {
			$this->session->sess_destroy();
			redirect('login/' , 'refresh');
		}
		$this->load->view('layout/header',$menu);
	}

	public function otroscanales()
	{

		//print_r($_POST);
		$analistas = $this->reportes_model->analistas();
		$motivos = $this->reportes_model->motivos();

		$this->fpdf->AddPage('L');
		$this->fpdf->Image(base_url().'assets/logo-seguros-la-fe2.png',255,10,60);


		if (count($analistas)>6) { $nana = count($analistas) / 6; $f=7; }
		elseif (count($analistas)==0) { $nana = 0; }
		else { $nana=1; $f=count($analistas); }

		if ($nana>0) {

		for ($x=0; $x < $nana; $x++) { 
			$this->fpdf->SetFont('Arial','B',14);
			//$this->fpdf->Ln(8);
			$this->fpdf->Cell(280,8,'Gestion Back Office',0,0,'L');
			$this->fpdf->Ln(8);
			$this->fpdf->Cell(280,10,'Desde '.$_POST['desde'].' hasta '.$_POST['hasta'],0,0,'L');
			$this->fpdf->Ln(15);
			$this->fpdf->SetFont('Arial','',9);
			$this->fpdf->Cell(62,6,'Motivo',1,0,'C');

			$e=$x*7+$f;

			for ($i=$x*7; $i < $e ; $i++) { 
				$this->fpdf->Cell(33,6,$analistas[$i]['nombre_completo'],1,0,'C');
			}
			
			$this->fpdf->Cell(20,6,'Total',1,0,'C');
			$this->fpdf->SetFont('Arial','',8);
			$this->fpdf->Ln(6);

			foreach ($motivos as $value) {
				
				$total=0;

				$this->fpdf->SetFont('Arial','B',9);
				$this->fpdf->Cell(62,6,($value['motivo']),0,0,'L');
				$this->fpdf->SetFont('Arial','',9);

				for ($i=$x*7; $i < $e; $i++) { 
					$c = $this->reportes_model->contar_mot2($value['id_motivo'],$analistas[$i]['id_user'],$_POST);
					$this->fpdf->Cell(33,6,$c,0,0,'C');
					$total=$total+$c;
					$t[$i]=$t[$i]+$c;
				}

				$this->fpdf->SetFont('Arial','B',9);
				$this->fpdf->Cell(20,6,$total,0,0,'C');
				$this->fpdf->Ln(6);
			}

			for ($i=0; $i < count($t) ; $i++) { 
				$total=0;

				$this->fpdf->SetFont('Arial','B',9);
				$this->fpdf->Cell(62,6,('Totales'),1,0,'L');
				$this->fpdf->SetFont('Arial','',9);

				for ($i=$x*7; $i < $e; $i++) { 
					$this->fpdf->Cell(33,6,$t[$i],1,0,'C');
					$total=$total+$t[$i];
				}

				$this->fpdf->SetFont('Arial','B',9);
				$this->fpdf->Cell(20,6,$total,1,0,'C');
				$this->fpdf->Ln(6);
			}

		if ($x>1) $this->fpdf->AddPage('L');

		}
		}else{
			$this->fpdf->Cell(280,8,'NO HAY NADA QUE REPORTAR',0,0,'L');
		}

		$this->fpdf->Output();

	}

	public function ensitio()
	{

		$analistas = $this->reportes_model->analistas();
		$motivos = $this->reportes_model->motivos();

		$this->fpdf->AddPage('L');
		$this->fpdf->Image(base_url().'assets/logo-seguros-la-fe2.png',255,10,60);


		if (count($analistas)>6) { $nana = count($analistas) / 6; $f=7; }
		elseif (count($analistas)==0) { $nana = 0; }
		else { $nana=1; $f=count($analistas); }

		if ($nana>0) {

		for ($x=0; $x < $nana; $x++) { 
			$this->fpdf->SetFont('Arial','B',14);
			//$this->fpdf->Ln(8);
			$this->fpdf->Cell(280,8,'Gestion Front Office',0,0,'L');
			$this->fpdf->Ln(8);
			$this->fpdf->Cell(280,10,'Desde '.$_POST['desde'].' hasta '.$_POST['hasta'],0,0,'L');
			$this->fpdf->Ln(15);
			$this->fpdf->SetFont('Arial','',9);
			$this->fpdf->Cell(62,6,'Motivo',1,0,'C');

			$e=$x*7+$f;

			for ($i=$x*7; $i < $e ; $i++) { 
				$this->fpdf->Cell(33,6,$analistas[$i]['nombre_completo'],1,0,'C');
			}
			
			$this->fpdf->Cell(20,6,'Total',1,0,'C');
			$this->fpdf->SetFont('Arial','',8);
			$this->fpdf->Ln(6);

			foreach ($motivos as $value) {
				
				$total=0;

				$this->fpdf->SetFont('Arial','B',9);
				$this->fpdf->Cell(62,6,($value['motivo']),0,0,'L');
				$this->fpdf->SetFont('Arial','',9);

				for ($i=$x*7; $i < $e; $i++) { 
					$c = $this->reportes_model->contar_mot($value['id_motivo'],$analistas[$i]['id_user'],$_POST);
					$this->fpdf->Cell(33,6,$c,0,0,'C');
					$total=$total+$c;
					$t[$i]=$t[$i]+$c;
				}

				$this->fpdf->SetFont('Arial','B',9);
				$this->fpdf->Cell(20,6,$total,0,0,'C');
				$this->fpdf->Ln(6);
			}

			for ($i=0; $i < count($t) ; $i++) { 
				$total=0;

				$this->fpdf->SetFont('Arial','B',9);
				$this->fpdf->Cell(62,6,('Totales'),1,0,'L');
				$this->fpdf->SetFont('Arial','',9);

				for ($i=$x*7; $i < $e; $i++) { 
					$this->fpdf->Cell(33,6,$t[$i],1,0,'C');
					$total=$total+$t[$i];
				}

				$this->fpdf->SetFont('Arial','B',9);
				$this->fpdf->Cell(20,6,$total,1,0,'C');
				$this->fpdf->Ln(6);
			}

		if ($x>1) $this->fpdf->AddPage('L');

		}
		}else{
			$this->fpdf->Cell(280,8,'NO HAY NADA QUE REPORTAR',0,0,'L');
		}

		$this->fpdf->Output();

	}

	public function analistas()
	{

		//$analistas = $this->reportes_model->analistas();
		$atencion = $this->reportes_model->atencion();
		//echo "<pre>";
		//print_r($atencion);
		//echo "</pre>";


		$this->fpdf->AddPage('L');
		$this->fpdf->Image(base_url().'assets/logo-seguros-la-fe2.png',255,10,60);
		$this->fpdf->SetFont('Arial','B',10);
		//$this->fpdf->Ln(8);
		$this->fpdf->Cell(280,6,'Resumen por Analista',0,0,'L');
		$this->fpdf->Ln(6);
		$this->fpdf->Cell(280,6,'Analista:',0,0,'L');
		$this->fpdf->Ln(6);
		$this->fpdf->Cell(280,6,'Desde '.$_POST['desde'].' hasta '.$_POST['hasta'],0,0,'L');
		$this->fpdf->Ln(15);

		$this->fpdf->Cell(15,6,'Fecha',1,0,'C');
		$this->fpdf->Cell(20,6,'Cedula',1,0,'C');
		$this->fpdf->Cell(65,6,'Asegurado',1,0,'C');
		$this->fpdf->Cell(40,6,'Motivo',1,0,'C');
		$this->fpdf->Cell(25,6,'Canal ATC',1,0,'C');
		$this->fpdf->Cell(20,6,'H. llegada',1,0,'C');
		$this->fpdf->Cell(20,6,'Espera',1,0,'C');
		$this->fpdf->Cell(20,6,'Hora ATC',1,0,'C');
		$this->fpdf->Cell(20,6,'ATC',1,0,'C');
		$this->fpdf->Cell(20,6,'Pausa',1,0,'C');

		$this->fpdf->Ln(8);
		$this->fpdf->SetFont('Arial','',8);

		$hfin='00:00';
		foreach ($atencion as $key) {
			$fecha = explode(' ', $key['fecha_registro']);

			$hora1 = new DateTime($fecha[0].' '.$key['hora_recepcion']);//fecha inicial
			$hora2 = new DateTime($fecha[0].' '.$key['hora_atc_i']);//fecha de cierre
			$hora3 = new DateTime($fecha[0].' '.$key['hora_atc_f']);//fecha de cierre
			$hora4 = new DateTime($fecha[0].' '.$hfin);//fecha de cierre

			$intervalo = $hora1->diff($hora2);
			$intervalo2 = $hora2->diff($hora3);

			if ($fecha[0]!=$fecha_ant) {
				$i=0;
				//echo $fecha_ant;
			}
			$i++;
			//echo $i;
			if ($i==1) {
				$pausa="--";
				$fecha_ant=$fecha[0];
			}else{
				//echo "string";
				//echo $hfin.' '.$key['hora_atc_i'].' ';
				$pausa = $hora4->diff($hora2);
			}

			

			$this->fpdf->Cell(15,6,$fecha[0],0,0,'L');
			$this->fpdf->Cell(20,6,$key['cedula'],0,0,'R');
			$this->fpdf->Cell(65,6,utf8_decode(ucwords(strtolower($key['nombre_completo']))),0,0,'L');
			$this->fpdf->Cell(40,6,utf8_decode(ucwords(strtolower($key['motivo']))),0,0,'L');
			$this->fpdf->Cell(25,6,'Canal ATC',0,0,'L');
			$this->fpdf->Cell(20,6,$key['hora_recepcion'],0,0,'L');
			$this->fpdf->Cell(20,6,$intervalo->format('%H:%I'),0,0,'L');
			$this->fpdf->Cell(20,6,$key['hora_atc_i'],0,0,'L');
			$this->fpdf->Cell(20,6,$intervalo2->format('%H:%I'),0,0,'L');
			$this->fpdf->Cell(20,6,$pausa,0,0,'L');
			$this->fpdf->Ln(6);
			$fecha_ant=$fecha[0];
			$hfin=$key['hora_atc_f'];
			//echo $hfin;

		}

		$this->fpdf->Output();

	}

}
