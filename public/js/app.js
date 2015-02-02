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

	app.controller('proyectosController', function($http,$scope){
	    
		$scope.itemsByPage=3;
	    $scope.proyectos = [];
	    $scope.displayedCollection = [];
	    $scope.getStatus = function(Status){
	    	return Status ? 'Activo' : 'Cancelado';
	    }

	    $scope.removeProyecto = function(idProyecto){
	    	swal({   
	    		title: "¿Desea eliminar el registro?",
	    		text: "No podras recuperar el registro despues de ser eliminado!",
	    		type: "warning",
	    		showCancelButton: true,
	    		confirmButtonColor: "#DD6B55",
	    		confirmButtonText: "Si, eliminalo!",
	    		closeOnConfirm: false },
	    		function(){

	    			$http(
						{
						   	method: 'DELETE',
						   	url: 'proyectos/1',
						    data : {},
						    headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
						}).
						success(function(data, status, headers, config) {
							/*$scope.proyectos = data;
							$scope.displayedCollection = [].concat(data);*/
							swal("Deleted!", "El proyecto a sido eliminado.", "success"); 
							alert(data);
						}
					);


	    			
	    		});
	    }

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
			}
		);

	});

})();
	

