<!-- <br><br><br><br><br> -->
<?php //print_r($this->session->userdata); ?>

<form action="<?php echo base_url(); ?>index.php/atencion/save" method="post" id="frm_recepcion">

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
              <input type="hidden" name="id_atencion" id="id_atencion">
               	<section class="hk-sec-wrapper">
                  	<h5 class="hk-sec-title">Atención al Cliente</h5>
                    <div class="row">
                      <div class="col-xl-6">Cedula:</div>
                      <div class="col-xl-6">Apellidos y Nombres:</div>

                    	<div class="col-xl-6"><input type="text" class="form-control numero" id="cedula" name="cedula" maxlength="8" readonly=""></div>
                    	<div class="col-xl-6"><input type="text" class="form-control letras" id="nombres" name="nombres" readonly=""></div>

                    	<div class="col-xl-6">Telefono:</div>
                      <div class="col-xl-6">Correo:</div>

                    	<div class="col-xl-6"><input type="text" class="form-control numero" id="telefono" name="telefono" readonly=""></div>
                    	<div class="col-xl-6"><input type="text" class="form-control mail" id="correo" name="correo" readonly=""></div>

                      <div class="col-xl-6">Motivo:</div>
                      <div class="col-xl-6">Servicio:</div>

                      <div class="col-xl-6"><input type="text" class="form-control numero" id="motivo" name="motivo" readonly=""></div>
                      <div class="col-xl-6"><input type="text" class="form-control mail" id="servicio" name="servicio" readonly=""></div>

                      <div class="col-xl-12">Observaciones</div>
                      <div class="col-xl-12"><textarea class="form-control" name="obs" id="obs"></textarea></div>
                      <div class="col-xl-12"><br></div>

                      <div class="col-lg-2"><button type="submit" id="save" name="save" class="btn btn-primary" value="6"><font style="vertical-align: inherit;">Atendido</font></button></div>
                      <div class="col-lg-2"><button type="submit" class="btn btn-primary" id="save" name="save" value="7"><font style="vertical-align: inherit;">No atendido</font></button></div>
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
      $.post("<?php echo base_url() ?>index.php/atencion/buscar", { id:0 }, function(data){

        if (data==0) {

          alert("No hay tikets pendientes para este servicio");

        }else{

          var obj = jQuery.parseJSON( data );
          console.log(obj);
          $('#nombres').val(obj['nombre_completo']);
          $('#correo').val(obj['correo']);
          $('#telefono').val(obj['telefono']);
          $('#cedula').val(obj['cedula']);
          $('#servicio').val(obj['nombre']);
          $('#motivo').val(obj['motivo']);
          $('#id_atencion').val(obj['id_atencion']);
          iniciar();

        }

    });

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