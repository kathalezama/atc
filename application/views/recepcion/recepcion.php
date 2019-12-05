<form action="<?php echo base_url(); ?>index.php/recepcion/save" method="post" id="frm_recepcion">

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

                    	<div class="col-xl-6"><input type="text" class="form-control numero" id="cedula" name="cedula" maxlength="8"></div>
                    	<div class="col-xl-6"><input type="text" class="form-control letras" id="nombres" name="nombres"></div>

                    	<div class="col-xl-6">Telefono:</div>
                       	<div class="col-xl-6">Correo:</div>

                    	<div class="col-xl-6"><input type="text" class="form-control numero" id="telefono" name="telefono" maxlength="11"></div>
                    	<div class="col-xl-6"><input type="text" class="form-control mail" id="correo" name="correo"></div>

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
            <div class="col-xl-4" id="ticket"></div>
        </div>
                <!-- /Row -->

	</div>
            <!-- /Container -->
</div>
</form>
        <!-- /Main Content -->
<script type="text/javascript">
	loadTickets();
	setInterval(loadTickets,5000);

	function loadTickets(){
		$.post("<?php echo base_url() ?>index.php/recepcion/ticket", { id:0 }, function(data){

            var obj = jQuery.parseJSON( data );

            console.log(obj);
			$("#ticket").html("");
            $.each( obj, function(k,v) {
	            //console.log(k+' '+v['estatus']);
	              if (v!="") {
	                $("#ticket").html($("#ticket").html()+'<div class="alert alert-primary alert-dismissible fade show" role="alert"><h1>'+v['tiket']+'</h1>'+v['estatus']+'<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></br>'+v['hora_recepcion']+' | '+v['nombre_completo']+'</div>');
	              }
            });

        });
	
  $('.numero').on('input', function () 
    { 
        this.value = this.value.replace(/[^0-9]/g,'');
    });
  
  $('.letras').on('input', function () 
    { 
        this.value = this.value.replace(/[^a-zA-Z ]+$/,'');
    });
  
  $('.mail').blur('input', function () { 
        if($(".mail").val().indexOf('@', 0) == -1 || $(".mail").val().indexOf('.', 0) == -1) {
            alert('El correo electrónico introducido no es correcto.');
            //$('.mail').val("");
            //return false;
        }
    });

  $("#frm_recepcion").submit(function () 
    {  
      if($(".form-control").val().length < 1) 
      {  
        alert("Todos los campos son obligatorios");  
      }

      if($("#motivos").val()== "") 
      {  
        alert("Todos los campos son obligatorios");  
      }

      if($("#servicios").val()== "") 
      {  
        alert("Todos los campos son obligatorios");  
      } 
        return false;  
    }); 
  }

	
</script>        