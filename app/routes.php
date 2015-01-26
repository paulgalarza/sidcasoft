<?php



Route::get('login/index','AuthController@showLogin');
Route::post('login/index','AuthController@postLogin');

//Nos inica que las rutas que están dentro de él sólo serán mostradas si antes el usuario se ha autenticado.
Route::group(array('before' => 'auth'), function()
{
    Route::get('/', function()
    {
        return View::make('hello');
    });

    Route::get('logout', 'AuthController@logOut');
});
