'use strict'

angular.module('sidcasoft')
  .controller('LoginIndexConroller',function($scope,$http){
    $scope.logIn = function(){
      console.log("Login");
      var user = {
        username:$scope.username,
        password:$scope.password
      }
      $http({method:'POST', url: 'login', data:user})
      .success(function(response){
        if(response.status == 'success')
          $rootScope.loggedUser = response.data;
        else
          sweetAlert("Oops...", response.message , "error");
      })
      .catch(function(e){
        sweetAlert("Oops...", e , "error");
      });

    }
  });
