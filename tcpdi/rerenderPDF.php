<?php
// Include the main TCPDF library and TCPDI.
require_once('tcpdf.php');
require_once('tcpdi.php');

/*********************************************/
/* //Create new PDF document.
$pdf = new TCPDI(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

//Add a page from a PDF by file path.
$pdf->AddPage();
$pdf->setSourceFile('922-2194-1-PB (2).pdf');
$idx = $pdf->importPage(1);
$pdf->useTemplate($idx);

$pdfdata = file_get_contents('dummy.pdf'); // Simulate only having raw data available.
$pagecount = $pdf->setSourceData($pdfdata); 
for ($i = 1; $i <= $pagecount; $i++) { 
    $tplidx = $pdf->importPage($i);
    $pdf->AddPage();
    $pdf->useTemplate($tplidx); 
}
$pdf->Output();*/

/*********************/
class PDF extends TCPDI {
 /**
 * "Remembers" the template id of the imported page
 */
 var $_tplIdx;
 
 private $_filename = '';
 
 /**
 * include a background template for every page
 */
 function Header() {
	 if (is_null($this->_tplIdx)) {
			$pdfdata = file_get_contents($this->_filename);
			$pagecount = $this->setSourceData($pdfdata); 
			
			for ($intCounterOfLoop = 1; $intCounterOfLoop <= $pagecount; $intCounterOfLoop++) { 
				 $this->_tplIdx = $this->importPage($intCounterOfLoop);				 
				 $this->useTemplate($this->_tplIdx);	 
				 $this->SetFont('helvetica', '', 7);
				 $this->SetTextColor('black');
				 $this->SetXY(0, 5);
				 $timeZoneOffset = timezone_offset_get( new DateTimeZone(date_default_timezone_get()), new DateTime() );
				 $strTimeZone = 'GMT '.$this->timezone_offset_string($timeZoneOffset);
				 $this->Cell(0, 0, "Download Date : ".date('Y-m-d H:i:s A ').$strTimeZone.' '.date_default_timezone_get(),0,0,'R');
				 if($intCounterOfLoop != $pagecount){
					$this->AddPage();
				 }
			}
	 }
	 
}
 
 function Footer() {}
 
 function setFileName($strFileName){
	$this->_filename = $strFileName;
 }
  
function timezone_offset_string( $offset ){
			return sprintf( "%s%02d:%02d", ( $offset >= 0 ) ? '+' : '-', abs( $offset / 3600 ), abs( $offset % 3600 ) );
	}
}
 
 
function generatePDF($filePath, $filename=''){
	// initiate PDF
	$pdf = new PDF();
	$pdf->setFileName($filePath);
	$pdf->SetMargins(PDF_MARGIN_LEFT, 40, PDF_MARGIN_RIGHT);
	$pdf->SetAutoPageBreak(true, 40);
	$pdf->setFontSubsetting(false);
	 
	// add a page
	//$pdf->AddPage();
	 
	// get esternal file content
	//$pdf->SetFont("helvetica", "", 8);

	// now write some text above the imported page
	//$pdf->Write(1, $utf8text,'',false,'right',false,true,true);
	if($filename!='')
	$pdf->Output($filename, 'D');
	else
	$pdf->Output('newpdf.pdf', 'D');
}