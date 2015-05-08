@extends('layouts.master')
@section('content')



<section ng-controller="homeController as home" class="dashboard">
	<card ng-repeat="proyecto in proyectos"
				header="@{{proyecto.nombre}}"
				status="@{{proyecto.estatus}}"
				empresa="@{{proyecto.empresa}}"
				cliente="@{{proyecto.cliente}}"
				descripcion="@{{proyecto.descripcion}}">
	</card>

</section>
@stop
