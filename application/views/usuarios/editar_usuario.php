<form action="<?php echo base_url(); ?>index.php/usuarios/save_nuevo_usuario" method="post">
<div class="modal" id="editaUser">
   <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">


        <div class="modal-header">
            <h5 class="modal-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Editar usuario</font></font></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                <span aria-hidden="true"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">×</font></font></span>
            </button>
        </div>

        
        <div class="modal-body">
            <div class="row">
                <div class="col-lg-4">Cedula</div>
                <div class="col-lg-4">Nombres</div>
                <div class="col-lg-4">Apellidos</div>

                <div class="col-lg-4"><input type="text" name="cedula" id="cedula" class="form-control numero" maxlength="8" readonly=""></div>
                <div class="col-lg-4"><input type="text" name="nombres" id="nombres" class="form-control"></div>
                <div class="col-lg-4"><input type="text" name="apellidos" id="apellidos" class="form-control"></div>

                
                <div class="col-lg-4">Correo</div>
                <div class="col-lg-4">Telefono</div>
                <div class="col-lg-4">Rol</div>

                
                <div class="col-lg-4"><input type="text" name="correo" id="correo" class="form-control mail"></div>
                <div class="col-lg-4"><input type="text" name="telefono" id="telefono" class="form-control numero" maxlength="11"></div>
                <div class="col-lg-4">
                   <select id="rol" name="rol" class="form-control">
                    echo "<option value='' >-- Seleccione</option>";
                      <?php foreach ($_ci_vars[roles] as $key) {
                        echo "<option value='".$key[id_rol]."'>".$key[rol]."</option>";
                      } ?>
                   </select>
                </div>

            </div>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Cerrar</font></font></button>
            <button type="submit" id="guardar" name="guardar" class="btn btn-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Guardar</font></font></button>
        </div>
    </div>
</div>
</form>

