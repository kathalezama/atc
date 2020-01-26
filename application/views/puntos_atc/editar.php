<form action="<?php echo base_url(); ?>index.php/puntos/editar" method="post">
<div class="modal" id="editar">
   <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">


        <div class="modal-header">
            <h5 class="modal-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Editar punto de atención</font></font></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                <span aria-hidden="true"><font style="vertical-align: inherit;">×</font></span>
            </button>
        </div>

        
        <div class="modal-body">
            <div class="row">
                <div class="col-lg-6">Nombre del punto de atc.</div>
                <div class="col-lg-6">Servicio</div>
                <div class="col-lg-6"><input type="text" name="nombre" id="nombre" class="form-control" required></div>
                <div class="col-lg-6">
                    <select id="servicios" name="servicios" class="form-control">
                    <option value='0' >-- Seleccione</option>
                      <?php foreach ($_ci_vars['servicios'] as $key) {
                        echo "<option value='".$key['id_servicio']."'>".$key['nombre']."</option>";
                      } ?>
                   </select>
                </div>
                <div class="col-lg-6">Estatus</div>
                <div class="col-lg-6">Analista</div>
                <div class="col-lg-6">
                    <select id="estatus" name="estatus" class="form-control">
                        <option value=''>-- Seleccione</option>              
                        <option value='0'>Activo</option>              
                        <option value='1'>Inactivo</option>              
                    </select>
                </div>
                <div class="col-lg-6">
                    <select id="analista" name="analista" class="form-control">
                    <option value='' >-- Seleccione</option>
                      <?php foreach ($_ci_vars['analista2'] as $key) {
                        echo "<option value='".$key['id_user']."'>".$key['nombre_completo']."</option>";
                      } ?>
                   </select>
                </div>

                <div class="col-lg-12"><br></div>
                <div class="col-lg-12">Atención preferencial</div>
                <div class="col-lg-12"><br></div>

                <?php foreach ($_ci_vars['preferencial'] as $key) { ?>

                <div class="col-lg-4">
                     <div class="custom-control custom-checkbox checkbox-primary">
                        <input type="checkbox" class="custom-control-input" id="<?php echo $key['id_tcliente']; ?>" name="preferencial[]" value="<?php echo $key['id_tcliente']; ?>">
                        <label class="custom-control-label" for="<?php echo $key['id_tcliente']; ?>"><?php echo $key['tcliente']; ?></label>
                     </div>                   
                </div>

                <?php } ?>
                <input type="hidden" name="e_id" id="e_id">
            </div>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal"><font style="vertical-align: inherit;">Cerrar</font></button>
            <button type="submit" id="c_guardar" name="c_guardar" class="btn btn-primary"><font style="vertical-align: inherit;">Guardar</font></button>
        </div>
    </div>
    
</div>
</div>
</form>


