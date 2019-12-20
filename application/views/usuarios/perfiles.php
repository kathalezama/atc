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
					 			<h6>Perfil:</h6>
					 			<input type="text" name="perfil" id="perfil" class="form-control">
					 			<br>
					 			<?php foreach ($_ci_vars['perfiles'] as $key) { 
					 				if($key['id_padre']==0){ ?>
					 				<div class="checkbox">
			                        <label>
			                          <input type="checkbox" class="padre" name="opciones[]" id="<?= $key['id_menu'] ?>">
			                            <?= $key['item'] ?>
			                        </label>
			                      </div>
					 			<?php if ($key['hijos']=='1') { foreach ($_ci_vars['perfiles'] as $v) { if ($key['id_menu']==$v['id_padre']) {?>
					 				<div class="checkbox espacio">
					 				<label>
			                          <input type="checkbox" class="hijos <?= $v['id_padre'] ?>" name="opciones[]" id="<?= $v['id_menu'] ?>">
			                            <?= $v['item'] ?>
			                        </label>
			                    	</div>
					 			<?php }}}}}?>
					 		</div>
					 		<div class="col-lg-8">
					 			<table id="fmapp_table_view" class="table table-hover w-100">
									<thead>
								     <tr>
									  <th>Perfil</th>
									  <th></th>
									 </tr>
									</thead>
									<tbody>
										<td>Administrador</td>
										<td>
											<div class="btn-group">
			                                   <div class="dropdown">
			                                     <a href="#" aria-expanded="false" data-toggle="dropdown" class="btn btn-link dropdown-toggle btn-icon-dropdown"><i class="icon dripicons-menu"></i><span class="caret"></span></a>
			                                     <div role="menu" class="dropdown-menu">
			                                        <a class="dropdown-item _editar" href="#" data-toggle="modal" data-target="#editar" id="<?php echo $canales['id_canal']; ?>">Editar</a>
			                                        <?php if ($canales['id_estatus'] == 0) { ?>
			                                        <div class="dropdown-divider"></div>
			                                            <a class="dropdown-item _bloquear" id="<?php echo $canales['id_canal']; ?>">Desactivar</a>
			                                        </div>
													<?php } elseif ($canales['id_estatus'] == 1) {?>
														<div class="dropdown-divider"></div>
			                                            <a class="dropdown-item _activar" id="<?php echo $canales['id_canal']; ?>">Activar</a>
			                                        </div>
													<?php } ?>
			                                    </div>
			                               	</div>
										</td>
									</tbody>
								</table>
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
<script type="text/javascript">

	$(".padre").click(function() {
      	var id=$(this).attr("id");
        if ($(this).prop("checked")) {
        	$("."+id).prop("checked", true);
        }else{
        	$("."+id).prop("checked", false);
        }
    });

    $(".hijos").click(function() {
        var id=$(this).attr("class");
        id = id.split(" ");
        if ($(this).prop("checked")) {
        	$("#"+id[1]).prop("checked", true);
        }

        
     });

</script>   