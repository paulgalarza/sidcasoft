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

		/* http://laravel.com/docs/4.2/queries#updates

		DB::table('usuarios')
            ->where('idUsuario', Input::get('usuarioTester');)
            ->update(array('ProyectoAsignado' => 1));
            
        */

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
		$proyecto->usuarioRAP = Input::get('usuarioRAP2');
		$proyecto->usuarioRCP = Input::get('usuarioRCP2');
		$proyecto->usuarioAnalista = Input::get('usuarioAnalista2');
		$proyecto->usuarioArquitecto = Input::get('usuarioArquitecto2');
		$proyecto->usuarioDesarrollador = Input::get('usuarioDesarrollador2');
		$proyecto->usuarioTester = Input::get('usuarioTester2');
		//$proyecto->estatus = Input::get('idEstatus');
		$proyecto->idRecMat = 1;
		$proyecto->save();

		/*DB::table('usuarios')
			->where('idUsuario', Input::get('usuarioRAP'))
			->update(array('ProyectoAsignado') => $id);
			*/

		return Response::json(
			DB::table('proyecto')
				->join('cliente','proyecto.idCliente','=','cliente.idCliente')
				->join('empresa','cliente.idEmpresa','=','empresa.idEmpresa')
				->select('proyecto.*','cliente.nombre AS nombreCliente')
				->get()
		);
	}

}
