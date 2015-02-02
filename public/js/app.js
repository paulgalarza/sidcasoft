(function(){

	var app = angular.module('app',['smart-table','ui.bootstrap']);

	app.controller('homeController',function($http,$scope,dataService){

		$scope.proyectos = [];
		$scope.displayedCollection = [];
		$scope.proyecto = {};


		dataService.getProyectos().then(function(proyectos){
			$scope.proyectos = proyectos;
			$scope.displayedCollection = [].concat(proyectos);
			$scope.proyecto = proyectos[0];
		});

		$scope.setProyecto = function(idProyecto){
			$scope.proyecto = $scope.proyectos.filter(function (el) {
												return el.idProyecto == idProyecto;
											})[0];
		};
		$scope.isSelected = function(idProyecto){
			return $scope.proyecto.idProyecto == idProyecto;
		};
	});

	app.controller('proyectosController', function($http,$scope,dataService){
	    
		$scope.itemsByPage=10;
	    $scope.proyectos = [];
	    $scope.displayedCollection = [];
	    $scope.formProyecto = 0;
	    $scope.proyecto = {};
	    $scope.asyncSelected = undefined;
	    

	    $scope.getClientes = function(nombre){
	    	/*return dataService.getClientes(nombre).then(function(clientes){
	    		$scope.clientes = clientes;
	    		return $scope.clientes;
	    	});*/
			return $http.get('http://maps.googleapis.com/maps/api/geocode/json', {
			      params: {
			        address: nombre,
			        sensor: false
			      }
			    }).then(function(response){
			      return response.data.results.map(function(item){
			        return item.formatted_address;
			      });
			    });
	    }

	    $scope.newProyecto = function(){
	    	$scope.proyecto = {
	    		idProyecto:0,
	    		nombre:'',
	    		titulo:'',

	    	};
	    	$scope.formProyecto = 1;
	    }
	    $scope.setProyecto = function(idProyecto){
			$scope.proyecto = $scope.proyectos.filter(function (el) {
												return el.idProyecto == idProyecto;
											})[0];
		};
		$scope.isSelected = function(idProyecto){
			return $scope.proyecto.idProyecto == idProyecto;
		};

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
	    			dataService.removeProyecto(idProyecto).then(function(proyectos){
	    				$scope.proyectos = proyectos;
						$scope.displayedCollection = [].concat(proyectos);
						swal({
							title:"Eliminado!",
							text:"El proyecto a sido eliminado.",
							type:"success",
							timer:2000,
						});
	    			});
	    		});
	    }
	    $scope.editProyecto = function(idProyecto){
	    	$scope.setProyecto(idProyecto);
	    	$scope.formProyecto = 1;
	    }

	    dataService.getProyectos().then(function(proyectos){
	    	$scope.proyectos = proyectos;
			$scope.displayedCollection = [].concat(proyectos);
	    });
		

	});

	app.service(
		"dataService",
		function($http,$q) {

			return({
				//addProyecto:addProyecto,
				getProyectos:getProyectos,
				removeProyecto:removeProyecto,
				getClientes:getClientes,
			});

			function getClientes(nombre){
				var request = $http({
					method:'get',
					url:'clientes/search/'+nombre,
					params:{},
				});
				return request.then(handleSuccess,handleError);
			}

			function getProyectos(){
				var request = $http({
					method:'get',
					url:'proyectos/search',
					params: {},
				});
				return (request.then(handleSuccess,handleError));
			}
			
			function removeProyecto(id){
				var request = $http({
					method:'DELETE',
					url:'proyectos/'+id,
					params:{},
				});
				return (request.then(handleSuccess,handleError));
			}

			function handleError( response ) {

                if (! angular.isObject( response.data ) ||
                    ! response.data.message) {
                    	return( $q.reject( "A ocurrido un error desconocido." ) );
                }
                
                return( $q.reject( response.data.message ) );
            }

            function handleSuccess( response ) {
                return( response.data );
            }
		}
	)

})();
	

