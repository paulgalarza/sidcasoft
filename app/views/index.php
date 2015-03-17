<!DOCTYPE HTML>
<html ng-app="sidcasoft">
  <meta content="UTF-8">
  <head>
    <title>Sidcasoft</title>
    <link rel="stylesheet" href="css/bootstrap.css" >
    <link rel="stylesheet" href="css/master.css" >
    <link rel="stylesheet" href="css/font-awesome.min.css" >
    <link rel="stylesheet" href="css/sweet-alert.css" >
    <link rel="stylesheet" href="css/snap.css" >
  </head>
  <body>
    <div class="header">
      <img src="images/headertec.jpg" alt="" class="img-header"/>
    </div>
    <nav-bar></nav-bar>
    <div ng-view></div>

    <script src="js/vendor/angular.js"></script>
    <script src="js/vendor/angular-route.js"></script>

    <script src="js/app.js"/></script>
    <script src="js/routes.js"/></script>
    <script src="js/vendor/smart-table.min.js"/></script>
    <script src="js/vendor/ui-bootstrap.min.js"/></script>

    <script src="js/controllers/login-index-controller.js"/></script>
    <script src="js/controllers/proyectos-index-controller.js"/></script>

    <script src="js/services/service.js"/></script>

    <script src="js/directives/navBar.js"/></script>

    <script src="js/vendor/jquery.min.js"></script>
    <script src="js/vendor/bootstrap.js"></script>
    <script src="js/vendor/sweet-alert.min.js"></script>

  </body>
</html>
