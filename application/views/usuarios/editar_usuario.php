<form action="<?php echo base_url(); ?>index.php/usuarios/edit_usuario" method="post">
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
                <div class="col-lg-8">Nombres y Apellidos</div>

                <div class="col-lg-4"><input type="text" name="e_cedula" id="e_cedula" class="form-control numero" maxlength="8" readonly=""></div>
                <div class="col-lg-8"><input type="text" name="e_nombres" id="e_nombres" class="form-control"></div>

                
                <div class="col-lg-4">Correo</div>
                <div class="col-lg-4">Telefono</div>
                <div class="col-lg-4">Rol</div>

                
                <div class="col-lg-4"><input type="text" name="e_correo" id="e_correo" class="form-control mail"></div>
                <div class="col-lg-4"><input type="text" name="e_telefono" id="e_telefono" class="form-control numero" maxlength="11"></div>
                <div class="col-lg-4">
                   <select id="e_rol" name="e_rol" class="form-control">
                    echo "<option value='' >-- Seleccione</option>";
                      <?php foreach ($_ci_vars['roles'] as $key) {
                        echo "<option value='".$key['id_rol']."'>".$key['rol']."</option>";
                      } ?>
                   </select>
                </div>

                <input type="hidden" name="e_id_user" id="e_id_user">


            </div>
        </div>

        <div class="modal-footer">

            <button type="button" class="btn btn-secondary" data-dismiss="modal">
                <font style="vertical-align: inherit;">Cerrar</font>
            </button>

            <button type="submit" id="e_guardar" name="e_guardar" class="btn btn-primary">
                <font style="vertical-align: inherit;">Guardar</font>
            </button>

        </div>
    </div>
</div>
</div>
</form>

<script type="text/javascript">
    $('._editar').click(function(){

        var ide = $(this).attr("id");
        $('#e_id_user').val(ide);

        $.post("<?php echo base_url() ?>index.php/usuarios/buscar_usuario", { id:$(this).attr("id")}, function(data){

            var user = data.split(':');

            $('#e_cedula').val(user[0]);
            $('#e_nombres').val(user[1]);
            $('#e_correo').val(user[2]);
            $('#e_telefono').val(user[3]);

        });

    });
</script>

