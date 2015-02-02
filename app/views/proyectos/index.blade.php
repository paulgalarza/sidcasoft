@extends('layouts.master')
@section('content')

<h1 class="text-primary">Proyectos</h1>
<hr>
<div ng-controller="proyectosController as ctlr">
	<div ng-hide="formProyecto">
		<table st-table="displayedCollection" st-safe-src="proyectos" class="table table-striped">
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


	<div class="formulario" ng-show="formProyecto">
		<div class="col-md-7">
			<div class="form-group row">
				<label class="control-label col-md-4" ng-model="proyecto.nombre">Nombre del Proyecto:</label>			
				<div class="col-md-8">
					<input class="form-control" type="text">	
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4" ng-model="proyecto.titulo">Titulo del proyecto:</label>	
				<div class="col-md-8">
					<input class="form-control" type="text">	
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Descripcion:</label>	
				<div class="col-md-8">
					<textarea class="form-control" rows="4" ng-model="proyecto.descripcion"></textarea>	
					<span class="gray-color pull-right">@{{500-proyecto.descripcion.length}} Caracteres restantes</span>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Cliente:</label>	
				<div class="col-md-8">
					<input class="form-control" rows="4">	
					
				</div>

			</div>
		</div>
	</div>

</div>
@stop