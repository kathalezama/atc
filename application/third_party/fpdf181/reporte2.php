<?php
	require('fpdf.php');

	$pdf = new FPDF('L');
	$pdf->AddPage();
	$pdf->SetFont('Arial','B',16);
	$pdf->Cell(275,10,'Estado de cuenta de Comisiones',0,0,'C');
	
	$pdf->Ln(10);
	$pdf->SetFont('Arial','B',10);

	// DATOS DEL VENDEDOR ********************************************************************

	$pdf->SetFillColor(148, 196, 241); 

	$pdf->Cell(80,8,'Vendedor', 0, 0, 'C', True);
	$pdf->Cell(35,8,'Codigo',0,0,'C', True);
	$pdf->Cell(80,8,'Coordinador',0,0,'C', True);
	$pdf->Cell(80,8,'Periodo',0,0,'C', True);

	$pdf->Ln(8);

	$pdf->Cell(80,8,'Alvaro Angulo', 0, 0, 'C');
	$pdf->Cell(35,8,'32962',0,0,'C');
	$pdf->Cell(80,8,'Ericson Velasco',0,0,'C');
	$pdf->Cell(80,8,'SEM 38 DEL 23/09/19 AL 29/09/19',0,0,'C');

	$pdf->Line(10,36,285,36);
	// ASIGNACIONES **************************************************************************

	$pdf->Ln(10);
	$pdf->SetFont('Arial','',14);

	$pdf->Cell(275,10,'a) Asignaciones',0,0,'L');

	$pdf->Ln(15);

	$pdf->SetFont('Arial','B',10);
	$pdf->Cell(40,8,'Asegurado', 0, 0, 'C', True);
	$pdf->Cell(30,8,'Cedula',0,0,'C', True);
	$pdf->Cell(40,8,'Tipo Venta',0,0,'C', True);
	$pdf->Cell(30,8,'Plan',0,0,'C', True);
	$pdf->Cell(30,8,'Adicionales',0,0,'C', True);
	$pdf->Cell(35,8,'Suma',0,0,'C', True);
	$pdf->Cell(35,8,'Cuotas',0,0,'C', True);
	$pdf->Cell(35,8,'Comision',0,0,'C', True);

	$pdf->Ln(8);
	$pdf->SetFont('Arial','',10);

	$pdf->Cell(40,8,'Asegurado',1,0, 'C');
	$pdf->Cell(30,8,'Cedula',1,0,'C');
	$pdf->Cell(40,8,'Tipo Venta',1,0,'C');
	$pdf->Cell(30,8,'Plan',1,0,'C');
	$pdf->Cell(30,8,'Adicionales',1,0,'C');
	$pdf->Cell(35,8,'Suma',1,0,'C');
	$pdf->Cell(35,8,'Cuotas',1,0,'C');
	$pdf->Cell(35,8,'Comision',1,0,'C');

	
	$pdf->Ln(10);

	$pdf->SetFont('Arial','',14);

	// DEDUCCIONES **************************************************************************


	$pdf->Cell(275,10,'b) Deducciones',0,0,'L');

	$pdf->Ln(15);

	$pdf->SetFont('Arial','B',10);

	$pdf->SetFont('Arial','B',10);
	$pdf->Cell(40,8,'Asegurado', 0, 0, 'C', True);
	$pdf->Cell(30,8,'Cedula',0,0,'C', True);
	$pdf->Cell(40,8,'Tipo Venta',0,0,'C', True);
	$pdf->Cell(30,8,'Plan',0,0,'C', True);
	$pdf->Cell(30,8,'Adicionales',0,0,'C', True);
	$pdf->Cell(35,8,'Suma',0,0,'C', True);
	$pdf->Cell(35,8,'Cuotas',0,0,'C', True);
	$pdf->Cell(35,8,'Comision',0,0,'C', True);

	$pdf->Ln(8);
	$pdf->SetFont('Arial','',10);

	$pdf->Cell(40,8,'Asegurado',1,0, 'C');
	$pdf->Cell(30,8,'Cedula',1,0,'C');
	$pdf->Cell(40,8,'Tipo Venta',1,0,'C');
	$pdf->Cell(30,8,'Plan',1,0,'C');
	$pdf->Cell(30,8,'Adicionales',1,0,'C');
	$pdf->Cell(35,8,'Suma',1,0,'C');
	$pdf->Cell(35,8,'Cuotas',1,0,'C');
	$pdf->Cell(35,8,'Comision',1,0,'C');

	$pdf->Ln(10);

	$pdf->Cell(240,8,utf8_decode('Total a pagar'), 0, 0, 'R');
	$pdf->Cell(35,8,'asig - deduc',1,0,'C');

	
	$pdf->Output();
?>