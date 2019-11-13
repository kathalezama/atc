<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>ATC | PROJECT</title>
    <meta name="description" content="A responsive bootstrap 4 admin dashboard template by hencework" />

    <!-- Favicon -->
    <link rel="shortcut icon" href="<?php echo base_url(); ?>favicon.ico">
    <link rel="icon" href="<?php echo base_url(); ?>favicon.ico" type="image/x-icon">
	
	<!-- Morris Charts CSS -->
    <link href="<?php echo base_url(); ?>assets/vendors/morris.js/morris.css" rel="stylesheet" type="text/css" />
	
    <!-- Toggles CSS -->
    <link href="<?php echo base_url(); ?>assets/vendors/jquery-toggles/css/toggles.css" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url(); ?>assets/vendors/jquery-toggles/css/themes/toggles-light.css" rel="stylesheet" type="text/css">

    <!-- Data Table CSS -->
    <link href="<?php echo base_url(); ?>assets/vendors/datatables.net-dt/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url(); ?>assets/vendors/datatables.net-responsive-dt/css/responsive.dataTables.min.css" rel="stylesheet" type="text/css" />
	
    <!-- Custom CSS -->
    <link href="<?php echo base_url(); ?>assets/dist/css/style.css" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url(); ?>assets/dist/css/atc.css" rel="stylesheet" type="text/css">

    <script src="<?php echo base_url(); ?>assets/vendors/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<?php echo base_url(); ?>assets/vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/vendors/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Slimscroll JavaScript -->
    <script src="<?php echo base_url(); ?>assets/dist/js/jquery.slimscroll.js"></script>

    <!-- Fancy Dropdown JS -->
    <script src="<?php echo base_url(); ?>assets/dist/js/dropdown-bootstrap-extended.js"></script>

    <!-- FeatherIcons JavaScript -->
    <script src="<?php echo base_url(); ?>assets/dist/js/feather.min.js"></script>

    <!-- Data Table JavaScript -->
    <script src="<?php echo base_url(); ?>assets/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-dt/js/dataTables.dataTables.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/vendors/jszip/dist/jszip.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/vendors/pdfmake/build/vfs_fonts.js"></script>
    <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>

    <!-- Toggles JavaScript -->
    <script src="<?php echo base_url(); ?>assets/vendors/jquery-toggles/toggles.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/dist/js/toggle-data.js"></script>
    
    <!-- Counter Animation JavaScript -->
    <script src="<?php echo base_url(); ?>assets/vendors/waypoints/lib/jquery.waypoints.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/vendors/jquery.counterup/jquery.counterup.min.js"></script>
    
    <!-- Easy pie chart JS -->
    <script src="<?php echo base_url(); ?>assets/vendors/easy-pie-chart/dist/jquery.easypiechart.min.js"></script>
    
    <!-- Sparkline JavaScript -->
    <script src="<?php echo base_url(); ?>assets/vendors/jquery.sparkline/dist/jquery.sparkline.min.js"></script>
    
    <!-- Morris Charts JavaScript -->
    <script src="<?php echo base_url(); ?>assets/vendors/raphael/raphael.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/vendors/morris.js/morris.min.js"></script>
   
    <!-- EChartJS JavaScript -->
    <script src="<?php echo base_url(); ?>assets/vendors/echarts/dist/echarts-en.min.js"></script>
    
    <!-- Peity JavaScript -->
    <script src="<?php echo base_url(); ?>assets/vendors/peity/jquery.peity.min.js"></script>
   
    <!-- Init JavaScript -->
    <script src="<?php echo base_url(); ?>assets/dist/js/init.js"></script>
    <script src="<?php echo base_url(); ?>assets/dist/js/dashboard3-data.js"></script>
</head>

<body>
    <!-- Preloader -->
    <div class="preloader-it">
        <div class="loader-pendulums"></div>
    </div>
    <!-- /Preloader -->
	
	<!-- HK Wrapper -->
	<div class="hk-wrapper hk-alt-nav">

        <!-- Top Navbar -->
        <nav class="navbar navbar-expand-xl navbar-light fixed-top hk-navbar hk-navbar-alt">
            <a class="navbar-toggle-btn nav-link-hover navbar-toggler" href="javascript:void(0);" data-toggle="collapse" data-target="#navbarCollapseAlt" aria-controls="navbarCollapseAlt" aria-expanded="false" aria-label="Toggle navigation"><span class="feather-icon"><i data-feather="menu"></i></span></a>
            <!-- <a class="navbar-brand" href="dashboard1.html">
                <img class="brand-img d-inline-block align-top" src="dist/img/logo-light.png" alt="brand" />
            </a> -->
            <div class="collapse navbar-collapse" id="navbarCollapseAlt">
                <ul class="navbar-nav">
                    <?php foreach ($_ci_vars as $menu) {
                        if ($menu['id_padre']==0) {
                            echo '<li class="nav-item dropdown show-on-hover"><a class="nav-link dropdown-toggle" href="'.base_url().$menu['ruta'].'" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'.$menu['item'].'</a>';
                        }
                        if ($menu['hijos']==1) {
                        echo '<div class="dropdown-menu" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">';
                         foreach ($_ci_vars as $smenu) {
                            if ($smenu['id_padre']==$menu['id_menu']) {
                                echo '<a class="dropdown-item" href="'.base_url().$smenu['ruta'].'">'.$smenu['item'].'</a>';
                            }  
                          }  
                        echo '</div>';
                        }
                        echo '</li>';
                    } ?>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="documentation.html" >Documentation</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Log</a>
                    </li>
                </ul>
            </div>
            <ul class="navbar-nav hk-navbar-content">
                <li class="nav-item dropdown dropdown-authentication">
                    <a class="nav-link dropdown-toggle no-caret" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <div class="media">
                            <div class="media-body">
                                <span>Madelyn Shane<i class="zmdi zmdi-chevron-down"></i></span>
                            </div>
                        </div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" data-dropdown-in="flipInX" data-dropdown-out="flipOutX">
                        <a class="dropdown-item" href="profile.html"><i class="dropdown-icon zmdi zmdi-account"></i><span>Profile</span></a>
                        <a class="dropdown-item" href="#"><i class="dropdown-icon zmdi zmdi-card"></i><span>My balance</span></a>
                        <a class="dropdown-item" href="inbox.html"><i class="dropdown-icon zmdi zmdi-email"></i><span>Inbox</span></a>
                        <a class="dropdown-item" href="#"><i class="dropdown-icon zmdi zmdi-settings"></i><span>Settings</span></a>
                        <div class="dropdown-divider"></div>
                        <div class="sub-dropdown-menu show-on-hover">
                            <a href="#" class="dropdown-toggle dropdown-item no-caret"><i class="zmdi zmdi-check text-success"></i>Online</a>
                            <div class="dropdown-menu open-left-side">
                                <a class="dropdown-item" href="#"><i class="dropdown-icon zmdi zmdi-check text-success"></i><span>Online</span></a>
                                <a class="dropdown-item" href="#"><i class="dropdown-icon zmdi zmdi-circle-o text-warning"></i><span>Busy</span></a>
                                <a class="dropdown-item" href="#"><i class="dropdown-icon zmdi zmdi-minus-circle-outline text-danger"></i><span>Offline</span></a>
                            </div>
                        </div>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#"><i class="dropdown-icon zmdi zmdi-power"></i><span>Log out</span></a>
                    </div>
                </li>
            </ul>
        </nav>
        <!-- /Top Navbar -->
    </div>
    <div class="hk-settings-panel">
            <div class="nicescroll-bar position-relative">
                <div class="settings-panel-wrap">
                    <div class="settings-panel-head">