<?php
defined('BASEPATH') OR exit('No direct script access allowed');

//require_once APPPATH.'third_party/fpdf181/fpdf.php';


class Reportes extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
    	$this->load->library('fpdf_master');
    	$this->load->model('reportes_model');

	}

	public function otroscanales()
	{
		$this->fpdf->AddPage('L');
		$this->fpdf->Image(base_url().'assets/logo-seguros-la-fe2.png',255,10,60);
		$this->fpdf->SetFont('Arial','B',14);
		//$this->fpdf->Ln(8);
		$this->fpdf->Cell(280,10,'Gestion Back Office',0,0,'L');
		$this->fpdf->Ln(8);
		$this->fpdf->Cell(280,10,'Desde hasta',0,0,'L');
		$this->fpdf->Ln(18);
		$this->fpdf->SetFont('Arial','B',10);
		$this->fpdf->Cell(49,6,'Motivo',1,0,'C');
		$this->fpdf->Cell(33,6,'Motivo',1,0,'C');
		$this->fpdf->Cell(33,6,'Motivo',1,0,'C');
		$this->fpdf->Cell(33,6,'Motivo',1,0,'C');
		$this->fpdf->Cell(33,6,'Motivo',1,0,'C');
		$this->fpdf->Cell(33,6,'Motivo',1,0,'C');
		$this->fpdf->Cell(33,6,'Motivo',1,0,'C');
		$this->fpdf->Cell(33,6,'Motivo',1,0,'C');



		$this->fpdf->Output();

	}

	public function ensitio()
	{

		$analistas = $this->reportes_model->analistas();
		$motivos = $this->reportes_model->motivos();

		$this->fpdf->AddPage('L');
		$this->fpdf->Image(base_url().'assets/logo-seguros-la-fe2.png',255,10,60);
		$this->fpdf->SetFont('Arial','B',14);
		//$this->fpdf->Ln(8);
		$this->fpdf->Cell(280,10,'Gestion Front Office',0,0,'L');
		$this->fpdf->Ln(8);
		$this->fpdf->Cell(280,10,'Desde hasta',0,0,'L');
		$this->fpdf->Ln(18);
		$this->fpdf->SetFont('Arial','',9);
		$this->fpdf->Cell(62,6,'Motivo',1,0,'C');


		//if (count($analistas)>7) {
			for ($i=0; $i < 6; $i++) { 
				$this->fpdf->Cell(33,6,$analistas[$i]['nombre_completo'],1,0,'C');
			}
			
			$this->fpdf->Cell(20,6,'Total',1,0,'C');
			$this->fpdf->SetFont('Arial','',8);
			$this->fpdf->Ln(6);

			foreach ($motivos as $value) {
				$total=0;
				$this->fpdf->SetFont('Arial','B',9);
				$this->fpdf->Cell(62,6,utf8_decode($value['motivo']),0,0,'L');
				$this->fpdf->SetFont('Arial','',9);

				for ($i=0; $i < 6; $i++) { 
					$c = $this->reportes_model->contar_mot($value['id_motivo'],$analistas[$i]['id_user']);
					$this->fpdf->Cell(33,6,utf8_decode($c),0,0,'C');
					$total=$total+$c;
				}
				$this->fpdf->SetFont('Arial','B',9);
				$this->fpdf->Cell(20,6,utf8_decode($total),0,0,'C');
				$this->fpdf->Ln(6);
				$this->fpdf->Cell(280,0.001,'',1,0,'L');
				$this->fpdf->Ln(0.001);
			}

		//}




		$this->fpdf->Output();

	}

}
