<?php
Route::get('login','AuthController@showLogin');
Route::post('login','AuthController@postLogin');

//Nos inica que las rutas que están dentro de él sólo serán mostradas si antes el usuario se ha autenticado.
Route::group(array('before' => 'auth'), function()
{
    Route::get('/', function()
    {
        return View::make('home');
    });

    Route::get('logout', 'AuthController@logOut');

    Route::get('password', function(){

    	return View::make('profile/index');
    });

    Route::post('password','AuthController@newPassword');

    Route::get('proyectos',function(){
		return View::make('proyectos/index');
	});

	Route::get('proyectos/search',function()
	{
		return Response::json(
			DB::table('proyecto')
				->join('cliente','proyecto.idCliente','=','cliente.idCliente')
        ->join('empresa','proyecto.idEmpresa','=','empresa.idEmpresa')
				->select('proyecto.*','cliente.nombre AS cliente','empresa.nombre as empresa')
				->get()
		);
	});

	Route::post('proyectos/add','ProyectosController@add');

	Route::put('proyectos/{id}','ProyectosController@update');

	Route::delete('proyectos/{id}',function($id){
		$proyecto = Proyecto::find($id);
		$proyecto->delete();
		return Response::json(
			DB::table('proyecto')
				->join('cliente','proyecto.idCliente','=','cliente.idCliente')
				->select('proyecto.*','cliente.nombre AS nombreCliente')
				->get()
		);
	});

	Route::get('usuariorap/search',function(){
		return Response::json(
			DB::table('usuarios')
				->select('usuarios.nombre', 'usuarios.idUsuario as usuarioRAP')
				->where('usuarios.idTipoUsuario', '=', 2)
				->where('usuarios.ProyectoAsignado', '=', null)
				->get()
		);
	});

	Route::get('usuariorcp/search',function(){
		return Response::json(
			DB::table('usuarios')
				->select('usuarios.nombre', 'usuarios.idUsuario as usuarioRCP')
				->where('usuarios.idTipoUsuario', '=', 1)
				->where('usuarios.ProyectoAsignado', '=', null)
				->get()
		);
	});

	Route::get('usuarioanalista/search',function(){
		return Response::json(
			DB::table('usuarios')
				->select('usuarios.nombre', 'usuarios.idUsuario as usuarioAnalista')
				->where('usuarios.idTipoUsuario', '=', 3)
				->where('usuarios.ProyectoAsignado', '=', null)
				->get()
		);
	});

	Route::get('usuarioarquitecto/search',function(){
		return Response::json(
			DB::table('usuarios')
				->select('usuarios.nombre', 'usuarios.idUsuario as usuarioArquitecto')
				->where('usuarios.idTipoUsuario', '=', 4)
				->where('usuarios.ProyectoAsignado', '=', null)
				->get()
		);
	});

	Route::get('usuariodesarrollador/search',function(){
		return Response::json(
			DB::table('usuarios')
				->select('usuarios.nombre', 'usuarios.idUsuario as usuarioDesarrollador')
				->where('usuarios.idTipoUsuario', '=', 5)
				->where('usuarios.ProyectoAsignado', '=', null)
				->get()
		);
	});

	Route::get('usuariotester/search',function(){
		return Response::json(
			DB::table('usuarios')
				->select('usuarios.nombre', 'usuarios.idUsuario as usuarioTester', 'usuarios.ProyectoAsignado as proyecto')
				->where('usuarios.idTipoUsuario', '=', 6)
				->where('usuarios.ProyectoAsignado', '=', null)
				->get()
				//->orWhere('usuarios.ProyectoAsignado', '=', 9)
		);
	});

	Route::get('usuarios',function(){
		return View::make('usuarios/index');
	});

	Route::get('usuarios/search',function()
	{
		return Response::json(
			DB::table('usuarios')
				->join('tipousuario','usuarios.idTipoUsuario','=','tipousuario.idTipoUsuario')
				->select('usuarios.*','tipousuario.descripcion AS tipoUsuario')
				->get()
		);
	});

	Route::post('usuarios/add','UsuariosController@add');

	Route::put('usuarios/{id}','UsuariosController@update');

	Route::delete('usuarios/{id}',function($id){
		$user = User::find($id);
		$user->delete();
		return Response::json(
			DB::table('usuarios')
				->join('tipousuario','usuarios.idTipoUsuario','=','tipousuario.idTipoUsuario')
				->select('usuarios.*','tipousuario.descripcion AS tipoUsuario')
				->get()
		);
	});

	Route::get('buscarnombreproy/{NumProy}',function($NumProy){
		//if($NumProy != null)
		//{
			return Response::json(
				DB::table('usuarios')
					->join('proyecto','usuarios.ProyectoAsignado','=','proyecto.idProyecto')
					->select('proyecto.nombre AS nombre')
					->where('proyecto.idProyecto','=', $NumProy)
					->get()
			);
			/*return Response::json(
				DB::table('proyecto')
					->select('proyecto.nombre')
					->where('proyecto.idProyecto','=', $NumProy)
					->get()
			);*/
		//}
	});

	Route::get('tipousuario/search',function(){
		return Response::json(
			DB::table('tipousuario')
				->get()
		);
	});

	Route::get('clientes',function(){
		return View::make('clientes/index');
	});

	Route::get('clientes/search/{nombre?}',function($nombre = ''){
		if($nombre == ''){
			return Response::json(
				DB::table('cliente')
					->join('empresa','cliente.idEmpresa','=','empresa.idEmpresa')
					->select('cliente.*','empresa.nombre AS nombreEmpresa')
					->get()
			);
		}
		return Response::json(
			DB::table('cliente')
				->where('nombre','like','%'.$nombre.'%')
				->get()
		);
	});

	Route::get('cliente/{id}',function($id){
		return Response::json(
			Cliente::findOrFail($id)
		);
	});

	Route::post('clientes/add','ClientesController@add');

	Route::put('cliente/{id}','ClientesController@update');

	Route::delete('clientes/{id}',function($id){
		$cliente = Cliente::find($id);
		$cliente->delete();
		return Response::json(
			DB::table('cliente')
				->join('empresa','cliente.idEmpresa','=','empresa.idEmpresa')
				->select('cliente.*','empresa.nombre AS nombreEmpresa')
				->get()
		);
	});

	Route::get('empresas',function(){
		return View::make('empresas/index');
	});

	Route::get('empresas/search',function()
	{
		return Response::json(
			DB::table('empresa')
				->get()
		);
	});

	Route::post('empresas/add','EmpresasController@add');

	Route::put('empresas/{id}','EmpresasController@update');

	Route::delete('empresas/{id}',function($id){
		$empresa = Empresa::find($id);
		$empresa->delete();
		return Response::json(
			DB::table('empresa')
				->get()
		);
	});

	Route::get('procesos/search',function(){
		return Response::json(
			DB::table('procesos')
				->get()
		);
	});

	Route::get('recursos/search/{descripcion?}',function($descripcion = ''){
		return Response::json(
			DB::table('recursos_materiales')
				->where('descripcion','like','%'.$descripcion.'%')
				->get()
		);
	});

	Route::get('documentos',function(){
		return View::make('documentos/index');
	});
});
