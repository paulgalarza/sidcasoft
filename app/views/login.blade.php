@extends('layouts.master')

@section('title')
    Login
@stop

@section('content')
    <div class="container">
        <div class="row" style="margin-bottom:50px;">
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                
                <div class="account-wall">
                    <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                    alt="">
                    {{ Form::open(array('url' => '/login','class'=>'form-signin')) }}
                    <input type="text" class="form-control" placeholder="Email" required autofocus name="usuario">
                    <input type="password" class="form-control" placeholder="Password" required name="clave">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">
                        Sign in
                    </button>
                    @if(Session::has('mensaje_error'))
                    <div class="alert alert-danger">{{ Session::get('mensaje_error') }}</div>
                    @endif
                    <label class="checkbox pull-left">
                    <input type="checkbox" value="remember-me" name="remember_me">
                        Recordarme
                    </label>
                    <a href="#" class="pull-right need-help">Ayuda? </a><span class="clearfix"></span>
                    {{ Form::close() }}
                </div>
                <a href="#" class="text-center new-account">Solicitar una cuenta </a>
            </div>
        </div>
    </div> 
@stop
