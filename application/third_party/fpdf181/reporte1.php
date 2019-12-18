<?php
	require('fpdf.php');

	$pdf = new FPDF('L');
	$pdf->AddPage();
	$pdf->SetFont('Arial','B',16);
	$pdf->Cell(275,10,'Estado de cuenta General de Comisiones',0,0,'C');
	
	$pdf->Ln(10);
	$pdf->SetFont('Arial','',14);

	// ASIGNACIONES **************************************************************************

	$pdf->Cell(275,10,'a) Asignaciones',0,0,'L');

	$pdf->Ln(15);

	$pdf->SetFont('Arial','B',10);
	$pdf->SetFillColor(148, 196, 241); 

	$pdf->Cell(65,8,'Vendedor', 0, 0, 'C', True);
	$pdf->Cell(30,8,'Codigo',0,0,'C', True);
	$pdf->Cell(60,8,'Tipo Venta',0,0,'C', True);
	$pdf->Cell(50,8,'Nro de Operaciones',0,0,'C', True);
	$pdf->Cell(35,8,'Comision',0,0,'C', True);
	$pdf->Cell(35,8,'Coordinador',0,0,'C', True);

	$pdf->Ln(8);
	$pdf->SetFont('Arial','',10);

	$pdf->Cell(65,12,utf8_decode('Alvaro Angulo'), 1, 0, 'C');
	$pdf->Cell(30,12,'30756',1,0,'C');
	$pdf->Cell(60,6,utf8_decode('Emisión'),1,0,'C');
	$pdf->Cell(50,6,'2',1,0,'C');
	$pdf->Cell(35,6,'102.441,50',1,0,'C');
	$pdf->Cell(35,6,'20.488,30',1,0,'C');

	$pdf->Ln(6);

	$pdf->Cell(65,6,utf8_decode(''), 0, 0, 'C');
	$pdf->Cell(30,6,'',0,0,'C');
	$pdf->Cell(60,6,utf8_decode('Actualización de Datos'),1,0,'C');
	$pdf->Cell(50,6,'8',1,0,'C');
	$pdf->Cell(35,6,'8.000,00',1,0,'C');
	$pdf->Cell(35,6,'1.600,00',1,0,'C');

	$pdf->Ln(6);

	$pdf->Cell(65,6,utf8_decode('Ericson Velasco'), 1, 0, 'C');
	$pdf->Cell(30,6,'21022',1,0,'C');
	$pdf->Cell(60,6,utf8_decode('Emisión'),1,0,'C');
	$pdf->Cell(50,6,'2',1,0,'C');
	$pdf->Cell(35,6,'102.441,50',1,0,'C');
	$pdf->Cell(35,6,'20.488,30',1,0,'C');

	$pdf->Ln(8);
	$pdf->SetFont('Arial','B',10);

	$pdf->Cell(155,6,utf8_decode('Total asignaciones'), 0, 0, 'R');
	$pdf->Cell(50,6,'12',1,0,'C');
	$pdf->Cell(35,6,'suma total',1,0,'C');
	$pdf->Cell(35,6,'suma total',1,0,'C');

	$pdf->Ln(10);
	$pdf->SetFont('Arial','',14);

	// DEDUCCIONES **************************************************************************


	$pdf->Cell(275,10,'b) Deducciones',0,0,'L');

	$pdf->Ln(15);

	$pdf->SetFont('Arial','B',10);
	$pdf->SetFillColor(148, 196, 241); 

	$pdf->Cell(40,8,'Tomador', 0, 0, 'C', True);
	$pdf->Cell(25,8,'Cedula',0,0,'C', True);
	$pdf->Cell(50,8,'Causa',0,0,'C', True);
	$pdf->Cell(30,8,'N Familiares',0,0,'C', True);
	$pdf->Cell(30,8,'S.A',0,0,'C', True);
	$pdf->Cell(30,8,'N Cuotas',0,0,'C', True);
	$pdf->Cell(35,8,'Comision',0,0,'C', True);
	$pdf->Cell(35,8,'Coordinador',0,0,'C', True);

	$pdf->Ln(8);
	$pdf->SetFont('Arial','',10);

	$pdf->Cell(40,6,'Katherine', 1, 0, 'C');
	$pdf->Cell(25,6,'21072511',1,0,'C');
	$pdf->Cell(50,6,'No pago',1,0,'C');
	$pdf->Cell(30,6,'4',1,0,'C');
	$pdf->Cell(30,6,'100.000.000,00',1,0,'C');
	$pdf->Cell(30,6,'4',1,0,'C');
	$pdf->Cell(35,6,'100.000,00',1,0,'C');
	$pdf->Cell(35,6,'1.000,00',1,0,'C');

	$pdf->Ln(8);
	$pdf->SetFont('Arial','B',10);

	$pdf->Cell(205,6,utf8_decode('Total deducciones'), 0, 0, 'R');
	$pdf->Cell(35,6,'suma total',1,0,'C');
	$pdf->Cell(35,6,'suma total',1,0,'C');

	$pdf->Ln(8);

	$pdf->Cell(205,6,utf8_decode('Total General'), 0, 0, 'R');
	$pdf->Cell(35,6,'asig - deduc',1,0,'C');
	$pdf->Cell(35,6,'asig - deduc',1,0,'C');

	
	$pdf->Output();
?>