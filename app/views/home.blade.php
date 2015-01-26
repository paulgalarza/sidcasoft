@extends('layouts.master')
@section('content')
<section class="container">

		<article id="home">
				<p id="txt_descripcion">Catálogo de proyectos</p>
				<div class="row">
					<div class="col-md-4">
						<div class="input-group">
							<input type="checkbox">
							<label for="#">Proyecto 1</label><br>
							<input type="checkbox">
							<label for="#">Proyecto 2</label><br>
							<input type="checkbox">
							<label for="#">Proyecto 3</label><br>
							<input type="checkbox">
							<label for="#">Proyecto 4</label><br>
							<input type="checkbox" disabled>
							<label for="#">Proyecto finalizado 1</label><br>
							<input type="checkbox" disabled>
							<label for="#">Proyecto finalizado 2</label><br>
						</div>
						<p>Al seleccionar un proyecto deberá aparecer a la derecha las demás opciones.</p>
						<p>Esto es solamente un ejemplo de la pantalla de inicio.</p>
					</div>
	  				<div class="col-md-8">
						<div class="panel panel-primary">
							<div class="panel-heading">Proyecto 4</div>
		        			<div class="panel-body">
		        				<div class="panel panel-default">
		        					<div class="panel-heading">Descripción:</div>
		        					<div class="panel-body">
		        						Lorem ipsum dolor sit amet, consectetur adipisicing elit...
		        					</div>
		        				</div>
		        				<div class="panel panel-default">
		        					<div class="panel-heading">Equipo de trabajo:</div>
		        					<div class="panel-body">
		        						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus veritatis voluptas incidunt...
		        					</div>
		        				</div>
			       				<p>Porcentajes: <span class="badge">15%</span></p>
			       				<p>Fecha de inicio: <span class="badge">02-10-2014</span></p>
			       				<p>Fecha de finalización: <span class="badge">02-06-2017</span></p>
			       				<p>Status: <span class="badge">En proceso...</span></p>
		        			</div>
						</div>
	  				</div>
				</div>
			</article>
	</section>
@stop