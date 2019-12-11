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
            <div class="col-xl-7 pa-0">
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

                    <div class="col-xl-12"><audio id="xyz" src="<?php echo base_url(); ?>assets/atencion.mp3" preload="auto"></audio></div>
                    <div class="col-xl-12"><br></div>
                    <div class="col-xl-10"><br></div>

		                <div class="col-lg-2"><button type="submit" id="c_guardar" name="c_guardar" class="btn btn-primary"><font style="vertical-align: inherit;">Guardar</font></button></div>
                    </div>
                    <div class="col-xl-12 _alert"></div>

                </section>
            </div>
            <div class="col-xl-5" id="ticket"></div>
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

    //console.log(obj);

			$("#ticket").html("");
            var estilo ="alert alert-primary alert-dismissible fade show";
            var hora, taquilla;
            $.each( obj, function(k,v) {
	              if (v!="") {
                  if (v['id_estatus']=="5") { 
                    estilo = 'alert alert-danger alert-wth-icon alert-dismissible fade show ';
                  }
                  else {
                    estilo ="alert alert-primary alert-dismissible fade show"; 
                  }
                  if (v['nombre']) { taquilla=' ('+v['nombre']+')'; }
                  else { taquilla =""; }

                    var d = new Date();  

                    if (v['hora_atc_i']) { hora = v['hora_atc_i'];  }   
                    else { hora = d.getHours() + ':' +d.getMinutes(); }    
                    //console.log(hora);

                    var hora_inicio = hora;
                    var hora_final = d.getHours() + ':' +d.getMinutes();

                    var minutos_inicio_ = hora_inicio.split(':');
                    var minutos_final_ = hora_final.split(':');

                    var minutos_inicio = parseInt(minutos_inicio_[0]) * 60 + parseInt(minutos_inicio_[1]);
                    var minutos_final = parseInt(minutos_final_[0]) * 60 + parseInt(minutos_final_[1]);
                    
                    var diferencia = (minutos_final - minutos_inicio)*60;

                    if ((diferencia >= 60) && (v['id_estatus']==5)) {
                        //$('#xyz')[0].play();
                        //$('#xyz')[0].pause();
                    }else{
                        //
                      $("#ticket").html($("#ticket").html()+'<div class="'+estilo+'" role="alert"><h1>'+v['tiket']+taquilla+'</h1>'+v['estatus']+'<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></br>'+v['hora_recepcion']+' | '+v['nombre_completo']+'</div>');
                    }
                    
	              }
            });

        });
  }

  $('#cedula').blur(function(){
    $.post("<?php echo base_url() ?>index.php/recepcion/buscar", { id:$(this).val() }, function(data){

        var obj = jQuery.parseJSON( data );
        $('#nombres').val(obj['nombre_completo']);
        $('#correo').val(obj['correo']);
        $('#telefono').val(obj['telefono']);

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
        }
    });

  $("#frm_recepcion").submit(function () 
    {  
      if($(".form-control").val().length < 1) 
      {  
        $('._alert').html("Todos los campos son obligatorios");
        return false;  
      }

      if($("#motivos").val()== "") 
      {  
        $('._alert').html("Todos los campos son obligatorios"); 
        return false;  
      }

      if($("#servicios").val()== "") 
      {  
        $('._alert').html("Todos los campos son obligatorios");
        return false;   
      } 
    }); 
	
</script>        