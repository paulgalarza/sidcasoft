
<html>
	<head>
        <meta charset="utf-8">
        <title>@section('title')@show</title>
        {{ HTML::style('css/bootstrap.css'); }}
        {{ HTML::style('css/style.css'); }}
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <div class="header">
            {{ HTML::image('images/headertec.jpg') }}
            @if (Auth::check())
                <!-- Navigation bar -->
                <nav class="navbar navbar-default navbar-static-top" role="navigation">
                  <div class="container">
                    <div class="navbar-header">
                      <button type="button" class="navbar-toggle border-primary" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="glyphicon glyphicon-tasks"></span>
                      </button>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="home.html"><span class="glyphicon glyphicon-home"></span></a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"> <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="configuracion.html">Cambiar contraseña</a></li>
                                    <li><a  data-toggle="modal" data-target="#sesión">Cerrar sesión</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                  </div>
                </nav>
            @endif
        </div>
        <div class="container">
            @yield('content')
        </div>
    <script src="https://code.jquery.com/jquery.js"></script>
    {{ HTML::script('js/bootstrap.js'); }}
    </body>
</html>