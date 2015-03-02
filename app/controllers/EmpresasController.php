<?php

class EmpresasController extends BaseController {

	protected $layout = 'layouts.master';

	public function add(){
		$empresas = new Empresa;
		$empresas->nombre = Input::get('nombre');
		$empresas->encargado = Input::get('encargado');
		$empresas->RFC = Input::get('RFC');
		$empresas->direccion = Input::get('direccion');
		$empresas->telefono = Input::get('telefono');
		$empresas->estatus = Input::get('estatus');
		$empresas->save();

		return Response::json(
			DB::table('empresa')
				->get()
		);
	}
	
}