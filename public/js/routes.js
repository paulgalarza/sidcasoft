'use strict'

angular.module('sidcasoft')
  .config(function($routeProvider){
    $routeProvider.when('/dashboard',{
      templateUrl: 'templates/pages/dashboard/index.html'
    })
    .when('/login',{
      templateUrl: 'templates/pages/login/index.html'
    })
    .when('/proyectos',{
      templateUrl: 'templates/pages/proyectos/index.html'
    })
    .when('/',{
      templateUrl: 'templates/pages/dashboard/index.html'
    })
    .otherwise({
      templateUrl: 'templates/pages/dashboard/index.html'
    })

  })
  .run( function($rootScope,$location){
    // register listener to watch route changes
    $rootScope.$on( "$routeChangeStart", function(event, next, current) {
      if ( $rootScope.loggedUser == null ) {
        // no logged user, we should be going to #login
        if ( next.templateUrl == "templates/pages/login/index.html" ) {
          // already going to #login, no redirect needed
        } else {
          // not going to #login, we should redirect now
          $location.path( "/login" );
        }
      }
    });

  });
