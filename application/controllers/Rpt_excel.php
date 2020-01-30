<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Rpt_excel extends CI_Controller {


	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	$this->load->helper('form');
    	$this->load->model('reportes_model');
    	$this->load->library('session');
    	$this->load->library('excel');

	}

	public function ensitio(){
		$this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->setTitle('Reporte de vendedor');
        $this->excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(15); 

        $style = array(
	        'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, ),
	        'borders' => array(
            	'allborders' => array(
	                'style' => PHPExcel_Style_Border::BORDER_THIN,
	                'color' => array('rgb' => '000000')
	            )
	        ),
	        'font'  => array(
	            'bold'  => true,
	            'color' => array('rgb' => '000000'),
	            'size'  => 7
        	),
	    );
	    $style2 = array(
	        'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, ),
	        'font'  => array(
	            'bold'  => true,
	            'color' => array('rgb' => '000000'),
	            'size'  => 7
        	),
	    );

        $style3 = array(
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, ),
            'font'  => array(
                'bold'  => false,
                'color' => array('rgb' => '000000'),
                'size'  => 7
            ),
        );

        $this->excel->getDefaultStyle()->applyFromArray($style3);
        $this->excel->getActiveSheet()->setCellValue('A2', 'Reporte Front Office');
        $this->excel->getActiveSheet()->mergeCells('A2:K2');

        $this->excel->getActiveSheet()->setCellValue('A3', 'DESDE '.$_POST['desde'].' HASTA '.$_POST['hasta']);
        $this->excel->getActiveSheet()->mergeCells('A3:K3');

        $analistas = $this->reportes_model->analistas();
        $motivos = $this->reportes_model->motivos();

        $x=chr(65);
        $y=5;

        $this->excel->getActiveSheet()->setCellValue($x.$y, 'Motivos');

        for ($i=0; $i < count($analistas) ; $i++) { 
            $x=chr($i+66);
            $y=5;
            $this->excel->getActiveSheet()->setCellValue($x.$y, $analistas[$i]['nombre_completo']);
        }
        $x=chr($i+66);
        $this->excel->getActiveSheet()->setCellValue($x.$y, 'Total');

        $y=6;
        $m=0;

            foreach ($motivos as $value) {
                $x=chr(65);
                $total=0;

                $this->excel->getActiveSheet()->setCellValue($x.$y, $value['motivo']);

                for ($i=0; $i < count($analistas); $i++) { 
                    $c = $this->reportes_model->contar_mot($value['id_motivo'],$analistas[$i]['id_user'],$_POST);
                    $x=chr($i+66);
                    $this->excel->getActiveSheet()->setCellValue($x.$y, $c);  
                    $total=$total+$c;
                    $t[$i]=$t[$i]+$c;
                }
                $x=chr($i+66);


                $this->excel->getActiveSheet()->setCellValue($x.$y, $total);  
                $y++;
            }

            for ($i=0; $i < count($t) ; $i++) { 
                $x=chr(65);
                $total=0;

                $this->excel->getActiveSheet()->setCellValue($x.$y, 'Totales');

                for ($i=0; $i < count($analistas); $i++) { 
                    $x=chr($i+66);
                    $this->excel->getActiveSheet()->setCellValue($x.$y, $t[$i]); 
                    $total=$total+$t[$i];
                }

                $x=chr($i+66);
                $this->excel->getActiveSheet()->setCellValue($x.$y, $total);  
                $y++;
            }

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="'.$vendedor['cod_vendedor'].'_'.$vendedor['nsem'].'_'.$vendedor['apellidos'].'_'.$vendedor['nombres'].'.xls"');
        header('Cache-Control: max-age=0'); //no cache
        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');
        // Forzamos a la descarga
        $objWriter->save('php://output');
	}

    public function otroscanales(){
       // print_r($_POST);

        $this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->setTitle('Reporte de vendedor');
        $this->excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(15); 

        $style = array(
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, ),
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array('rgb' => '000000')
                )
            ),
            'font'  => array(
                'bold'  => true,
                'color' => array('rgb' => '000000'),
                'size'  => 7
            ),
        );
        $style2 = array(
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, ),
            'font'  => array(
                'bold'  => true,
                'color' => array('rgb' => '000000'),
                'size'  => 7
            ),
        );

        $style3 = array(
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, ),
            'font'  => array(
                'bold'  => false,
                'color' => array('rgb' => '000000'),
                'size'  => 7
            ),
        );

        $this->excel->getDefaultStyle()->applyFromArray($style3);
        $this->excel->getActiveSheet()->setCellValue('A2', 'Reporte Back Office');
        $this->excel->getActiveSheet()->mergeCells('A2:K2');

        $this->excel->getActiveSheet()->setCellValue('A3', 'DESDE '.$_POST['desde'].' HASTA '.$_POST['hasta']);
        $this->excel->getActiveSheet()->mergeCells('A3:K3');

        $analistas = $this->reportes_model->analistas();
        $motivos = $this->reportes_model->motivos();

        $x=chr(65);
        $y=5;

        $this->excel->getActiveSheet()->setCellValue($x.$y, 'Motivos');

        for ($i=0; $i < count($analistas) ; $i++) { 
            $x=chr($i+66);
            $y=5;
            $this->excel->getActiveSheet()->setCellValue($x.$y, $analistas[$i]['nombre_completo']);
        }
        $x=chr($i+66);
        $this->excel->getActiveSheet()->setCellValue($x.$y, 'Total');

        $y=6;
        $m=0;

            foreach ($motivos as $value) {
                $x=chr(65);
                $total=0;

                $this->excel->getActiveSheet()->setCellValue($x.$y, $value['motivo']);

                for ($i=0; $i < count($analistas); $i++) { 
                    $c = $this->reportes_model->contar_mot2($value['id_motivo'],$analistas[$i]['id_user'],$_POST);
                    $x=chr($i+66);
                    $this->excel->getActiveSheet()->setCellValue($x.$y, $c);  
                    $total=$total+$c;
                    $t[$i]=$t[$i]+$c;
                }
                $x=chr($i+66);


                $this->excel->getActiveSheet()->setCellValue($x.$y, $total);  
                $y++;
            }

            for ($i=0; $i < count($t) ; $i++) { 
                $x=chr(65);
                $total=0;

                $this->excel->getActiveSheet()->setCellValue($x.$y, 'Totales');

                for ($i=0; $i < count($analistas); $i++) { 
                    $x=chr($i+66);
                    $this->excel->getActiveSheet()->setCellValue($x.$y, $t[$i]); 
                    $total=$total+$t[$i];
                }

                $x=chr($i+66);
                $this->excel->getActiveSheet()->setCellValue($x.$y, $total);  
                $y++;
            }

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="'.$vendedor['cod_vendedor'].'_'.$vendedor['nsem'].'_'.$vendedor['apellidos'].'_'.$vendedor['nombres'].'.xls"');
        header('Cache-Control: max-age=0'); //no cache
        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');
        // Forzamos a la descarga
        $objWriter->save('php://output');
    }

    public function analistas()
    {

        $analistas = $this->reportes_model->analista($_POST['analista']);
        $atencion = $this->reportes_model->atencion($_POST);
       

        $this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->setTitle('Reporte de vendedor');
        $this->excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(15); 

        $style = array(
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, ),
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array('rgb' => '000000')
                )
            ),
            'font'  => array(
                'bold'  => true,
                'color' => array('rgb' => '000000'),
                'size'  => 7
            ),
        );
        $style2 = array(
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, ),
            'font'  => array(
                'bold'  => true,
                'color' => array('rgb' => '000000'),
                'size'  => 7
            ),
        );

        $style3 = array(
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, ),
            'font'  => array(
                'bold'  => false,
                'color' => array('rgb' => '000000'),
                'size'  => 7
            ),
        );

        $this->excel->getDefaultStyle()->applyFromArray($style3);
        $this->excel->getActiveSheet()->setCellValue('A2', 'Reporte por Analista');
        $this->excel->getActiveSheet()->mergeCells('A2:J2');

        $this->excel->getActiveSheet()->setCellValue('A3', 'DESDE '.$_POST['desde'].' HASTA '.$_POST['hasta']);
        $this->excel->getActiveSheet()->mergeCells('A3:J3');

        $this->excel->getActiveSheet()->setCellValue('A4', 'Analista '.$analistas['nombre_completo']);
        $this->excel->getActiveSheet()->mergeCells('A4:J4');

        $this->excel->getActiveSheet()->setCellValue('A5', 'Fecha');
        $this->excel->getActiveSheet()->setCellValue('B5', 'Cedula');
        $this->excel->getActiveSheet()->setCellValue('C5', 'Asegurado');
        $this->excel->getActiveSheet()->setCellValue('D5', 'Motivo');
        $this->excel->getActiveSheet()->setCellValue('E5', 'Canal ATC');
        $this->excel->getActiveSheet()->setCellValue('F5', 'Pausa');
        $this->excel->getActiveSheet()->setCellValue('G5', 'Hora llegada');
        $this->excel->getActiveSheet()->setCellValue('H5', 'Espera');
        $this->excel->getActiveSheet()->setCellValue('I5', 'Hora ATC');
        $this->excel->getActiveSheet()->setCellValue('J5', 'ATC');


        $hfin='00:00';
        $x=6;
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
                $hfin='00:00';
            }
            $i++;
            if ($i==1) {
                $pausa = $hora4->diff($hora4);
                $fecha_ant=$fecha[0];
            }else{
                $pausa = $hora4->diff($hora2);
            }

            $this->excel->getActiveSheet()->setCellValue('A'.$x, $fecha[0]);
            $this->excel->getActiveSheet()->setCellValue('B'.$x, $key['cedula']);
            $this->excel->getActiveSheet()->setCellValue('C'.$x, ucwords(strtolower($key['nombre_completo'])));
            $this->excel->getActiveSheet()->setCellValue('D'.$x, ucwords(strtolower($key['motivo'])));
            $this->excel->getActiveSheet()->setCellValue('E'.$x, 'Canal ATC');
            $this->excel->getActiveSheet()->setCellValue('F'.$x, $pausa->format('%H:%I'));
            $this->excel->getActiveSheet()->setCellValue('G'.$x, $key['hora_recepcion']);
            $this->excel->getActiveSheet()->setCellValue('H'.$x, $intervalo->format('%H:%I'));
            $this->excel->getActiveSheet()->setCellValue('I'.$x, $key['hora_atc_i']);
            $this->excel->getActiveSheet()->setCellValue('J'.$x, $intervalo2->format('%H:%I'));

            $fecha_ant=$fecha[0];
            $hfin=$key['hora_atc_f'];
            $x++;

        }


        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="reporte_por_analista.xls"');
        header('Cache-Control: max-age=0'); //no cache
        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');
        // Forzamos a la descarga
        $objWriter->save('php://output');

/*

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
                $hfin='00:00';
                $this->fpdf->Cell(275,0.1,'',1,0,'L');
                $this->fpdf->Ln(0.2);
            }
            $i++;
            if ($i==1) {
                $pausa = $hora4->diff($hora4);
                $fecha_ant=$fecha[0];
            }else{
                $pausa = $hora4->diff($hora2);
            }

            

            $this->fpdf->Cell(15,6,$fecha[0],0,0,'L');
            $this->fpdf->Cell(20,6,$key['cedula'],0,0,'R');
            $this->fpdf->Cell(65,6,utf8_decode(ucwords(strtolower($key['nombre_completo']))),0,0,'L');
            $this->fpdf->Cell(45,6,utf8_decode(ucwords(strtolower($key['motivo']))),0,0,'L');
            $this->fpdf->Cell(30,6,'Canal ATC',0,0,'L');
            $this->fpdf->Cell(20,6,$pausa->format('%H:%I'),0,0,'L');
            $this->fpdf->Cell(20,6,$key['hora_recepcion'],0,0,'L');
            $this->fpdf->Cell(20,6,$intervalo->format('%H:%I'),0,0,'L');
            $this->fpdf->Cell(20,6,$key['hora_atc_i'],0,0,'L');
            $this->fpdf->Cell(20,6,$intervalo2->format('%H:%I'),0,0,'L');
            $this->fpdf->Ln(6);
            $fecha_ant=$fecha[0];
            $hfin=$key['hora_atc_f'];
            //echo $hfin;

        }

        $this->fpdf->Output();*/

    }
}

