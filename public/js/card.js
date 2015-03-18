angular.module('app')
  .controller('CardController',function($scope){

  })
  .directive('card', function(){
    return{
      restric:'E',
      templateUrl: 'templates/card.html',
      scope:{
        header:"@",
        status:"@",
        empresa:"@",
        cliente:"@",
        descripcion:"@",
      }
    }
  });
