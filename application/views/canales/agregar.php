<form action="<?php echo base_url(); ?>index.php/canales/save" method="post">
<div class="modal" id="add">
   <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">


        <div class="modal-header">
            <h5 class="modal-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Agregar canal de atención</font></font></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                <span aria-hidden="true"><font style="vertical-align: inherit;">×</font></span>
            </button>
        </div>

        
        <div class="modal-body">
            <div class="row">
                <div class="col-lg-12">Canal de atención</div>
                <div class="col-lg-6"><input type="text" name="canal" id="canal" class="form-control letras" required></div>

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

        var confirmacion = confirm("Realmente desea desactivar este canal");
        var ide = $(this).attr("id");


        if (confirmacion==true) {
            $.post("<?php echo base_url() ?>index.php/canales/bloquear", { id:$(this).attr("id"), tb:'t_canales', name: 'estatus', valor:'1' }, function(data){
                $("#row_desactivar"+ide).html(data);
            });
        }
    });

    $('._activar').click(function(){

        var confirmacion = confirm("Realmente desea activar este canal");
        var ide = $(this).attr("id");


        if (confirmacion==true) {
            $.post("<?php echo base_url() ?>index.php/canales/bloquear", { id:$(this).attr("id"), tb:'t_canales', name: 'estatus', valor:'0' }, function(data){
                $("#row_desactivar"+ide).html(data);
              });
        }

    });

    $('._editar').click(function(){

        var ide = $(this).attr("id");
        $('#e_id').val(ide);

        $.post("<?php echo base_url() ?>index.php/canales/buscar", { id:$(this).attr("id")}, function(data){

            $('#e_canal').val(data);

        });

    });
    
</script>

