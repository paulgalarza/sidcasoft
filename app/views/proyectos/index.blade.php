@extends('layouts.master')
@section('content')
<div ng-controller="proyectosController as ctlr">
	<h1 class="text-primary"><a href="#" ng-click="setForm(0)">Proyectos <i class="fa fa-arrow-circle-o-left" ng-show="formProyecto"></i></a></h1>
	<hr>
	<div>
		<div ng-hide="formProyecto" style="position: relative;" class="animate-grid">
			<table st-table="displayedCollection" st-safe-src="proyectos" class="table table-striped table-hover table-responsive">
				<thead>
				<tr>
					<th st-sort="nombre">Proyecto</th>
					<th st-sort="nombreCliente">Cliente</th>
					<th st-sort="fechaInicio">Fecha de inicio</th>
					<th st-sort="costoTotal">Costo</th>
					<th st-sort="status">Estatus</th>
					<th></th>
				</tr>
				<tr>
					<th>
						<input st-search="'nombre'" placeholder="busqueda por nombre..." class="input-sm form-control" type="search"/>
					</th>
					<th colspan="4">
						<input st-search placeholder="busqueda general..." class="input-sm form-control" type="search"/>
					</th>
					<th>
						<button type="button" class="btn btn-sm btn-success" ng-click="newProyecto()">Nuevo <i class="glyphicon glyphicon-plus"></i></button>
					</th>
				</tr>
				</thead>
				<tbody>
				<tr ng-repeat="row in displayedCollection"  ng-class="{'selected-row':isSelected(row.idProyecto)}" ng-click="setProyecto(row.idProyecto)" ng-dblclick="editProyecto(row.idProyecto)">
					<td>@{{row.nombre | uppercase}}</td>
					<td>@{{row.nombreCliente}}</td>
					<td>@{{row.fechaInicio | date}}</td>
					<td>@{{row.costoTotal | currency}}</td>
					<td>@{{getStatus(row.status)}}</td>
					<td>
						<button type="button" class="btn btn-sm btn-default" ng-click="editProyecto(row.idProyecto)"><i class="glyphicon glyphicon-pencil"></i></button>
						<button type="button" class="btn btn-sm btn-danger" ng-click="removeProyecto(row.idProyecto)"><i class="glyphicon glyphicon-remove-circle"></i></button></td>
				</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" class="text-center">
							<div st-pagination="" st-items-by-page="itemsByPage" st-displayed-pages="7"></div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>


		<form novalidate class="formulario item-animate" ng-show="formProyecto" name="proyectoForm" ng-submit="save(proyecto)">
			<div class="col-md-7">
				<div class="form-group row">
					<label class="control-label col-md-4">Nombre del Proyecto:</label>
					<div class="col-md-8">
						<input required class="form-control" type="text" maxlength="100" ng-model="proyecto.nombre" id="js-proyecto-nombre">
					</div>
				</div>
				<div class="form-group row">
					<label class="control-label col-md-4">Titulo del proyecto:</label>
					<div class="col-md-8">
						<input required class="form-control" type="text" maxlength="100" ng-model="proyecto.titulo" id="js-proyecto-titulo">
					</div>
				</div>
				<div class="form-group row">
					<label class="control-label col-md-4">Descripcion:</label>
					<div class="col-md-8">
						<textarea required class="form-control" style="resize:none; resize: vertical;" rows="4" maxlength="500" ng-model="proyecto.descripcion" id="js-proyecto-descripcion"></textarea>
						<span class="gray-color pull-right">@{{500-proyecto.descripcion.length}} Caracteres restantes</span>
					</div>
				</div>
			<!--
				<div class="form-group row">
					<label class="control-label col-md-4">Cliente:</label>
					<div class="col-md-8">
						<input required type="text" ng-model="cliente" placeholder="" typeahead="cliente as cliente.nombre for cliente in getClientes($viewValue)" typeahead-loading="loadingClientes" class="form-control">
	    				<i ng-show="loadingClientes" class="glyphicon glyphicon-refresh"></i>
					</div>
				</div>
			-->
				<div class="form-group row">
					<label class="control-label col-md-4">Cliente:</label>
					<div class="col-md-8">
						<select required class="form-control" name="nombreCliente" ng-model="proyecto.idCliente" ng-options="c.idCliente as c.nombre for c in clientes">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label class="control-label col-md-4">Empresa:</label>
					<div class="col-md-8">
						<select required class="form-control" name="nombreEmpresa" ng-model="proyecto.idEmpresa" ng-options="c.idEmpresa as c.nombre for c in empresas">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label class="control-label col-md-4">Recursos materiales:</label>
					<div class="col-md-8">
						<input type="text" ng-enter="addRecurso(recurso)" ng-model="recurso" placeholder="" typeahead="recurso for recurso in getRecurso($viewValue)" typeahead-loading="loadingLocations" class="form-control">
	    				<i ng-show="loadingLocations" class="glyphicon glyphicon-refresh"></i>
					</div>
					<div class="col-md-8 col-md-offset-4">
						<table class="table table-striped">
							<tr ng-repeat="recurso in proyecto.recursos">
								<td style="width: 71%;">@{{recurso}}</td>
								<td>
									<input class="form-control" style="margin-top: 4px; width:60px; float:left; margin-right:10px; height: 25px; padding: 2px 10px;" type="number" value="1">
									<button style="margin-top:5px;" class="btn btn-sm btn-danger" ng-click="removeRecurso(recurso)"><i class="glyphicon glyphicon-remove-circle"></i></button>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="form-group row">
					<label class="control-label col-md-4">Costo:</label>
					<div class="col-md-8">
						<input valid-number class="form-control" type="text" ng-model="proyecto.costoTotal">
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="form-group row" ng-hide="true">
					<label class="control-label col-md-4">ID Proyecto:</label>
					<div class="col-md-8">
						<input required class="form-control" type="text" ng-model="proyecto.idProyecto" disabled="disabled">
					</div>
				</div>
				<div class="form-group row">
					<label class="control-label col-md-4">Fecha Inicio:</label>
					<div class="col-md-8">
						<p class="input-group">
							<input required class="form-control" is-open="openedInicio" datepicker-options="dateOptions" ng-required="true" ng-model="proyecto.fechaInicio" datepicker-popup="@{{format}}">
							<span class="input-group-btn">
		                		<button style="height: 34px;" type="button" class="btn btn-default" ng-click="open($event,1)"><i class="glyphicon glyphicon-calendar"></i></button>
		              		</span>
		              	</p>
					</div>
				</div>
				<div class="form-group row">
					<label class="control-label col-md-4">Fecha Fin:</label>
					<div class="col-md-8">
						<p class="input-group">
							<input class="form-control" is-open="openedFin" datepicker-options="dateOptions" ng-required="false" ng-model="proyecto.fechaFin" datepicker-popup="@{{format}}">
							<span class="input-group-btn">
		                		<button style="height: 34px;" type="button" class="btn btn-default" ng-click="open($event,0)"><i class="glyphicon glyphicon-calendar"></i></button>
		              		</span>
		              	</p>
					</div>
				</div>
				<div class="form-group row">
					<label class="control-label col-md-4">Proceso:</label>
					<div class="col-md-8">
						<select required class="form-control" name="proceso_id" ng-model="proyecto.idProceso"ng-options="p.idProceso as p.nombre for p in procesos">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>
				<div class="form-group row" ng-show="SeEdita" ng-hide="SeAgrega">
					<label class="control-label col-md-4">Estatus:</label>
					<div class="col-md-8">
						<select required class="form-control" ng-model="proyecto.status" ng-options="p.status as p.descripcion for p in estatus">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>
				<div class="form-group row" ng-show="SeAgrega">
					<label class="control-label col-md-4">RAP:</label>
					<div class="col-md-8">
						<select class="form-control" name="usuarioRAP" ng-model="proyecto.usuarioRAP" ng-options="p.usuarioRAP as p.nombre for p in usuarioRAP">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>				
				<div class="form-group row" ng-show="SeAgrega">
					<label class="control-label col-md-4">RCP:</label>
					<div class="col-md-8">
						<select class="form-control" name="usuarioRCP" ng-model="proyecto.usuarioRCP" ng-options="p.usuarioRCP as p.nombre for p in usuarioRCP">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>
				<div class="form-group row" ng-show="SeAgrega">
					<label class="control-label col-md-4">Analista:</label>
					<div class="col-md-8">
						<select class="form-control" name="usuarioAnalista" ng-model="proyecto.usuarioAnalista" ng-options="p.usuarioAnalista as p.nombre for p in usuarioAnalista">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>
				<div class="form-group row" ng-show="SeAgrega">
					<label class="control-label col-md-4">Arquitecto:</label>
					<div class="col-md-8">
						<select class="form-control" name="usuarioArquitecto" ng-model="proyecto.usuarioArquitecto" ng-options="p.usuarioArquitecto as p.nombre for p in usuarioArquitecto">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>
				<div class="form-group row" ng-show="SeAgrega">
					<label class="control-label col-md-4">Desarrollador:</label>
					<div class="col-md-8">
						<select class="form-control" name="usuarioDesarrollador" ng-model="proyecto.usuarioDesarrollador" ng-options="p.usuarioDesarrollador as p.nombre for p in usuarioDesarrollador">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>
				<div class="form-group row" ng-show="SeAgrega">
					<label class="control-label col-md-4">Tester:</label>
					<div class="col-md-8">
						<select class="form-control" name="usuarioTester" ng-model="proyecto.usuarioTester" ng-options="p.usuarioTester as p.nombre for p in usuarioTester">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>
				<!-- Edición de usuarios asignados al proyecto -->
				<div class="form-group row" ng-show="SeEdita" ng-hide="SeAgrega">
					<label class="control-label col-md-4">RAP:</label>
					<div class="col-md-8">
						<select class="form-control" name="usuarioRAP2" ng-model="proyecto.usuarioRAP" ng-options="p.usuarioRAP as p.nombre for p in usuarioRAP2">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>				
				<div class="form-group row" ng-show="SeEdita" ng-hide="SeAgrega">
					<label class="control-label col-md-4">RCP:</label>
					<div class="col-md-8">
						<select class="form-control" name="usuarioRCP2" ng-model="proyecto.usuarioRCP" ng-options="p.usuarioRCP as p.nombre for p in usuarioRCP2">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>
				<div class="form-group row" ng-show="SeEdita" ng-hide="SeAgrega">
					<label class="control-label col-md-4">Analista:</label>
					<div class="col-md-8">
						<select class="form-control" name="usuarioAnalista2" ng-model="proyecto.usuarioAnalista" ng-options="p.usuarioAnalista as p.nombre for p in usuarioAnalista2">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>
				<div class="form-group row" ng-show="SeEdita" ng-hide="SeAgrega">
					<label class="control-label col-md-4">Arquitecto:</label>
					<div class="col-md-8">
						<select class="form-control" name="usuarioArquitecto2" ng-model="proyecto.usuarioArquitecto" ng-options="p.usuarioArquitecto as p.nombre for p in usuarioArquitecto2">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>
				<div class="form-group row" ng-show="SeEdita" ng-hide="SeAgrega">
					<label class="control-label col-md-4">Desarrollador:</label>
					<div class="col-md-8">
						<select class="form-control" name="usuarioDesarrollador2" ng-model="proyecto.usuarioDesarrollador" ng-options="p.usuarioDesarrollador as p.nombre for p in usuarioDesarrollador2">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>
				<div class="form-group row" ng-show="SeEdita" ng-hide="SeAgrega">
					<label class="control-label col-md-4">Tester:</label>
					<div class="col-md-8">
						<select class="form-control" name="usuarioTester2" ng-model="proyecto.usuarioTester" ng-options="p.usuarioTester as p.nombre for p in usuarioTester2">
							<option value="" disabled="disabled" style="display:none">Seleccione</option>
						</select>
					</div>
				</div>
			</div>
			<div class="col-md-12" style="border-top:1px solid #eee; padding:10px; padding-bottom: 30px;">
				<button class="btn btn-default pull-right" ng-click="setForm(0)">Cancelar</button>
				<button class="btn btn-success pull-right" ng-disabled="proyectoForm.$invalid" ng-click="addProyecto()" ng-show="SeAgrega" style="margin-right:5px;">Guardar</button>
				<button class="btn btn-success pull-right" ng-disabled="proyectoForm.$invalid" ng-click="guardaCambiosProyecto(proyecto.idProyecto)" ng-show="SeEdita" ng-hide="SeAgrega" style="margin-right:5px;">Guardar</button>
			</div>
		</form>
		
	</div>
	
</div>
@stop
