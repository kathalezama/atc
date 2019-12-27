<form action="<?php echo base_url(); ?>index.php/reportes/ensitio" method="post">
<div class="hk-pg-wrapper pb-0">
            <!-- Container -->
            <nav aria-label="breadcrumb">
				<ol class="breadcrumb">
				    <li class="breadcrumb-item">Reportes</li>
				    <li class="breadcrumb-item active" aria-current="page">Front Office</li>
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
					 	<h6>Generar Reporte Front Office</h6>
					 	<br>
					 	<div class="row">
					 		<div class="col-xl-6"><h6>Desde</h6></div>
					 		<div class="col-xl-6"><h6>Hasta</h6></div>
					 		<div class="col-xl-6"><input type="date" name="desde" id="desde" class="form-control"></div>
					 		<div class="col-xl-6"><input type="date" name="hasta" id="hasta" class="form-control"></div>
					 		<div class="col-xl-12"><br></div>
					 		<div class="col-xl-3"><input type="submit" class="btn btn-primary" value="Generar PDF"></div>
					 		<div class="col-xl-3"><a href="<?php echo base_url(); ?>index.php/rpt_excel/ensitio" class="btn btn-primary">Generar XLS</a></div>
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
 