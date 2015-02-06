(function(){

	var app = angular.module('app',['smart-table','ui.bootstrap']);


	/****************************************************
	|					CONTROLLERS
	*****************************************************/
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
	    $scope.format = 'dd-MMMM-yyyy';
	    $scope.minDate = new Date();
		$scope.procesos = [];
		$scope.recursos = [];
		$scope.dateOptions = {
			formatYear: 'yy',
		    startingDay: 1
		};
		$scope.estatus = [
			{status:1,descripcion:"Activo"},
			{status:0,descripcion:"Inactivo"}
		];

		$scope.removeRecurso = function(recurso){
			$scope.proyecto.recursos.splice($scope.proyecto.recursos.indexOf(recurso));
		};

		$scope.addRecurso = function(recurso){
			$scope.proyecto.recursos.push(recurso);
			$scope.recurso = '';
		}

	    $scope.open = function($event ,option) {
		    $event.preventDefault();
		    $event.stopPropagation();

		    if(option)
		    	$scope.openedInicio = true;
		    else
		    	$scope.openedFin = true;
		};

	    $scope.getClientes = function(nombre){
	    	return dataService.getClientes(nombre).then(function(clientes){
	    		return clientes;
	    	});
	    }

	    $scope.getRecurso = function(descripcion){
	    	return dataService.getRecursos(descripcion).then(function(recursos){
	    		return recursos.map(function(recursos){
	    			return recursos.descripcion;
	    		});
	    	});
	    }

	    $scope.newProyecto = function(){
	    	$scope.proyecto = {
	    		idProyecto:0,
	    		nombre:'',
	    		titulo:'',
	    		fechaInicio: null,
	    		costoTotal:null,
	    		recursos:[],
	    		idProceso:null,
	    		status:1,
	    		idCliente:0,
	    	};
	    	$scope.setForm(1);
	    }

	    $scope.setProyecto = function(idProyecto){
			$scope.proyecto = $scope.proyectos.filter(function (el) {
												return el.idProyecto == idProyecto;
											})[0];
			dataService.getCliente($scope.proyecto.idCliente).then(function(cliente){
				$scope.cliente = cliente;
			});
		}

		$scope.isSelected = function(idProyecto){
			return $scope.proyecto.idProyecto == idProyecto;
		}

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

	    $scope.addProyecto = function(){
	    	$scope.proyecto.idCliente = $scope.cliente.idCliente;
	    	dataService.addProyecto($scope.proyecto).then(function(proyectos){
	    		$scope.proyectos = proyectos;
	    		$scope.formProyecto = 0;
	    		swal("Guardado!", "Proyecto guardado con éxito!", "success")
	    	});
	    }

	    $scope.setForm = function(value){
	    	$scope.formProyecto = value;
	    	if(value){
	    		$('#js-proyecto-nombre').focus();
	    	}
	    }

	    dataService.getProyectos().then(function(proyectos){
	    	$scope.proyectos = proyectos;
			$scope.displayedCollection = [].concat(proyectos);
	    });
		dataService.getProcesos().then(function(procesos){
			$scope.procesos = procesos;
		});
	});

	/****************************************************
	|					DIRECTIVAS
	*****************************************************/
	app.directive('ngEnter', function () {
	    return function (scope, element, attrs) {
	        element.bind("keydown keypress", function (event) {
	            if(event.which === 13) {
	                scope.$apply(function (){
	                    scope.$eval(attrs.ngEnter);
	                });

	                event.preventDefault();
	            }
	        });
	    };
	});

	app.directive('validNumber', function() {
	  return {
	    require: '?ngModel',
	    link: function(scope, element, attrs, ngModelCtrl) {
	      if(!ngModelCtrl) {
	        return; 
	      }

	      ngModelCtrl.$parsers.push(function(val) {
	        if (angular.isUndefined(val)) {
	            var val = '';
	        }
	        var clean = val.replace( /[^0-9]+/g, '');
	        if (val !== clean) {
	          ngModelCtrl.$setViewValue(clean);
	          ngModelCtrl.$render();
	        }
	        return clean;
	      });

	      element.bind('keypress', function(event) {
	        if(event.keyCode === 32) {
	          event.preventDefault();
	        }
	      });
	    }
	  };
	});
	
	/****************************************************
	|			LLAMADAS AL SERVIDOR PARA TRAER DATOS
	*****************************************************/
	app.service(
		"dataService",
		function($http,$q) {

			return({
				//addProyecto:addProyecto,
				getProyectos:getProyectos,
				removeProyecto:removeProyecto,
				getClientes:getClientes,
				getProcesos:getProcesos,
				getRecursos:getRecursos,
				addProyecto:addProyecto,
				getCliente:getCliente
			});

			function getRecursos(descripcion){
				return $http({
					method:'get',
					url:'recursos/search/'+descripcion,
					params:{}
				}).then(handleSuccess,handleError);
			}

			function getProcesos(){
				return $http({
					method:'get',
					url:'procesos/search',
					params:{}
				}).then(handleSuccess,handleError);
			}

			function getClientes(nombre){
				return $http({
					method:'get',
					url:'clientes/search/'+nombre,
					params:{},
				}).then(handleSuccess,handleError);
			}

			function getCliente(id){
				return $http({
					method:'get',
					url:'cliente/'+id,
					params:{}
				}).then(handleSuccess,handleError)
			}

			function addProyecto(proyecto){
				return $http({
					method:'POST',
					url:'proyectos/add',
					params:proyecto,
					headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
				}).then(handleSuccess,handleError);
			}

			function getProyectos(){
				return $http({
					method:'get',
					url:'proyectos/search',
					params: {},
				}).then(handleSuccess,handleError);
			}
			
			function removeProyecto(id){
				return $http({
					method:'DELETE',
					url:'proyectos/'+id,
					params:{},
				}).then(handleSuccess,handleError);
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
	

