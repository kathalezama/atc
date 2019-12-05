<form action="<?php echo base_url(); ?>index.php/puntos/save" method="post">
<div class="modal" id="add">
   <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">


        <div class="modal-header">
            <h5 class="modal-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Agregar punto de atención</font></font></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                <span aria-hidden="true"><font style="vertical-align: inherit;">×</font></span>
            </button>
        </div>

        
        <div class="modal-body">
            <div class="row">
                <div class="col-lg-6">Nombre del punto de atc.</div>
                <div class="col-lg-6">Servicio</div>
                <div class="col-lg-6"><input type="text" name="nombre" id="nombre" class="form-control letras" required></div>
                <div class="col-lg-6">
                    <select id="servicios" name="servicios" class="form-control">
                    <option value='' >-- Seleccione</option>
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
                      <?php foreach ($_ci_vars['analista'] as $key) {
                        echo "<option value='".$key['id_user']."'>".$key['nombre_completo']."</option>";
                      } ?>
                   </select>
                </div>

                <div class="col-lg-12"><br></div>
                <div class="col-lg-12">Atención preferencial</div>
                <div class="col-lg-12"><br></div>

                <div class="col-lg-12">
                     <div class="custom-control custom-checkbox checkbox-primary">
                        <input type="checkbox" class="custom-control-input" id="preferencial" name="preferencial" value="1">
                        <label class="custom-control-label" for="preferencial">Discapacidad | Adulto Mayor | Mujer Embarazada</label>
                     </div>                   
                </div>

                <div class="col-lg-12">
                     <div class="custom-control custom-checkbox checkbox-primary">
                        <input type="checkbox" class="custom-control-input" id="especial" name="especial" value="1">
                        <label class="custom-control-label" for="especial">Cliente Especial</label>
                     </div>                   
                </div>


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

<script type="text/javascript">

    $('.letras').on('input', function () { 
        this.value = this.value.replace(/[^a-zA-Z ]+$/,'');
    });

    $('._bloquear').click(function(){

        var confirmacion = confirm("Realmente desea desactivar este punto de atención");
        var ide = $(this).attr("id");


        if (confirmacion==true) {
            $.post("<?php echo base_url() ?>index.php/puntos/bloquear", { id:$(this).attr("id"), tb:'t_ptos_atc', name: 'estatus', valor:'1' }, function(data){

                $("#row_desactivar"+ide).html(data);
            });
        }
    });

    $('._activar').click(function(){

        var confirmacion = confirm("Realmente desea activar este punto de atención");
        var ide = $(this).attr("id");


        if (confirmacion==true) {
            $.post("<?php echo base_url() ?>index.php/puntos/bloquear", { id:$(this).attr("id"), tb:'t_ptos_atc', name: 'estatus', valor:'0' }, function(data){
                $("#row_desactivar"+ide).html(data);
              });
        }

    });

    $('._editar').click(function(){

        var ide = $(this).attr("id");
        $('#e_id').val(ide);

        $.post("<?php echo base_url() ?>index.php/puntos/buscar", { id:$(this).attr("id")}, function(data){

            console.log(data);
            var datos = data.split('|');
            $("#nombre").val(datos[1]);
            $('#servicios option[value="'+datos[5]+'"]').prop('selected', true);
            $('#estatus option[value="'+datos[3]+'"]').prop('selected', true);
            $('#analista option[value="'+datos[4]+'"]').prop('selected', true);

            var pref = datos[6].split(':');

            $.each( pref, function( k, v ) {
              if (v!="") {
                $("#"+v).prop("checked", true);
              }
            });

        });

    });
    
</script>

