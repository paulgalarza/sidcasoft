'use strict';

angular.module('app')
  .controller('documentosController',['$scope','$http',function($scope,$http){
      $scope.options = [
        "Requerimientos",
        "Descripción de proyecto",
        "Plan de proyecto",
        "Reporte de actividades",
        "Reporte de evolución",
        "Paquete de salidas"
      ];

      $scope.selected = "";

      $scope.isSelected = function(option){
        return $scope.selected == option;
      }

      $scope.setTab = function(tab){
        $scope.selected = tab;
      }
  }]);
