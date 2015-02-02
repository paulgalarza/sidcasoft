(function(){

	var app = angular.module('app',['smart-table']);

	app.controller('homeController',function($http,$scope){

		$scope.proyectos = [];
		$scope.displayedCollection = [];
		$scope.proyecto = {};

		$http(
			{
			   	method: 'GET',
			   	url: 'proyectos/search',
			    data : {},
			    headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
			}).
			success(function(data, status, headers, config) {
				$scope.proyectos = data;
				$scope.displayedCollection = [].concat(data);
				$scope.proyecto = data[0];
			}
		);

		$scope.setProyecto = function(idProyecto){
			$scope.proyecto = $scope.proyectos.filter(function (el) {
												return el.idProyecto == idProyecto;
											})[0];
		};
		$scope.isSelected = function(idProyecto){
			return $scope.proyecto.idProyecto == idProyecto;
		};
	});


})();
	

