
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
        </div>
        <div class="container">
            @yield('content')
        </div>
    <script src="https://code.jquery.com/jquery.js"></script>
    {{ HTML::script('js/bootstrap.js'); }}
    </body>
</html>