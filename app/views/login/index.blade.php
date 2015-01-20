@layout('layout')
 
@section('titulo')
 
    Login
 
@endsection
 
@section('mensaje')
 
    Login con laravel
 
@endsection
 
 
@section('contenido')
    <div class="form">
 
        {{ Form::open('login') }}
 
            <!-- Revisemos si tenemos errores de login -->
            @if (Session::has('error_login'))
            <span class="error">Usuario o contraseña incorrectos.</span>
            @endif
    
            {{ Form::label('usuario', 'Usuario') }}
    
            {{ Form::text('username') }}
    
            {{ Form::label('password', 'Password') }}
    
            {{ Form::password('password') }}
    
            <br />
            {{ Form::submit('Iniciar sesión') }}
        {{ Form::close() }}
 
        <!--si intentan ir a la home sin inciar sesión o han cerrado sesión mostramos un mensaje-->
        @if(Session::has('mensaje'))
            <div id="flash_notice">{{ Session::get('mensaje') }}</div>
                    
         @endif
 
    </div>
 
@endsection