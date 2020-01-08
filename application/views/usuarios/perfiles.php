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
					 	<form action="<?php echo base_url(); ?>index.php/usuarios/save_perfiles" method="post">
					 	<div class="row">
					 		<div class="col-lg-4">
					 			<h6>Perfil:</h6>
					 			<input type="text" name="perfil" id="perfil" class="form-control">
					 			<br>
					 			<?php foreach ($_ci_vars['perfiles'] as $key) { 
					 				if($key['id_padre']==0){ ?>
					 				<div class="checkbox">
			                        <label>
			                          <input type="checkbox" class="padre" name="opciones[]" id="<?php echo $key['id_menu'] ?>" value="<?php echo $key['id_menu'] ?>">
			                            <?= $key['item'] ?>
			                        </label>
			                      </div>
					 			<?php if ($key['hijos']=='1') { foreach ($_ci_vars['perfiles'] as $v) { if ($key['id_menu']==$v['id_padre']) {?>
					 				<div class="checkbox espacio">
					 				<label>
			                          <input type="checkbox" class="hijos <?= $v['id_padre'] ?>" name="opciones[]" id="<?php echo $v['id_menu'] ?>" value="<?php echo $v['id_menu'] ?>">
			                            <?= $v['item'] ?>
			                        </label>
			                    	</div>
					 			<?php }}}}}?>
					 			<br>
					 			<button class="btn btn-primary" type="submit">Guardar</button>
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
										<?php foreach ($_ci_vars['roles'] as $key) { ?>
										<tr>
										<td><?php echo $key['rol'] ?></td>
										<td>
											<div class="btn-group">
			                                   <div class="dropdown">
			                                     <a href="#" aria-expanded="false" data-toggle="dropdown" class="btn btn-link dropdown-toggle btn-icon-dropdown"><i class="icon dripicons-menu"></i><span class="caret"></span></a>
			                                     <div role="menu" class="dropdown-menu">
			                                        <a class="dropdown-item _editar" href="#" data-toggle="modal" data-target="#opciones" id="<?php echo $key['id_rol'];?>">Editar</a>
			                                    </div>
										</td>
										</tr>
										<?php } ?>

									</tbody>
								</table>
					 		</div>
					 	</div>
					 </form>
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


<form action="<?php echo base_url(); ?>index.php/usuarios/editar_p" method="post">
<div class="modal" id="opciones">
   <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">


        <div class="modal-header">
            <h5 class="modal-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Opciones</font></font></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                <span aria-hidden="true"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">×</font></font></span>
            </button>
        </div>

        
        <div class="modal-body">
            <div class="row">
                <?php foreach ($_ci_vars['perfiles'] as $key) { 
				if($key['id_padre']==0){ ?>
				<div class="col-lg-12">
					<div class="checkbox">
			         <label>
			            <input type="checkbox" class="e_padre" name="opciones[]" id="e_<?php echo $key['id_menu'] ?>" value="<?php echo $key['id_menu'] ?>">
			              <?= $key['item'] ?>
			            </label>
			        </div>
			    </div>
				<?php if ($key['hijos']=='1') { foreach ($_ci_vars['perfiles'] as $v) { if ($key['id_menu']==$v['id_padre']) {?>
				<div class="col-lg-12">
					<div class="checkbox espacio">
					 	<label>
			              <input type="checkbox" class="e_hijos <?= $v['id_padre'] ?>" name="opciones[]" id="e_<?php echo $v['id_menu'] ?>" value="<?php echo $v['id_menu'] ?>">
			                   <?= $v['item'] ?>
			            </label>
			        </div>
			    </div>
				<?php }}}}}?>
            </div>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Cerrar</font></font></button>
            <button type="button" id="c_guardar" name="c_guardar" class="btn btn-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Guardar</font></font></button>
        </div>
    </div>
    
</div>
</div>
</form>     
<script type="text/javascript">

	$("._editar").click(function(){
		$(".e_padre").prop("checked", false);
		$(".e_hijos").prop("checked", false);
		$.post("<?php echo base_url() ?>index.php/usuarios/buscar_p", { id:$(this).attr("id")}, function(data){
			 data=$.parseJSON(data);
             console.log(data);
             $.each(data, function( i, v ) {
             	console.log(v['id_menu']);
             	$("#e_"+v['id_menu']).prop("checked", true);
			 });
        });
	})

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