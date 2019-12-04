<form action="<?php echo base_url(); ?>index.php/recepcion/save" method="post">

<div class="hk-pg-wrapper pb-0">
            <!-- Container -->
            <nav aria-label="breadcrumb">
				<ol class="breadcrumb">
				    <li class="breadcrumb-item">Recepcion</li>
				    <li class="breadcrumb-item active" aria-current="page"></li>
				</ol>
			</nav>
    <div class="container-fluid margen">
                <!-- Row -->

        <div class="row">
            <div class="col-xl-8 pa-0">
               	<section class="hk-sec-wrapper">
                  	<h5 class="hk-sec-title">Asignar ticket</h5>
                    <div class="row">
                       	<div class="col-xl-6">Cedula:</div>
                       	<div class="col-xl-6">Apellidos y Nombres:</div>

                    	<div class="col-xl-6"><input type="text" class="form-control" id="cedula" name="cedula"></div>
                    	<div class="col-xl-6"><input type="text" class="form-control" id="nombres" name="nombres"></div>

                    	<div class="col-xl-6">Telefono:</div>
                       	<div class="col-xl-6">Correo:</div>

                    	<div class="col-xl-6"><input type="text" class="form-control" id="telefono" name="telefono"></div>
                    	<div class="col-xl-6"><input type="text" class="form-control" id="correo" name="correo"></div>

		                <div class="col-xl-6">Servicio:</div>
                       	<div class="col-xl-6">Motivo:</div>

                       	<div class="col-lg-6">
		                    <select id="servicios" name="servicios" class="form-control">
		                    <option value='' >-- Seleccione</option>
		                      <?php foreach ($_ci_vars['servicios'] as $key) {
		                        echo "<option value='".$key['id_servicio']."'>".$key['nombre']."</option>";
		                      } ?>
		                   </select>
                       	</div>

                       	<div class="col-lg-6">
		                    <select id="motivos" name="motivos" class="form-control">
		                    <option value='' >-- Seleccione</option>
		                      <?php foreach ($_ci_vars['motivos'] as $key) {
		                        echo "<option value='".$key['id_motivo']."'>".$key['motivo']."</option>";
		                      } ?>
		                   </select>
                       	</div>

                       	<div class="col-xl-12"><br></div>
                    	<div class="col-xl-12">Atención preferencial:</div>
                       	<div class="col-xl-12"><br></div>

                    	<?php foreach ($_ci_vars['preferencial'] as $key) { ?>

		                <div class="col-lg-4">
		                     <div class="custom-control custom-checkbox checkbox-primary">
		                        <input type="checkbox" class="custom-control-input" id="<?php echo $key['id_tcliente']; ?>" name="preferencial[]" value="<?php echo $key['id_tcliente']; ?>">
		                        <label class="custom-control-label" for="<?php echo $key['id_tcliente']; ?>"><?php echo $key['tcliente']; ?></label>
		                     </div>                   
		                </div>

		                <?php } ?>



		                <div class="col-xl-12"><br></div>
                       	<div class="col-xl-10"><br></div>

		                <div class="col-lg-2"><button type="submit" id="c_guardar" name="c_guardar" class="btn btn-primary"><font style="vertical-align: inherit;">Guardar</font></button></div>
                    </div>
                </section>
            </div>
        </div>
                <!-- /Row -->

	</div>
            <!-- /Container -->
</div>
</form>
        <!-- /Main Content -->
        