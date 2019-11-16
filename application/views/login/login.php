<!-- Preloader -->
    <div class="preloader-it">
        <div class="loader-pendulums"></div>
    </div>
    <!-- /Preloader -->
   
	<!-- HK Wrapper -->
	<div class="hk-wrapper">

        <!-- Main Content -->
        <div class="hk-pg-wrapper hk-auth-wrapper">
            <header class="d-flex justify-content-between align-items-center">
                <a class="d-flex auth-brand" href="#"></a>
                <div class="btn-group btn-group-sm">
                    <a href="#" class="btn btn-outline-secondary">Ayuda</a>
                </div>
            </header>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-5 pa-0 login-image-l"></div>
                    <div class="col-xl-7 pa-0 login-image-r">
                        <div class="auth-form-wrap py-xl-0 py-50">
                            <div class="auth-form w-xxl-55 w-xl-75 w-sm-90 w-xs-100 login-body">
                                <form action="<?php echo base_url(); ?>index.php/login/login" method="post">
                                    <h1 class="display-4 mb-10">Iniciar Sesión</h1>
                                    <p class="mb-30"></p>
                                    <div class="form-group">
                                        <input class="form-control letras" id="user" name="user" placeholder="Usuario" type="text">
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input class="form-control" id="clave" name="clave" placeholder="Clave" type="password">
                                        </div>
                                    </div>
                                    <div class="custom-control custom-checkbox mb-25">
                                        <input class="custom-control-input" id="same-address" type="checkbox" checked>
                                        <label class="custom-control-label font-14" for="same-address">Mantener sesion activa</label>
                                    </div>
                                    <button class="btn btn-primary btn-block" type="submit">Login</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Main Content -->

    </div>
</body>