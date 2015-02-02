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
		
		if(Auth::attempt($userdata, true))
		{
			return Redirect::to('/');
		}

		return Redirect::to('login')
					->with('mensaje_error', 'Clave incorrecta')
					->withInput();
	}

	public function newPassword()
	{
		$rules = array(
            'password' => 'required',
            'newpassword' => 'required|min:5',
            'repassword' => 'required|same:newpassword'
        );

        $messages = array(
                'required' => 'El campo :attribute es obligatorio.',
                'min' => 'El campo :attribute no puede tener menos de :min carácteres.'
        );

        $validation = Validator::make(Input::all(), $rules, $messages);
        if ($validation->fails())
        {
            return Redirect::to('password')->withErrors($validation)->withInput();
        }
        else{
            if (Hash::check(Input::get('password'), Auth::user()->password))
            {
                $user = Auth::user();
                $user->password = Hash::make(Input::get('newpassword'));
                $user->save();
               
                   
                   if($user->save()){
                        return Redirect::to('password')->with('notice', 'Nueva contraseña guardada correctamente');
                   }
                   else
                   {
                       return Redirect::to('password')->with('notice', 'No se ha podido guardar la nueva contaseña');
                    }
            }
            else
            {
                return Redirect::to('password')->with('notice', 'La contraseña actual no es correcta')->withInput();
            }

        }
	}

	public function logOut()
    {
        Auth::logout();
        return Redirect::to('login')
                    ->with('mensaje_error', 'Tu sesión ha sido cerrada.');
    }
}