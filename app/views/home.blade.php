@extends('layouts.master')
@section('content')



<section ng-controller="homeController as home">
	<card></card>
	<card></card>
	<card></card>
	<card></card>
	<card></card>
	<card></card>
	<h1 class="text-primary">Catálogo de proyecto</h1>
	<hr>
		<div class="col-md-4">
			<div class="scroll">
				<table st-table="displayedCollection" st-safe-src="proyectos" class="table table-striped">
					<thead>
					<tr>
						<th st-sort="nombre">Proyectos</th>
					</tr>
					<tr>
						<th><input st-search="" class="form-control" placeholder="buscar proyecto..." type="text"/></th>
					</tr>
					</thead>
					<tbody>
					<tr class="table-row" ng-repeat="row in displayedCollection" ng-class="{'selected-row':isSelected(row.idProyecto)}" ng-click="setProyecto(row.idProyecto)" >
						<td>@{{row.nombre}}</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-md-8">
			<div class="panel panel-primary">
				<div class="panel-heading">@{{proyecto.titulo}}</div>
    			<div class="panel-body">
    				<div class="panel panel-default">
    					<div class="panel-heading">Descripción:</div>
    					<div class="panel-body">
    						@{{proyecto.descripcion}}
    					</div>
    				</div>
    				<div class="panel panel-default">
    					<div class="panel-heading">Equipo de trabajo:</div>
    					<div class="panel-body">
    						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus veritatis voluptas incidunt...
    					</div>
    				</div>
       				<p>Costo: <span class="badge">15%</span></p>
       				<p>Fecha de inicio: <span class="badge">@{{proyecto.fechaInicio | date}}</span></p>
       				<p>Estatus: <span class="badge">En proceso...</span></p>
	    		</div>
	    	</div>
		</div>

		</div>
	</section>
@stop
