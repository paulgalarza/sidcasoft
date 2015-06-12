@extends('layouts.master')
@section('content')

<div ng-controller="usuariosController">
<h1 class="text-primary"><a href="#" ng-click="setForm(0)">Usuarios <i class="fa fa-arrow-circle-o-left" ng-show="formUsuario"></i></a></h1>
<hr>
<div>
	<div ng-hide="formUsuario" style="position: relative;" class="animate-grid">
		<table st-table="displayedCollection" st-safe-src="usuarios" class="table table-striped table-hover table-responsive">
			<thead>
			<tr>
				<th st-sort="usuario">Nombre de Usuario</th>
				<th st-sort="nombre">Nombre</th>
				<th st-sort="domicilio">Domicilio</th>
				<th st-sort="telefono">Teléfono</th>
				<th st-sort="status">Estatus</th>
				<th st-sort="proyecto">Proyecto actual</th>
				<th></th>
			</tr>
			<tr>
				<th>
					<input st-search="'usuario'" placeholder="busqueda por tipo de usuario..." class="input-sm form-control" type="search"/>
				</th>
				<th colspan="4">
					<input st-search placeholder="busqueda general..." class="input-sm form-control" type="search"/>
				</th>
				<th>
					<button type="button" class="btn btn-sm btn-success" ng-click="newUsuario()">Nuevo <i class="glyphicon glyphicon-plus"></i></button>
				</th>
			</tr>
			</thead>
			<tbody>
			<tr ng-repeat="row in displayedCollection"  ng-class="{'selected-row':isSelected(row.idUsuario)}" ng-click="setUsuario(row.idUsuario)" ng-dblclick="editUsuario(row.idUsuario)">
				<td>@{{row.usuario | uppercase}}</td>
				<td>@{{row.nombre}}</td>
				<td>@{{row.domicilio}}</td>
				<td>@{{row.telefono}}</td>
				<td>@{{getStatus(row.estatus)}}</td>
				<td><div class="@{{row.idUsuario}}">@{{getNombreProy(row.idUsuario, row.ProyectoAsignado)}}</div></td>
				<td>
					<button type="button" class="btn btn-sm btn-default" ng-click="editUsuario(row.idUsuario)"><i class="glyphicon glyphicon-pencil"></i></button>
					<button type="button" class="btn btn-sm btn-danger" ng-click="removeUsuario(row.idUsuario)"><i class="glyphicon glyphicon-remove-circle"></i></button></td>
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

	<form novalidate class="formulario item-animate" ng-show="formUsuario" name="usuarioForm" ng-submit="save(usuario)">
		<div class="col-md-7">
			<div class="form-group row">
				<label class="control-label col-md-4">Nombre de Usuario:</label>
				<div class="col-md-8">
					<input required class="form-control" type="text" maxlength="255" ng-model="usuario.usuario">
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Correo Electrónico:</label>
				<div class="col-md-8">
					<input required class="form-control" type="email" maxlength="60" ng-model="usuario.email">
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Nombre del Personal:</label>
				<div class="col-md-8">
					<input required class="form-control" type="text" maxlength="60" ng-model="usuario.nombre" id="js-usuario-nombre">
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Domicilio:</label>
				<div class="col-md-8">
					<input required class="form-control" type="text" maxlength="100" ng-model="usuario.domicilio">
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Teléfono:</label>
				<div class="col-md-8">
					<input required class="form-control" type="text" maxlength="10" ng-model="usuario.telefono">
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Tipo de Usuario:</label>
				<div class="col-md-8">
					<select required class="form-control" name="tipoUsuario" ng-model="usuario.idTipoUsuario" ng-options="u.idTipoUsuario as u.descripcion for u in tipoUsuario">
						<option value="" disabled="disabled" style="display:none">Seleccione</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">Password:</label>
				<div class="col-md-8">
					<input required class="form-control" type="password" maxlength="100" ng-model="usuario.password">
				</div>
			</div>
		</div>
			<div class="col-md-12" style="border-top:1px solid #eee; padding:10px; padding-bottom: 30px;">
				<button class="btn btn-default pull-right" ng-click="setForm(0)">Cancelar</button>
				<button class="btn btn-success pull-right" ng-disabled="usuarioForm.$invalid" ng-click="addUsuario()" ng-show="SeAgrega" style="margin-right:5px;">Guardar</button>
				<button class="btn btn-success pull-right" ng-disabled="usuarioForm.$invalid" ng-click="guardaCambiosUsuario(usuario.idUsuario)" ng-show="SeEdita" ng-hide="SeAgrega" style="margin-right:5px;">Guardar</button>
		</div>

		@{{usuario}}
	</form>

</div>
</div>
@stop
