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
});
