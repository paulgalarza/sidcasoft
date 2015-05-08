<?php

class ProyectosController extends BaseController {

	protected $layout = 'layouts.master';

	public function add(){
		$proyecto = new Proyecto;
		$proyecto->nombre = Input::get('nombre');
		$proyecto->descripcion = Input::get('descripcion');
		$proyecto->idCliente = Input::get('idCliente');
		$proyecto->idEmpresa = Input::get('idEmpresa');
		$proyecto->titulo = Input::get('titulo');
		$proyecto->fechaInicio = Input::get('fechaInicio');
		$proyecto->fechaFinal = Input::get('fechaFin');
		$proyecto->idProceso = Input::get('idProceso');
		$proyecto->costoTotal = Input::get('costoTotal');
		$proyecto->status = Input::get('status');
		$proyecto->usuarioRAP = Input::get('usuarioRAP');
		$proyecto->usuarioRCP = Input::get('usuarioRCP');
		$proyecto->usuarioAnalista = Input::get('usuarioAnalista');
		$proyecto->usuarioArquitecto = Input::get('usuarioArquitecto');
		$proyecto->usuarioDesarrollador = Input::get('usuarioDesarrollador');
		$proyecto->usuarioTester = Input::get('usuarioTester');
		//$proyecto->estatus = Input::get('idEstatus');
		$proyecto->idRecMat = 1;
		$proyecto->save();

		return Response::json(
			DB::table('proyecto')
				->join('cliente','proyecto.idCliente','=','cliente.idCliente')
				->join('empresa','cliente.idEmpresa','=','empresa.idEmpresa')
				->select('proyecto.*','cliente.nombre AS nombreCliente')
				->get()
		);
	}
	public function update($id){
		$proyecto = Proyecto::find($id);
		$proyecto->nombre = Input::get('nombre');
		$proyecto->descripcion = Input::get('descripcion');
		$proyecto->idCliente = Input::get('idCliente');
		$proyecto->idEmpresa = Input::get('idEmpresa');
		$proyecto->titulo = Input::get('titulo');
		$proyecto->fechaInicio = Input::get('fechaInicio');
		$proyecto->fechaFinal = Input::get('fechaFin');
		$proyecto->idProceso = Input::get('idProceso');
		$proyecto->costoTotal = Input::get('costoTotal');
		$proyecto->status = Input::get('status');
		$proyecto->usuarioRAP = Input::get('usuarioRAP');
		$proyecto->usuarioRCP = Input::get('usuarioRCP');
		$proyecto->usuarioAnalista = Input::get('usuarioAnalista');
		$proyecto->usuarioArquitecto = Input::get('usuarioArquitecto');
		$proyecto->usuarioDesarrollador = Input::get('usuarioDesarrollador');
		$proyecto->usuarioTester = Input::get('usuarioTester');
		//$proyecto->estatus = Input::get('idEstatus');
		$proyecto->idRecMat = 1;
		$proyecto->save();

		return Response::json(
			DB::table('proyecto')
				->join('cliente','proyecto.idCliente','=','cliente.idCliente')
				->join('empresa','cliente.idEmpresa','=','empresa.idEmpresa')
				->select('proyecto.*','cliente.nombre AS nombreCliente')
				->get()
		);
	}

}
