<?php

class UsuariosController extends BaseController {

	protected $layout = 'layouts.master';

	public function add(){
		$usuarios = new User;
		$usuarios->usuario = Input::get('usuario');
		$usuarios->email = Input::get('email');
		$usuarios->nombre = Input::get('nombre');
		$usuarios->domicilio = Input::get('domicilio');
		$usuarios->telefono = Input::get('telefono');
		$usuarios->idTipoUsuario = Input::get('idTipoUsuario');
		$usuarios->password = Input::get('password');
		$usuarios->estatus = Input::get('estatus');
		$usuarios->save();

		return Response::json(
			DB::table('usuarios')
				->join('tipousuario','usuarios.idTipoUsuario','=','tipoUsuario.idTipoUsuario')
				->select('usuarios.*','tipoUsuario.descripcion AS tipoUsuario')
				->get()
		);
	}
	
}