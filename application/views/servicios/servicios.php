<?php //echo "<br><br><br><br><br><br>"; print_r($_ci_vars['usuarios']) ?>

<div class="hk-pg-wrapper pb-0">
            <!-- Container -->
            <nav aria-label="breadcrumb">
				<ol class="breadcrumb">
				    <li class="breadcrumb-item">Configuración</li>
				    <li class="breadcrumb-item active" aria-current="page">Servicios</li>
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
					  <div class="">
						<div class="fmapp-view-wrap">
					     <div class="fmapp-table-view">
					     <div class="col-xl-2">
					     	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add">
					     		<font style="vertical-align: inherit;">
                                    <b>Agregar Servicio</b>
                                </font>
                            </button>
					     </div>
					     <div class="col-xl-12"><br></div>
						  <table id="fmapp_table_view" class="table table-hover w-100">
							<thead>
						     <tr>
							  <th>#</th>
							  <th>Servicio</th>
							  <th>Estatus</th>
							  <th></th>
							 </tr>
							</thead>
							<tbody>
							<?php foreach ($_ci_vars['servicios'] as $servicios) { ?>
							 <tr>
							  <td><?php echo $servicios['id_servicio']; ?></td>
							  <td><?php echo $servicios['nombre']; ?></td>
							  <td id="row_desactivar<?php echo $servicios['id_servicio']; ?>"><?php echo $servicios['estatus']; ?></td>
							  <td>
								<div class="btn-group">
                                   <div class="dropdown">
                                     <a href="#" aria-expanded="false" data-toggle="dropdown" class="btn btn-link dropdown-toggle btn-icon-dropdown"><i class="icon dripicons-menu"></i><span class="caret"></span></a>
                                     <div role="menu" class="dropdown-menu">
                                        <a class="dropdown-item _editar" href="#" data-toggle="modal" data-target="#editar" id="<?php echo $servicios['id_servicio']; ?>">Editar</a>
                                        <?php if ($servicios['id_estatus'] == 0) { ?>
                                        <div class="dropdown-divider"></div>
                                            <a class="dropdown-item _bloquear" id="<?php echo $servicios['id_servicio']; ?>">Desactivar</a>
                                        </div>
										<?php } elseif ($servicios['id_estatus'] == 1) {?>
											<div class="dropdown-divider"></div>
                                            <a class="dropdown-item _activar" id="<?php echo $servicios['id_servicio']; ?>">Activar</a>
                                        </div>
										<?php } ?>
                                    </div>
  							   </td>
							 </tr>
							<?php } ?>
							</tbody>
						  </table>

						  <!-- Top Navbar -->

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
        <!-- /Main Content -->

		<?=$view_editar?>
		<?=$view_agregar?>
