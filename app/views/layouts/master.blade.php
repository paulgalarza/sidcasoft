
<html>
	<head>
        <meta charset="utf-8">
        <title>@section('title')@show</title>
        {{ HTML::style('css/bootstrap.css'); }}
        {{ HTML::style('css/style.css'); }}
        {{ HTML::style('css/sweet-alert.css'); }}
        <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    </head>
    <body ng-app="app">
        <div class="header">
            {{ HTML::image('images/headertec.jpg','SIDCASOFT',array('class'=>'img-header')) }}
            @if (Auth::check())
                <!-- Navigation bar -->
                <nav class="navbar navbar-inverse navbar-static-top margin-0" role="navigation">
                  <div class="container">
                    <div class="navbar-header">
                      <button type="button" class="navbar-toggle border-primary" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="glyphicon glyphicon-tasks"></span>
                      </button>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active">
                                <a href="{{URL::to('/')}}"><span class="glyphicon glyphicon-home"></span></a>
                            </li>

                            @foreach ( DB::table('pages')->where('navbar', '1')->get() as $page)
                                @if(Auth::user()->hasAccess($page->descripcion))
                                    <li>
                                        <a href='{{strtolower($page->descripcion)}}'>
                                            <strong>{{$page->descripcion}}</strong>
                                        </a>
                                    </li>
                                @endif
                            @endforeach
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"> <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href='{{URL::to('/password')}}'>Cambiar contraseña</a></li>
                                    <li><a href='#' onclick="cerrarSesion()">Cerrar sesión</a></li>
                                    <li><a href="configuracion.html">Cambiar contraseña</a></li>
                                    <li><a onclick="cerrarSesion()">Cerrar sesión</a></li>

                                </ul>
                            </li>
                        </ul>
                    </div>
                  </div>
                </nav>
            @endif
        </div>
        <div class="container content">
            @yield('content')
        </div>
        <div class="footer">
            <div class="container" >
                <h2>SIDCASOFT</h2>
            </div>
        </div>
    <script src="https://code.jquery.com/jquery.js"></script>
    {{ HTML::script('js/bootstrap.js'); }}
    {{ HTML::script('js/angular.min.js'); }}
    {{ HTML::script('js/app.js'); }}
    {{ HTML::script('js/sweet-alert.min.js'); }}
    {{ HTML::script('js/master.js'); }}
    {{ HTML::script('js/smart-table.min.js'); }}
    {{ HTML::script('js/ui-bootstrap-0.12.0.min.js'); }}
    
    </body>
</html>