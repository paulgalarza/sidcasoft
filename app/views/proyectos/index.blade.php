@extends('layouts.master')
@section('content')
<div ng-controller="proyectosController as ctlr">
<h1 class="text-primary"><a href="#" ng-click="formProyecto = 0">Proyectos <i class="fa fa-arrow-circle-o-left" ng-show="formProyecto"></i></a></h1>
<hr>
<div>
	<div ng-hide="formProyecto" style="position: relative;" class="animate-grid">
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


	<div class="formulario item-animate" ng-show="formProyecto" >
		<div class="col-md-7">
			<div class="form-group row">
				<label class="control-label col-md-4">Nombre del Proyecto:</label>			
				<div class="col-md-8">
					<input class="form-control" type="text" ng-model="proyecto.nombre">	
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Titulo del proyecto:</label>	
				<div class="col-md-8">
					<input class="form-control" type="text" ng-model="proyecto.titulo">	
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
					<input type="text" ng-model="cliente" placeholder="" typeahead="address for address in getClientes($viewValue)" typeahead-loading="loadingLocations" class="form-control">
    				<i ng-show="loadingLocations" class="glyphicon glyphicon-refresh"></i>	
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Costo:</label>	
				<div class="col-md-8">
					<input class="form-control" type="number" ng-model="proyecto.costoTotal">	
				</div>
			</div>
		</div>
		<div class="col-md-5">
			<div class="form-group row">
				<label class="control-label col-md-4">ID Proyecto:</label>	
				<div class="col-md-8">
					<input class="form-control" type="text" ng-model="proyecto.idProyecto" disabled="disabled">	
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Fecha inicio:</label>	
				<div class="col-md-8">
					<p class="input-group">
						<input class="form-control" is-open="opened" datepicker-options="dateOptions" ng-required="true" ng-model="proyecto.fechaInicio" datepicker-popup="@{{format}}" min-date="minDate">	
						<span class="input-group-btn">
	                		<button style="height: 34px;" type="button" class="btn btn-default" ng-click="open($event)"><i class="glyphicon glyphicon-calendar"></i></button>
	              		</span>
	              	</p>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Fecha fin:</label>	
				<div class="col-md-8">
					<p class="input-group">
						<input class="form-control" is-open="opened" datepicker-options="dateOptions" ng-required="true" ng-model="proyecto.fechaFin" datepicker-popup="@{{format}}" min-date="minDate">	
						<span class="input-group-btn">
	                		<button style="height: 34px;" type="button" class="btn btn-default" ng-click="open($event)"><i class="glyphicon glyphicon-calendar"></i></button>
	              		</span>
	              	</p>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Proceso:</label>	
				<div class="col-md-8">
					<select class="form-control" ng-model="idProceso"ng-options="p.idProcesos as p.nombre for p in procesos"></select>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Estatus:</label>	
				<div class="col-md-8">
					<select class="form-control" ng-model="idProceso"ng-options="p.idProcesos as p.nombre for p in procesos"></select>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<button class="btn btn-default pull-right">Cancelar</button>
			<button class="btn btn-success pull-right" style="margin-right:5px;">Guardar</button>
		</div>
	</div>

</div>
</div>
@stop