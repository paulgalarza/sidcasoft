<?php

class ClientesController extends BaseController {

	protected $layout = 'layouts.master';

	public function add(){
		$clientes = new Cliente;
		$clientes->nombre = Input::get('nombre');
		$clientes->idEmpresa = Input::get('idEmpresa');
		$clientes->telefono = Input::get('telefono');
		$clientes->email = Input::get('email');
		$clientes->save();

		return Response::json(
			DB::table('cliente')
				->join('empresa','cliente.idEmpresa','=','empresa.idEmpresa')
				->select('cliente.*','empresa.nombre AS nombreEmpresa')
				->get()
		);
	}
	
}