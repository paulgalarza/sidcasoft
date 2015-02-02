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

	Route::get('proyectos/search',function()
	{
		return Response::json(
			DB::table('proyecto')
				->join('cliente','proyecto.idCliente','=','cliente.idCliente')
				->select('proyecto.*','cliente.nombre AS nombreCliente')
				->get()
		);
	});

	Route::get('proyectos',function(){
		return View::make('proyectos/index');
	});
	Route::delete('proyectos/{id}',function($id){
		return Response::json(
			DB::table('proyecto')
				->join('cliente','proyecto.idCliente','=','cliente.idCliente')
				->select('proyecto.*','cliente.nombre AS nombreCliente')
				->get()
		);
	});
});
