<div class="hk-pg-wrapper pb-0">
  <div class="container-fluid margen">
        <div class="row">
          <div class="col-lg-12">
              <img class="mySlides" src="<?php echo base_url(); ?>assets/slide1.jpg" style="width:100%">
              <img class="mySlides" src="<?php echo base_url(); ?>assets/slide2.jpg" style="width:100%">
          </div>
          <div class="col-lg-4" id="ticket"></div>
          <div class="col-lg-4" id="llamando"></div>
          <div class="col-lg-4" id="llamados"></div>
        </div>
            
  </div>
</div>
        <!-- /Main Content -->
<script type="text/javascript">
  loadTickets();
  tiketsLlamados();
  llamando();
  setInterval(loadTickets,5000);
  setInterval(tiketsLlamados,5000);
  setInterval(llamando,5000);

  var myIndex = 0;
  carousel();

  function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
     x[myIndex-1].style.display = "block";  
     setTimeout(carousel, 8000); // Change image every 2 seconds
  }

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
                    //console.log(diferencia);

                    if ((diferencia >= 60) && (v['id_estatus']==5)) {
                      $.post("<?php echo base_url() ?>index.php/recepcion/atendido", { id:v['id_atencion'] }, function(e){});
                    }else {
                      //console.log("ahora por aqui");
                      $("#ticket").html($("#ticket").html()+'<div class="'+estilo+'" role="alert"><h1>'+v['tiket']+taquilla+'</h1>'+v['estatus']+'</br>'+v['hora_recepcion']+' | '+v['nombre_completo']+'</div>');
                    }
                    
                }
            });
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
                      console.log(v['id_atencion']);
                    }else{
                      $("#llamando").html($("#llamando").html()+'<div class="'+estilo+'" role="alert"><h1>'+v['tiket']+taquilla+'</h1>'+v['estatus']+'</br>'+v['hora_recepcion']+' | '+v['nombre_completo']+'</div>');
                    }
    
                }
            });

        });
    }
  
</script>        