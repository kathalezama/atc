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
}

