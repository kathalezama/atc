<form action="<?php echo base_url(); ?>index.php/usuarios/cambiar_clave" method="post">
<div class="modal" id="cambiarPass">
   <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">


        <div class="modal-header">
            <h5 class="modal-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Cambiar clave</font></font></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                <span aria-hidden="true"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">×</font></font></span>
            </button>
        </div>

        
        <div class="modal-body">
            <div class="row">
                <div class="col-lg-6">Clave</div>
                <div class="col-lg-6">Confirmar Clave</div>
                
                <div class="col-lg-6"><input type="password" name="c_clave" id="c_clave" class="form-control"></div>
                <div class="col-lg-6"><input type="password" name="c_rclave" id="c_rclave" class="form-control"></div>

            </div>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Cerrar</font></font></button>
            <button type="submit" id="guardar" name="guardar" class="btn btn-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Guardar</font></font></button>
        </div>
    </div>
</div>
</form>

