@extends('layouts.master')
@section('content')
<div ng-controller="empresasController">
<h1 class="text-primary"><a href="#" ng-click="setForm(0)">Empresas <i class="fa fa-arrow-circle-o-left" ng-show="formEmpresa"></i></a></h1>
<hr>
<div>
	<div ng-hide="formEmpresa" style="position: relative;" class="animate-grid">
		<table st-table="displayedCollection" st-safe-src="empresas" class="table table-striped table-hover table-responsive">
			<thead>
			<tr>
				<th st-sort="nombre">Nombre</th>
				<th st-sort="encargado">Encargado</th>
				<th st-sort="RFC">RFC</th>
				<th st-sort="direccion">Dirección</th>
				<th st-sort="telefono">Teléfono</th>
				<th st-sort="estatus">Estatus</th>
				<th></th>
			</tr>
			<tr>
				<th>
					<input st-search="'nombre'" placeholder="busqueda por empresa..." class="input-sm form-control" type="search"/>
				</th>
				<th colspan="4">
					<input st-search placeholder="busqueda general..." class="input-sm form-control" type="search"/>
				</th>
				<th>
					<button type="button" class="btn btn-sm btn-success" ng-click="newEmpresa()">Nuevo <i class="glyphicon glyphicon-plus"></i></button>
				</th>
			</tr>
			</thead>
			<tbody>
			<tr ng-repeat="row in displayedCollection"  ng-class="{'selected-row':isSelected(row.idEmpresa)}" ng-click="setEmpresa(row.idEmpresa)" ng-dblclick="editEmpresa(row.idEmpresa)">
				<td>@{{row.nombre | uppercase}}</td>
				<td>@{{row.encargado}}</td>
				<td>@{{row.RFC | uppercase}}</td>
				<td>@{{row.direccion}}</td>
				<td>@{{row.telefono}}</td>
				<td>@{{getStatus(row.estatus)}}</td>
				<td>
					<button type="button" class="btn btn-sm btn-default" ng-click="editEmpresa(row.idEmpresa)"><i class="glyphicon glyphicon-pencil"></i></button>
					<button type="button" class="btn btn-sm btn-danger" ng-click="removeEmpresa(row.idEmpresa)"><i class="glyphicon glyphicon-remove-circle"></i></button></td>
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

	<form novalidate class="formulario item-animate" ng-show="formEmpresa" name="empresaForm" ng-submit="save(empresa)">
		<div class="col-md-7">
			<div class="form-group row">
				<label class="control-label col-md-4">Nombre de la Empresa:</label>	
				<div class="col-md-8">
					<input required class="form-control" type="text" ng-model="empresa.nombre" id="js-empresa-nombre">	
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Encargado de la empresa:</label>	
				<div class="col-md-8">
					<input required class="form-control" type="text" ng-model="empresa.encargado">	
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">RFC:</label>			
				<div class="col-md-8">
					<input required class="form-control" type="text" ng-model="empresa.RFC">	
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Dirección:</label>	
				<div class="col-md-8">
					<input required class="form-control" type="text" ng-model="empresa.direccion">	
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Teléfono:</label>	
				<div class="col-md-8">
					<input required class="form-control" type="text" ng-model="empresa.telefono">	
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Estatus:</label>	
				<div class="col-md-8">
					<select required class="form-control" ng-model="empresa.estatus" ng-options="e.status as e.descripcion for e in estatus"></select>
				</div>
			</div>
		</div>
			<div class="col-md-12" style="border-top:1px solid #eee; padding:10px; padding-bottom: 30px;">
				<button class="btn btn-default pull-right" ng-click="setForm(0)">Cancelar</button>
				<button class="btn btn-success pull-right" ng-disabled="empresaForm.$invalid" ng-click="addEmpresa()" style="margin-right:5px;">Guardar</button>
			</div>

		@{{empresa}}
	</form>
</div>
</div>
@stop