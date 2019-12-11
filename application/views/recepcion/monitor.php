<div class="hk-pg-wrapper pb-0">
   
  <div class="container-fluid margen">
                <!-- Row -->
    <div class="row"> 

      <div class="col-lg-3" id="ticket"></div>
      <div class="col-lg-6">
        <div class="card bg-secondary">
           <div class="card-header d-flex justify-content-between">
             <h1 class="h-tiket">Card with badge</h1>
             <div class="d-flex">
             </div>
           </div>
            <div class="card-body">
               <p class="card-text">Some quick example text to build on the card title and k of the card's content.</p>
            </div>
        </div>
      </div>
      <div class="col-lg-3" id="llamados"></div>

    </div>
            
	</div>
            <!-- /Container -->
</div>
        <!-- /Main Content -->
<script type="text/javascript">
  loadTickets();
	tiketsLlamados();
  setInterval(loadTickets,5000);
	setInterval(tiketsLlamados,5000);

	function loadTickets(){
		$.post("<?php echo base_url() ?>index.php/recepcion/monitor_p", { id:4 }, function(data){

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

                      $("#ticket").html($("#ticket").html()+'<div class="'+estilo+'" role="alert"><h1>'+v['tiket']+taquilla+'</h1>'+v['estatus']+'</br>'+v['hora_recepcion']+' | '+v['nombre_completo']+'</div>');    
	              }
            });

        });
  }

    function tiketsLlamados(){
    $.post("<?php echo base_url() ?>index.php/recepcion/monitor_p", { id:8 }, function(data){

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
                  if (v['nombre']) { taquilla=' ('+v['nombre']+')'; }
                  else { taquilla =""; }

                    
                   $("#llamados").html($("#llamados").html()+'<div class="'+estilo+'" role="alert"><h1>'+v['tiket']+taquilla+'</h1>'+v['estatus']+'</br>'+v['hora_recepcion']+' | '+v['nombre_completo']+'</div>');

                    
                }
            });

        });
  }
	
</script>        