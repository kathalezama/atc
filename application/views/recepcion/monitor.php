<div class="hk-pg-wrapper pb-0">
   
  <div class="container-fluid margen">
                <!-- Row -->
    <div class="row"> 

      <div class="col-lg-3" id="ticket"></div>
      <div class="col-lg-9">
        <div class="row">
          <div class="col-lg-12"><img src="<?php echo base_url(); ?>assets/ejem.jpg" width="870px" height="256px" style="margin-bottom: 14px"> </div>
            <div class="col-lg-5" id="llamados"></div>
            <div class="col-lg-7" id="llamando"></div>
          </div>
        </div>
    </div>
            
	</div>
            <!-- /Container -->
</div>
        <!-- /Main Content -->
<script type="text/javascript">
  loadTickets();
  tiketsLlamados();
	llamando();
  setInterval(loadTickets,5000);
  setInterval(tiketsLlamados,5000);
	setInterval(llamando,2000);

	function loadTickets(){
		$.post("<?php echo base_url() ?>index.php/recepcion/monitor_p", { id:4, lim:5 }, function(data){

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
                      $.post("<?php echo base_url() ?>index.php/recepcion/atendido", { id:v['id_atencion'] }, function(e){});
                    }else{
                        //
                      $("#ticket").html($("#ticket").html()+'<div class="'+estilo+'" role="alert"><h1>'+v['tiket']+taquilla+'</h1>'+v['estatus']+'</br>'+v['hora_recepcion']+' | '+v['nombre_completo']+'</div>');
                    }
                    
                }
            });
  }

    function tiketsLlamados(){
    $.post("<?php echo base_url() ?>index.php/recepcion/monitor_p", { id:8, lim:5 }, function(data){

    var obj = jQuery.parseJSON( data );
    //console.log(obj);

      $("#llamados").html("");
            var estilo ="alert alert-primary alert-dismissible fade show";
            var hora, taquilla;
            $.each( obj, function(k,v) {
                if (v!="") {
                  if (v['id_estatus']=="8") { 
                    estilo = 'alert alert-danger alert-wth-icon alert-dismissible fade show ';
                  }
                  else {
                    estilo ="alert alert-primary alert-dismissible fade show"; 
                  }
                  if (v['nombre']) { taquilla=' '+v['nombre']; }
                  else { taquilla =""; }

                    
                   $("#llamados").html($("#llamados").html()+'<div class="'+estilo+'" role="alert"><h1>'+v['tiket']+taquilla+'</h1>'+v['estatus']+'</br>'+v['hora_recepcion']+' | '+v['nombre_completo']+'</div>');

                    
                }
            });

        });
    }

    function llamando(){
    $.post("<?php echo base_url() ?>index.php/recepcion/monitor_p", { id:5, lim:2 }, function(data){

    var obj = jQuery.parseJSON( data );
    //console.log(obj);

      $("#llamando").html("");
            var estilo ="alert alert-primary alert-dismissible fade show";
            var hora, taquilla;
            $.each( obj, function(k,v) {
                if (v!="") {
                  if (v['id_estatus']=="5") { 
                    estilo = 'alert alert-success alert-wth-icon alert-dismissible fade show ';
                  }
                  else {
                    estilo ="alert alert-primary alert-dismissible fade show"; 
                  }
                  if (v['nombre']) { taquilla=' ('+v['nombre']+')'; }
                  else { taquilla =""; }
 
                   $("#llamando").html($("#llamando").html()+'<div class="'+estilo+'" role="alert"><h1>'+v['tiket']+taquilla+'</h1>'+v['estatus']+'</br>'+v['hora_recepcion']+' | '+v['nombre_completo']+'</div>');
    
                }
            });

        });
    }
	
</script>        