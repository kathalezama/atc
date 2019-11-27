<?php // echo "<br><br><br><br><br><br><pre>"; print_r($_ci_vars); echo "</pre>"; ?>

<div class="hk-pg-wrapper pb-0">
            <!-- Container -->
            <nav aria-label="breadcrumb">
				<ol class="breadcrumb">
				    <li class="breadcrumb-item">Configuración</li>
				    <li class="breadcrumb-item active" aria-current="page">Puntos de Atención</li>
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
                                    <b>Agregar punto de atención</b>
                                </font>
                            </button>
					     </div>
					     <div class="col-xl-12"><br></div>
						  <table id="fmapp_table_view" class="table table-hover w-100">
							<thead>
						     <tr>
							  <th>#</th>
							  <th>Punto de Atención</th>
							  <th>Servicios</th>
							  <th>Atc. Preferencial</th>
							  <th>Analista</th>
							  <th>Estatus</th>
							  <th></th>
							 </tr>
							</thead>
							<tbody>
								<?php $i=0; foreach ($_ci_vars['ptos'] as $key) { $i++; ?>
									<tr>
									  <td><?php echo $i; ?></td>
									  <td><?php echo $key['nombre']; ?></td>
									  <td><?php echo $key['servicios']; ?></td>
									  <td><?php echo $key['preferencial']; ?></td>
									  <td><?php echo $key['analista']; ?></td>
									  <td><?php echo $key['estatus']; ?></td>
									  <td>
										<div class="btn-group">
		                                   <div class="dropdown">
		                                     <a href="#" aria-expanded="false" data-toggle="dropdown" class="btn btn-link dropdown-toggle btn-icon-dropdown"><i class="icon dripicons-menu"></i><span class="caret"></span></a>
		                                     <div role="menu" class="dropdown-menu">
		                                        <a class="dropdown-item _editar" href="#" data-toggle="modal" data-target="#editar" id="<?php echo $key['id_pto']; ?>">Editar</a>
		                                        <?php if ($key['id_estatus'] == 0) { ?>
		                                        <div class="dropdown-divider"></div>
		                                            <a class="dropdown-item _bloquear" id="<?php echo $key['id_pto']; ?>">Desactivar</a>
		                                        </div>
												<?php } elseif ($key['id_estatus'] == 1) {?>
													<div class="dropdown-divider"></div>
		                                            <a class="dropdown-item _activar" id="<?php echo $key['id_pto']; ?>">Activar</a>
		                                        </div>
												<?php } ?>
		                                    </div>
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
        