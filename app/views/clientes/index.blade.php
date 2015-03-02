@extends('layouts.master')
@section('content')
<div ng-controller="clientesController">
<h1 class="text-primary"><a href="#" ng-click="setForm(0)">Clientes <i class="fa fa-arrow-circle-o-left" ng-show="formCliente"></i></a></h1>
<hr>
<div>
	<div ng-hide="formCliente" style="position: relative;" class="animate-grid">
		<table st-table="displayedCollection" st-safe-src="clientes" class="table table-striped table-hover table-responsive">
			<thead>
			<tr>
				<th st-sort="nombre">Nombre</th>
				<th st-sort="nombreEmpresa">Empresa</th>
				<th st-sort="telefono">Teléfono</th>
				<th st-sort="email">Correo Electrónico</th>
				<th st-sort="estatus">Estatus</th>
				<th></th>
			</tr>
			<tr>
				<th>
					<input st-search="'nombre'" placeholder="busqueda por cliente..." class="input-sm form-control" type="search"/>
				</th>
				<th colspan="4">
					<input st-search placeholder="busqueda general..." class="input-sm form-control" type="search"/>
				</th>
				<th>
					<button type="button" class="btn btn-sm btn-success" ng-click="newCliente()">Nuevo <i class="glyphicon glyphicon-plus"></i></button>
				</th>
			</tr>
			</thead>
			<tbody>
			<tr ng-repeat="row in displayedCollection"  ng-class="{'selected-row':isSelected(row.idCliente)}" ng-click="setCliente(row.idCliente)" ng-dblclick="editCliente(row.idCliente)">
				<td>@{{row.nombre | uppercase}}</td>
				<td>@{{row.nombreEmpresa}}</td>
				<td>@{{row.telefono}}</td>
				<td>@{{row.email}}</td>
				<td>@{{getStatus(row.estatus)}}</td>
				<td>
					<button type="button" class="btn btn-sm btn-default" ng-click="editCliente(row.idCliente)"><i class="glyphicon glyphicon-pencil"></i></button>
					<button type="button" class="btn btn-sm btn-danger" ng-click="removeCliente(row.idCliente)"><i class="glyphicon glyphicon-remove-circle"></i></button></td>
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

	<form novalidate class="formulario item-animate" ng-show="formCliente" name="clienteForm" ng-submit="save(cliente)">
		<div class="col-md-7">
			<div class="form-group row">
				<label class="control-label col-md-4">Nombre del Cliente:</label>	
				<div class="col-md-8">
					<input required class="form-control" type="text" ng-model="cliente.nombre" id="js-cliente-nombre">	
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Empresa:</label>	
				<div class="col-md-8">
					<select required class="form-control" name="nombreEmpresa" ng-model="cliente.idEmpresa" ng-options="c.idEmpresa as c.nombre for c in empresas">
						<option value="" disabled="disabled" style="display:none">Seleccione</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Teléfono:</label>	
				<div class="col-md-8">
					<input required class="form-control" type="text" ng-model="cliente.telefono">	
				</div>
			</div>
				<div class="form-group row">
				<label class="control-label col-md-4">Correo Electrónico:</label>	
				<div class="col-md-8">
					<input required class="form-control" type="text" ng-model="cliente.email">	
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Estatus:</label>	
				<div class="col-md-8">
					<select required class="form-control" ng-model="cliente.estatus" ng-options="c.status as c.descripcion for c in estatus"></select>
				</div>
			</div>
		</div>
			<div class="col-md-12" style="border-top:1px solid #eee; padding:10px; padding-bottom: 30px;">
				<button class="btn btn-default pull-right" ng-click="setForm(0)">Cancelar</button>
				<button class="btn btn-success pull-right" ng-disabled="clienteForm.$invalid" ng-click="addCliente()" style="margin-right:5px;">Guardar</button>
			</div>

		@{{cliente}}
	</form>
</div>
</div>
@stop