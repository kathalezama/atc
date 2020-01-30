<form action="<?php echo base_url(); ?>index.php/reportes/analistas" method="post" target="_blank">
<div class="hk-pg-wrapper pb-0">
            <!-- Container -->
            <nav aria-label="breadcrumb">
				<ol class="breadcrumb">
				    <li class="breadcrumb-item">Reportes</li>
				    <li class="breadcrumb-item active" aria-current="page">Por Analista</li>
				</ol>
			</nav>
            <div class="container-fluid margen">
                <!-- Row -->

                <div class="row">
                 <div class="col-xl-3 pa-0"></div>
                 <div class="col-xl-6 pa-0">
                  <div class="fmapp-wrap">                       
                   <div class="fm-box">
					<div class="fmapp-main fmapp-view-switch">
					 <div class="jumbotron">
					 	<h6>Generar Reporte Por Analista</h6>
					 	<br>
					 	<div class="row">
					 		<div class="col-xl-6"><h6>Desde</h6></div>
					 		<div class="col-xl-6"><h6>Hasta</h6></div>
					 		<div class="col-xl-6"><input type="date" name="desde" id="desde" class="form-control" required="" ></div>
					 		<div class="col-xl-6"><input type="date" name="hasta" id="hasta" class="form-control" required="" ></div>
                            <div class="col-xl-12"><h6>Analista</h6></div>
                            <div class="col-lg-12">
                                <select id="analista" name="analista" class="form-control">
                                <option value='' >-- Seleccione</option>
                                  <?php foreach ($_ci_vars['analista'] as $key) {
                                    echo "<option value='".$key['id_user']."'>".$key['nombre_completo']."</option>";
                                  } ?>
                               </select>
                            </div>

                            <div class="col-xl-12"><br></div>
                            <div class="col-xl-3"><input type="submit" class="btn btn-primary" value="Generar PDF" id="pdf"></div>
                            <div class="col-xl-3"><input type="submit" class="btn btn-primary" value="Generar XLS" id="excel"></div>
					 	</div>
	   				 </div>
					</div>
                   </div>
				  </div>
                 </div>
                </div>
                <!-- /Row -->

            </div>
            <!-- /Container -->
</div>
</form>
 <input type="hidden" name="ruta_e" id="ruta_e" value="<?php echo base_url().'index.php/rpt_excel/analistas';?>">
<input type="hidden" name="ruta_p" id="ruta_p" value="<?php echo base_url().'index.php/reportes/analistas';?>">

 
 <script type="text/javascript">

    $("#excel").click(function(){
     // alert("aqui");
        $('form').attr("action", $("#ruta_e").val());
        $('form').attr("target", '_blanck');
    });

    $("#pdf").click(function(){
     // alert("aqui");
        $('form').attr("action", $("#ruta_p").val());
        $('form').attr("target", '_blanck');
    });

</script>