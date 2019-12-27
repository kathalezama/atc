<?php 
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class mail_master {
		
	public function __construct() {
		
		//require_once APPPATH.'third_party/PHPMailer-6.1.1';
		require_once APPPATH.'third_party/PHPMailer-6.1.1/src/Exception.php';
		require_once APPPATH.'third_party/PHPMailer-6.1.1/src/PHPMailer.php';
		require_once APPPATH.'third_party/PHPMailer-6.1.1/src/SMTP.php';
		
		$mail = new PHPMailer(true);
		$mail->SMTPDebug = SMTP::DEBUG_SERVER;     
		$mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` also accepted		// Enable verbose debug output

		//$pdf->AddPage();
		
		$CI =& get_instance();
		$CI->mail = $mail;
	}
	
}