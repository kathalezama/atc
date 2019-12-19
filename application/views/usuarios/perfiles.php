<div class="hk-pg-wrapper pb-0">
            <!-- Container -->
            <nav aria-label="breadcrumb">
				<ol class="breadcrumb">
				    <li class="breadcrumb-item">Usuarios</li>
				    <li class="breadcrumb-item active" aria-current="page">Perfiles</li>
				</ol>
			</nav>
            <div class="container-fluid margen">
                <!-- Row -->

                <div class="row">
                 <div class="col-xl-12 pa-0">
                  <div class="fmapp-wrap">                       
                   <div class="fm-box">
					<div class="fmapp-main fmapp-view-switch">
					 <div class="fm-body">
					 	<div class="row">
					 		<div class="col-lg-4">
					 			<?php foreach ($_ci_vars['perfiles'] as $key) { 
					 				if($key['id_padre']==0){ ?>
					 				<div class="custom-control custom-checkbox">
	                                  <input class="custom-control-input" id="same-address" name="menu[]" type="checkbox" >
	                                  <label class="custom-control-label" for="same-address"><b><?php echo $key['item']?></b></label>
	                                </div>
					 			<?php if ($key['hijos']=='1') { foreach ($_ci_vars['perfiles'] as $v) { if ($key['id_menu']==$v['id_padre']) {?>
					 				<div class="custom-control custom-checkbox espacio">
	                                  <input class="custom-control-input" id="same-address" name="menu[]" type="checkbox">
	                                  <label class="custom-control-label" for="same-address"><b><?php echo $v['item']?></b></label>
	                                </div>
					 			<?php }}}}}?>
					 		</div>
					 	</div>
					 </div>
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
<br><br><br><br><br>
        