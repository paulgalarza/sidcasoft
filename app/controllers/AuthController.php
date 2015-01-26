<?php

class AuthController extends BaseController {

	protected $layout = 'layouts.master';
	
	public function showLogin()
	{
		if(Auth::check())
		{
			//Si está autentificado lo mandamos a la raíz donde estara el mensaje de bienvenida.
			return Redirect::to('/');
		}

		//Mostramos la vista login.blade.php
		return View::make('login');
	}

	public function postLogin()
	{
		$userdata = array(
			'usuario'=>Input::get('usuario'),
			'password'=>Input::get('clave')
		);	
		
		if(Auth::attempt($userdata, Input::get('remember_me',0)))
		{
			return Redirect::to('/');
		}

		return Redirect::to('login')
					->with('mensaje_error', 'Clave incorrecta')
					->withInput();
	}

	public function logOut()
    {
        Auth::logout();
        return Redirect::to('login')
                    ->with('mensaje_error', 'Tu sesión ha sido cerrada.');
    }
}