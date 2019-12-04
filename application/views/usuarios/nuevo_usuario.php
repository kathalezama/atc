<form action="<?php echo base_url(); ?>index.php/usuarios/save_nuevo_usuario" method="post">
<div class="modal" id="exampleModalLarge01">
   <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">


        <div class="modal-header">
            <h5 class="modal-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Crear nuevo usuario</font></font></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                <span aria-hidden="true"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">×</font></font></span>
            </button>
        </div>

        
        <div class="modal-body">
            <div class="row">
                <div class="col-lg-4">Cedula</div>
                <div class="col-lg-4">Nombres</div>
                <div class="col-lg-4">Apellidos</div>

                <div class="col-lg-4"><input type="text" name="cedula" id="cedula" class="form-control numero" maxlength="8"></div>
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
                      <?php foreach ($_ci_vars['roles'] as $key) {
                        echo "<option value='".$key['id_rol']."'>".$key['rol']."</option>";
                      } ?>
                   </select>
                </div>

                <div class="col-lg-4">Nombre de Usuario</div>
                <div class="col-lg-4">Clave</div>
                <div class="col-lg-4">Confirmar Clave</div>

                
                <div class="col-lg-4"><input type="text" name="username" id="username" class="form-control letras"></div>
                <div class="col-lg-4"><input type="password" name="clave" id="clave" class="form-control"></div>
                <div class="col-lg-4"><input type="password" name="rclave" id="rclave" class="form-control"></div>


            </div>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Cerrar</font></font></button>
            <button type="submit" id="guardar" name="guardar" class="btn btn-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Guardar</font></font></button>
        </div>
    </div>
</div>
</div>
</form>

<script type="text/javascript">
    $('.numero').on('input', function () { 
        this.value = this.value.replace(/[^0-9]/g,'');
    });

    $('.letras').on('input', function () { 
        this.value = this.value.replace(/[^a-zA-Z ]+$/,'');
    });

    $('.decimales').on('input', function () { 
        this.value = this.value.replace(/[^0-9\.]/g,'');
    });

    $('.mail').blur('input', function () { 
        if($(".mail").val().indexOf('@', 0) == -1 || $(".mail").val().indexOf('.', 0) == -1) {
            alert('El correo electrónico introducido no es correcto.');
            //$('.mail').val("");
            return false;
        }
    });
    /*$('#guardar').click(function(){
        if ($("input").val() == "") { 
           alert("Todos los campos son obligatorios"); 
          return false; 
        }
    })*/
    $('._bloquear').click(function(){

        var confirmacion = confirm("Realmente desea bloquear este usuario");
        var ide = $(this).attr("id");


        if (confirmacion==true) {
            $.post("<?php echo base_url() ?>index.php/usuarios/bloquear_usuario", { id:$(this).attr("id"), tb:'t_usuarios', name: 'estatus', valor:'2' }, function(data){
                $("#row_desactivar"+ide).html(data);
            });
        }
    });

    $('._activar').click(function(){

        var confirmacion = confirm("Realmente desea activar este usuario");
        var ide = $(this).attr("id");


        if (confirmacion==true) {
            $.post("<?php echo base_url() ?>index.php/usuarios/bloquear_usuario", { id:$(this).attr("id"), tb:'t_usuarios', name: 'estatus', valor:'0' }, function(data){
                $("#row_desactivar"+ide).html(data);
              });
        }

    });

    $('._cambiar_clave').click(function(){

        var ide = $(this).attr("id");
        $('#c_id_user').val(ide);

    });
    
</script>