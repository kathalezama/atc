<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>Brunette I Statistics Dashboard</title>
    <meta name="description" content="A responsive bootstrap 4 admin dashboard template by hencework" />

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
	
	<!-- Morris Charts CSS -->
    <link href="assets/vendors/morris.js/morris.css" rel="stylesheet" type="text/css" />
	
    <!-- Toggles CSS -->
    <link href="assets/vendors/jquery-toggles/css/toggles.css" rel="stylesheet" type="text/css">
    <link href="assets/vendors/jquery-toggles/css/themes/toggles-light.css" rel="stylesheet" type="text/css">
	
    <!-- Custom CSS -->
    <link href="assets/dist/css/style.css" rel="stylesheet" type="text/css">
    <link href="assets/dist/css/atc.css" rel="stylesheet" type="text/css">
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
                    <li class="nav-item dropdown show-on-hover active">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Dashboard
							</a>
                        <div class="dropdown-menu" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                            <a class="dropdown-item" href="dashboard1.html">CRM</a>
							<a class="dropdown-item" href="dashboard2.html">Project</a>
							<a class="dropdown-item active" href="dashboard3.html">Statistics</a>
							<a class="dropdown-item" href="dashboard4.html">classic</a>
							<a class="dropdown-item" href="dashboard5.html">Analytics</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown show-on-hover">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Pages
							</a>
                        <div class="dropdown-menu" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                            <div class="sub-dropdown-menu show-on-hover">
                                <a href="#" class="dropdown-toggle dropdown-item">Application</a>
                                <div class="dropdown-menu open-right-side">
                                    <a class="dropdown-item" href="chats.html">Chat</a>
                                    <a class="dropdown-item" href="calendar.html">Calendar</a>
                                    <a class="dropdown-item" href="email.html">Email</a>
                                    <a class="dropdown-item" href="file-manager.html">File Manager</a>
                                </div>
                            </div>
                            <div class="sub-dropdown-menu show-on-hover">
                                <a href="#" class="dropdown-toggle dropdown-item">Authentication</a>
                                <div class="dropdown-menu open-right-side">
                                    <div class="sub-dropdown-menu show-on-hover">
                                        <a href="#" class="dropdown-toggle dropdown-item">Sign Up</a>
                                        <div class="dropdown-menu open-right-side">
                                            <a class="dropdown-item" href="signup.html">Cover</a>
                                            <a class="dropdown-item" href="signup-simple.html">Simple</a>
                                        </div>
                                    </div>
                                    <div class="sub-dropdown-menu show-on-hover">
                                        <a href="#" class="dropdown-toggle dropdown-item">Login</a>
                                        <div class="dropdown-menu open-right-side">
                                            <a class="dropdown-item" href="login.html">Cover</a>
                                            <a class="dropdown-item" href="login-simple.html">Simple</a>
                                        </div>
                                    </div>
                                    <div class="sub-dropdown-menu show-on-hover">
                                        <a href="#" class="dropdown-toggle dropdown-item">Recover Pwd</a>
                                        <div class="dropdown-menu open-right-side">
                                            <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
                                            <a class="dropdown-item" href="reset-password.html">Reset Password</a>
                                        </div>
                                    </div>
                                    <a class="dropdown-item" href="lock-screen.html">Lock Screen</a>
                                    <a class="dropdown-item" href="404.html">Error 404</a>
                                    <a class="dropdown-item" href="maintenance.html">Maintenance</a>
                                </div>
                            </div>
                            <a class="dropdown-item" href="profile.html">Profile</a>
                            <a class="dropdown-item" href="invoice.html">Invoice</a>
                            <a class="dropdown-item" href="gallery.html">Gallery</a>
                            <a class="dropdown-item" href="activity.html">Activity</a>
                            <a class="dropdown-item" href="faq.html">Faq</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown show-on-hover">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								User interface
							</a>
                        <div class="dropdown-menu" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                            <div class="sub-dropdown-menu show-on-hover">
                                <a href="#" class="dropdown-toggle dropdown-item">Components</a>
                                <div class="dropdown-menu open-right-side">
                                    <a class="dropdown-item" href="alerts.html">Alerts</a>
                                    <a class="dropdown-item" href="avatar.html">Avatar</a>
                                    <a class="dropdown-item" href="badge.html">Badge</a>
                                    <a class="dropdown-item" href="buttons.html">Buttons</a>
                                    <a class="dropdown-item" href="cards.html">Cards</a>
                                    <a class="dropdown-item" href="carousel.html">Carousel</a>
                                    <a class="dropdown-item" href="collapse.html">Collapse</a>
                                    <a class="dropdown-item" href="dropdowns.html">Dropdown</a>
                                    <a class="dropdown-item" href="list-group.html">List Group</a>
                                    <a class="dropdown-item" href="modal.html">Modal</a>
                                    <a class="dropdown-item" href="nav.html">Nav</a>
                                    <a class="dropdown-item" href="navbar.html">Navbar</a>
                                    <a class="dropdown-item" href="nestable.html">Nestable</a>
                                    <a class="dropdown-item" href="pagination.html">Pagination</a>
                                    <a class="dropdown-item" href="popovers.html">Popovers</a>
                                    <a class="dropdown-item" href="progress.html">Progress</a>
                                    <a class="dropdown-item" href="tooltip.html">Tooltip</a>
                                </div>
                            </div>
                            <div class="sub-dropdown-menu show-on-hover">
                                <a href="#" class="dropdown-toggle dropdown-item">Content</a>
                                <div class="dropdown-menu open-right-side">
                                    <a class="dropdown-item" href="typography.html">Typography</a>
                                    <a class="dropdown-item" href="images.html">Images</a>
                                    <a class="dropdown-item" href="media-object.html">Media Object</a>
                                </div>
                            </div>
                            <div class="sub-dropdown-menu show-on-hover">
                                <a href="#" class="dropdown-toggle dropdown-item">Utilities</a>
                                <div class="dropdown-menu open-right-side">
                                    <a class="dropdown-item" href="background.html">Background</a>
                                    <a class="dropdown-item" href="border.html">Border</a>
                                    <a class="dropdown-item" href="colors.html">Colors</a>
                                    <a class="dropdown-item" href="embeds.html">Embeds</a>
                                    <a class="dropdown-item" href="icons.html">Icons</a>
                                    <a class="dropdown-item" href="shadow.html">Shadow</a>
                                    <a class="dropdown-item" href="sizing.html">Sizing</a>
                                    <a class="dropdown-item" href="spacing.html">Spacing</a>
                                </div>
                            </div>
                            <div class="sub-dropdown-menu show-on-hover">
                                <a href="#" class="dropdown-toggle dropdown-item">Forms</a>
                                <div class="dropdown-menu open-right-side">
                                    <a class="dropdown-item" href="form-element.html">Form Elements</a>
                                    <a class="dropdown-item" href="input-groups.html">Input Groups</a>
                                    <a class="dropdown-item" href="form-layout.html">Form Layout</a>
                                    <a class="dropdown-item" href="form-mask.html">Form Mask</a>
                                    <a class="dropdown-item" href="form-validation.html">Form Validation</a>
                                    <a class="dropdown-item" href="form-wizard.html">Form Wizard</a>
                                    <a class="dropdown-item" href="file-upload.html">File Upload</a>
                                    <a class="dropdown-item" href="editor.html">Editor</a>
                                </div>
                            </div>
                            <div class="sub-dropdown-menu show-on-hover">
                                <a href="#" class="dropdown-toggle dropdown-item">Tables</a>
                                <div class="dropdown-menu open-right-side">
                                    <a class="dropdown-item" href="basic-table.html">Basic Table</a>
                                    <a class="dropdown-item" href="data-table.html">Data Table</a>
                                    <a class="dropdown-item" href="responsive-table.html">Responsive Table</a>
                                    <a class="dropdown-item" href="editable-table.html">Editable Table</a>
                                </div>
                            </div>
                            <div class="sub-dropdown-menu show-on-hover">
                                <a href="#" class="dropdown-toggle dropdown-item">Charts</a>
                                <div class="dropdown-menu open-right-side">
                                    <a class="dropdown-item" href="line-charts.html">Line Chart</a>
                                    <a class="dropdown-item" href="area-charts.html">Area Chart</a>
                                    <a class="dropdown-item" href="bar-charts.html">Bar Chart</a>
                                    <a class="dropdown-item" href="pie-charts.html">Pie Chart</a>
                                    <a class="dropdown-item" href="realtime-charts.html">Realtime Chart</a>
                                    <a class="dropdown-item" href="mini-charts.html">Mini Chart</a>
                                </div>
                            </div>
                            <div class="sub-dropdown-menu show-on-hover">
                                <a href="#" class="dropdown-toggle dropdown-item">Maps</a>
                                <div class="dropdown-menu open-right-side">
                                    <a class="dropdown-item" href="google-map.html">Google Map</a>
                                    <a class="dropdown-item" href="vector-map.html">Vector Map</a>
                                </div>
                            </div>
                        </div>
                    </li>
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