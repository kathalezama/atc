<form action="<?php echo base_url(); ?>index.php/atencion_/save" method="post" id="frm_recepcion">

<div class="hk-pg-wrapper pb-0">
            <!-- Container -->
            <nav aria-label="breadcrumb">
				<ol class="breadcrumb">
				    <li class="breadcrumb-item">Otros canales de atención</li>
				    <li class="breadcrumb-item active" aria-current="page"></li>
				</ol>
			</nav>
    <div class="container-fluid margen">
                <!-- Row -->

        <div class="row">
            <div class="col-xl-7 pa-0">
              <table>
                <tr>
                  <td style="padding-right: 25px">
                    <button type="button" class="btn btn-success" id="cronometro">00:00:00</button>
                  </td>
                  <td>
                    <button class="btn btn-icon btn-success btn-icon-style-1" id="iniciar" type="button"><span class="btn-icon-wrap"><i class="fa fa-play"></i></span></button>
                  </td>
                  <td style="padding-left: 5px">Iniciar</td>    
                </tr>
              </table>
              <br>
               	<section class="hk-sec-wrapper">
                  	<h5 class="hk-sec-title">Atención Telefonica</h5>
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

                        <div class="col-xl-12">Canal de atención:</div>
                        <div class="col-lg-6">
                        <select id="canales" name="canales" class="form-control">
                        <option value='' >-- Seleccione</option>
                          <?php foreach ($_ci_vars['canales'] as $key) {
                            echo "<option value='".$key['id_canal']."'>".$key['canal']."</option>";
                          } ?>
                        </select>
                        </div>


                   	<div class="col-xl-12"><br></div>

                    <div class="col-xl-12">Observaciones</div>
                    <div class="col-xl-12"><textarea class="form-control" name="obs" id="obs"></textarea></div>
                    <div class="col-xl-12"><br></div>

                    <input type="hidden" name="hora" id="hora">

                    <div class="col-xl-12"><br></div>

		                <div class="col-lg-2"><button type="submit" id="save" name="save" class="btn btn-primary save" value="6"><font style="vertical-align: inherit;">Atendido</font></button></div>
                    <div class="col-lg-2"><button type="submit" class="btn btn-primary save" id="save" name="save" value="7"><font style="vertical-align: inherit;">No atendido</font></button></div>
                    <div class="col-xl-7"><br></div>
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

  $('#cedula').prop('disabled', true);
  $('#nombres').prop('disabled', true);
  $('#correo').prop('disabled', true);
  $('#telefono').prop('disabled', true);
  $('#servicios').prop('disabled', true);
  $('#motivos').prop('disabled', true);
  $('#canales').prop('disabled', true);
  $('#obs').prop('disabled', true);
  $('.save').prop('disabled', true);

  var inicioConteo, idTimeout, cronometro = document.querySelector('#cronometro'), botonReiniciar = document.querySelector('#botonReiniciar');

  $("#iniciar").click(function(){

    $('#cedula').prop('disabled', false);
    $('#nombres').prop('disabled', false);
    $('#correo').prop('disabled', false);
    $('#canales').prop('disabled', false);
    $('#telefono').prop('disabled', false);
    $('#servicios').prop('disabled', false);
    $('#motivos').prop('disabled', false);
    $('#obs').prop('disabled', false);
    $('.save').prop('disabled', false);
    var d = new Date();
    var h = d.getHours() + ':' +d.getMinutes();
    $("#hora").val(h);
    iniciar();

  });

	function zeroIzq(n){
        return n.toString().replace(/^(\d)$/,'0$1');
    }

    function formatoSegundos(s){
        return zeroIzq(Math.floor(s / 3600))+':'+zeroIzq(Math.floor(s%3600 / 60))+':'+zeroIzq(Math.floor((s%3600)%60));
    }

    function actualizar(){
        var dif = Date.now() - inicioConteo;
        dif = Math.round(dif / 1000);
        cronometro.innerHTML = formatoSegundos(dif);
        idTimeout = setTimeout(actualizar,1000);
    }

    function iniciar(){
        clearTimeout(idTimeout);
        inicioConteo = Date.now();
        actualizar();
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