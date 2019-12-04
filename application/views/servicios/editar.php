<form action="<?php echo base_url(); ?>index.php/servicios/editar" method="post">
<div class="modal" id="editar">
   <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">


        <div class="modal-header">
            <h5 class="modal-title"><font style="vertical-align: inherit;">Editar servicio</font></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                <span aria-hidden="true"><font style="vertical-align: inherit;">×</font></span>
            </button>
        </div>

        
        <div class="modal-body">
            <div class="row">
                <div class="col-lg-12">Servicio</div>
                <div class="col-lg-6"><input type="text" name="e_servicio" id="e_servicio" class="form-control"></div>
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

