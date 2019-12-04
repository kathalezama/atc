<?php //echo "<br><br><br><br><br><br>"; print_r($_ci_vars['usuarios']) ?>

<div class="hk-pg-wrapper pb-0">
            <!-- Container -->
            <nav aria-label="breadcrumb">
				<ol class="breadcrumb">
				    <li class="breadcrumb-item">Usuarios</li>
				    <li class="breadcrumb-item active" aria-current="page">Usuarios</li>
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
					     	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLarge01">
					     		<font style="vertical-align: inherit;">
                                    <b>Agregar Usuario</b>
                                </font>
                            </button>
					     </div>
					     <div class="col-xl-12"><br></div>
						  <table id="fmapp_table_view" class="table table-hover w-100">
							<thead>
						     <tr>
							  <th>Apellidos y Nombres</th>
							  <th>Correo</th>
							  <th>Telefono</th>
							  <th>Usuario</th>
							  <th>Rol</th>
							  <th>Estatus</th>
							  <th></th>
							 </tr>
							</thead>
							<tbody>
							<?php foreach ($_ci_vars['usuarios'] as $usuarios) { ?>
							 <tr>
							  <td><?php echo $usuarios['nombre_completo']; ?></td>
							  <td><?php echo $usuarios['correo']; ?></td>
							  <td><?php echo $usuarios['telefono']; ?></td>
							  <td><?php echo $usuarios['username']; ?></td>
							  <td><?php echo $usuarios['rol']; ?></td>
							  <td id="row_desactivar<?php echo $usuarios['id_user']; ?>"><?php echo $usuarios['estatus']; ?></td>
							  <td>
								<div class="btn-group">
                                   <div class="dropdown">
                                     <a href="#" aria-expanded="false" data-toggle="dropdown" class="btn btn-link dropdown-toggle btn-icon-dropdown"><i class="icon dripicons-menu"></i><span class="caret"></span></a>
                                     <div role="menu" class="dropdown-menu">
                                        <a class="dropdown-item _editar" href="#" data-toggle="modal" data-target="#editaUser" id="<?php echo $usuarios['id_user']; ?>">Editar</a>
                                        <a class="dropdown-item _cambiar_clave" href="#" data-toggle="modal" data-target="#cambiarPass" id="<?php echo $usuarios['id_user']; ?>">Cambiar clave</a>
                                        <?php if ($usuarios['id_estatus'] == 0) { ?>
                                        <div class="dropdown-divider"></div>
                                            <a class="dropdown-item _bloquear" id="<?php echo $usuarios['id_user']; ?>">Bloquear</a>
                                        </div>
										<?php } elseif ($usuarios['id_estatus'] == 2) {?>
											<div class="dropdown-divider"></div>
                                            <a class="dropdown-item _activar" id="<?php echo $usuarios['id_user']; ?>">Activar</a>
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
	<?=$view_cambiar_clave?>
	<?=$view_editar?>
	<?=$view_nuevo_usuario?>
        