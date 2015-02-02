@extends('layouts.master')
@section('content')
<section>
		<div class="panel panel-default" style="max-width:500px; margin:0 auto;">
			<div class="panel-heading"><strong>
				<span class="glyphicon glyphicon-th"></span> Cambio de Contraseña</strong>
			</div>
			<div class="panel-body">
                    {{ Form::open(array('url' => '/password', 'method' => 'post')) }}
                        <fieldset style="margin:0 auto; max-width:400px;">
                            <div class="form-group">
                                <div class="row">
                                	<div class="col-sm-4">
                                    	<label for="">Clave anterior:</label>
                                	</div>
	                                <div class="col-sm-8">
	                                    <input type="password" class="form-control" name="password">
	                                </div>
                                </div>
                            </div>
                            <div class="form-group">
	                            <div class="row">
	                                <div class="col-sm-4">
	                                    <label for="">Clave nueva:</label>
	                                </div>
	                                <div class="col-sm-8">
	                                    <input type="password" class="form-control" name="newpassword">
	                                </div>
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <div class="row">
	                                <div class="col-sm-4">
	                                    <label for="">Confirmar clave nueva:</label>
	                                </div>
	                                <div class="col-sm-8">
	                                    <input type="password" class="form-control" name="repassword">
	                                </div>
	                            </div>
	                        </div>
                            @if(Session::has('notice'))
					            <div class="alert alert-danger">{{ Session::get('notice') }}</div>
					        @endif
                            <a href="{{URL::to('/')}}"><button class="btn btn-default pull-right" type="button">Cancelar</button></a>
                            <button type="submit" class="btn btn-success pull-right" style="margin-right:5px;" onclick="newPassword()">Guardar</button>
                            <div class="divider"></div>
                        </fieldset>
                    {{ Form::close() }}
            </div>
		</div>		
</section>

@stop