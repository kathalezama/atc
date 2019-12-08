<form action="<?php echo base_url(); ?>index.php/recepcion/save" method="post" id="frm_recepcion">

<div class="hk-pg-wrapper pb-0">
            <!-- Container -->
            <nav aria-label="breadcrumb">
				<ol class="breadcrumb">
				    <li class="breadcrumb-item">Atención al cliente</li>
				    <li class="breadcrumb-item active" aria-current="page"></li>
				</ol>
			</nav>
    <div class="container-fluid margen">
                <!-- Row -->

        <div class="row">
            <div class="col-xl-7 pa-0">

               	<section class="hk-sec-wrapper">
                  	<h5 class="hk-sec-title">Atención al Cliente</h5>
                    <div class="row">
                      <div class="col-xl-6">Cedula:</div>
                      <div class="col-xl-6">Apellidos y Nombres:</div>

                    	<div class="col-xl-6"><input type="text" class="form-control numero" id="cedula" name="cedula" maxlength="8"></div>
                    	<div class="col-xl-6"><input type="text" class="form-control letras" id="nombres" name="nombres"></div>

                    	<div class="col-xl-6">Telefono:</div>
                      <div class="col-xl-6">Correo:</div>

                    	<div class="col-xl-6"><input type="text" class="form-control numero" id="telefono" name="telefono" maxlength="11"></div>
                    	<div class="col-xl-6"><input type="text" class="form-control mail" id="correo" name="correo"></div>

                      <div class="col-xl-6">Motivo:</div>
                      <div class="col-xl-6">Servicio:</div>

                      <div class="col-xl-6"><input type="text" class="form-control numero" id="motivo" name="motivo"></div>
                      <div class="col-xl-6"><input type="text" class="form-control mail" id="servicio" name="servicio"></div>

                      <div class="col-xl-12">Observaciones</div>
                      <div class="col-xl-12"><textarea class="form-control"></textarea></div>
                      <div class="col-xl-12"><br></div>

                      <div class="col-lg-2"><button type="submit" id="c_guardar" name="c_guardar" class="btn btn-primary"><font style="vertical-align: inherit;">Atendido</font></button></div>
                      <div class="col-lg-2"><button type="submit" id="c_guardar" name="c_guardar" class="btn btn-primary"><font style="vertical-align: inherit;">No atendido</font></button></div>
                      <div class="col-xl-7"><br></div>

                      <div class="col-xl-12 _alert"></div>

                    </div>

                </section>
            </div>
            <div class="col-xl-5">
              <table>
                <tr>
                  <td style="padding-right: 25px">
                    <button type="button" class="btn btn-success" id="cronometro">00:00:00</button>
                  </td>
                  <td>
                    <button class="btn btn-icon btn-success btn-icon-style-1" id="iniciar" type="button"><span class="btn-icon-wrap"><i class="fa fa-play"></i></span></button>
                  </td>
                  <td style="padding-left: 5px">Siguiente en espera</td>    
                </tr>
              </table>
            </div>
        </div>
                <!-- /Row -->

	</div>
            <!-- /Container -->
</div>
</form>
        <!-- /Main Content -->
<script type="text/javascript">

    var inicioConteo, idTimeout, cronometro = document.querySelector('#cronometro'), botonReiniciar = document.querySelector('#botonReiniciar');

    $("#iniciar").click(function(){
      $.post("<?php echo base_url() ?>index.php/atencion/buscar", { }, function(data){

        var obj = jQuery.parseJSON( data );
        $('#nombres').val(obj['nombre_completo']);
        $('#correo').val(obj['correo']);
        $('#telefono').val(obj['telefono']);

    });

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
  </script>        