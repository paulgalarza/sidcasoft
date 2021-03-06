(function(){

	var app = angular.module('app',['smart-table','ui.bootstrap']);


	/****************************************************
	|					CONTROLLERS
	*****************************************************/


	/***			HOME CONTROLLER 												***/
	app.controller('homeController',function($http,$scope,dataService){

		$scope.proyectos = [];
		$scope.displayedCollection = [];
		//$scope.proyecto = {};


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

	//			PROYECTOS CONTROLLER
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
			{status:1,descripcion:"Propuesto"},
			{status:0,descripcion:"Cancelado"},
			{status:2,descripcion:"Activo"}
		];

		dataService.getUsuarioRAP().then(function(usuarioRAP){
			$scope.usuarioRAP = usuarioRAP;
		});

		dataService.getUsuarioRCP().then(function(usuarioRCP){
			$scope.usuarioRCP = usuarioRCP;
		});

		dataService.getUsuarioAnalista().then(function(usuarioAnalista){
			$scope.usuarioAnalista = usuarioAnalista;
		});

		dataService.getUsuarioArquitecto().then(function(usuarioArquitecto){
			$scope.usuarioArquitecto = usuarioArquitecto;
		});

		dataService.getUsuarioDesarrollador().then(function(usuarioDesarrollador){
			$scope.usuarioDesarrollador = usuarioDesarrollador;
		});

		dataService.getUsuarioTester().then(function(usuarioTester){
			$scope.usuarioTester = usuarioTester;
		});

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

	    /*$scope.getClientes = function(nombre){
	    	return dataService.getClientes(nombre).then(function(clientes){
	    		return clientes;
	    	});
	    }*/

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
	    		usuarioRAP:null,
	    		usuarioRCP:null,
	    		usuarioAnalista:null,
	    		usuarioArquitecto:null,
	    		usuarioDesarrollador:null,
	    		usuarioTester:null,
	    		idCliente:0,
	    	};
	    	$scope.SeAgrega = true;
	    	console.log($scope.SeAgrega);
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
	    	if(Status === 1)
	    		Status = 'Propuesto';
	    	else if(Status === 2)
	    		Status = 'Activo';
	    	else
	    		Status = 'Cancelado';
	    	return Status;
	    	//return Status ? 'Propuesto' : 'Activo';
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
	    	$scope.newProyecto();
	    	$scope.SeAgrega = false;
	    	$scope.SeEdita = true;
	    	console.log($scope.SeEdita);
	    	$scope.setProyecto(idProyecto);
	    	$scope.formProyecto = 1;

	    	dataService.getUsuarioRAP2(idProyecto).then(function(usuarioRAP2){
				$scope.usuarioRAP2 = usuarioRAP2;
			});

			dataService.getUsuarioRCP2(idProyecto).then(function(usuarioRCP2){
				$scope.usuarioRCP2 = usuarioRCP2;
			});

			dataService.getUsuarioAnalista2(idProyecto).then(function(usuarioAnalista2){
				$scope.usuarioAnalista2 = usuarioAnalista2;
			});

			dataService.getUsuarioArquitecto2(idProyecto).then(function(usuarioArquitecto2){
				$scope.usuarioArquitecto2 = usuarioArquitecto2;
			});

			dataService.getUsuarioDesarrollador2(idProyecto).then(function(usuarioDesarrollador2){
				$scope.usuarioDesarrollador2 = usuarioDesarrollador2;
			});

	    	dataService.getUsuarioTester2(idProyecto).then(function(usuarioTester2){
				$scope.usuarioTester2 = usuarioTester2;
			});
	    }

	    $scope.guardaCambiosProyecto = function(idProyecto){
	    	$scope.setProyecto(idProyecto);
	    	$scope.formProyecto = 1;

	    	dataService.editProyecto(idProyecto, $scope.proyecto).then(function(proyectos){
	    		$scope.proyectos = proyectos;
	    		$scope.formProyecto = 0;
	    		swal("Editado", "¡Proyecto modificado con éxito!", "success")
	    	});
	    }

	    $scope.addProyecto = function(){
	    	//$scope.proyecto.idCliente = $scope.cliente.idCliente;
	    	if($scope.proyecto.idProyecto){
	    		dataService.editProyecto($scope.proyecto).then(function(response){
	    			console.log(response);
	    		});
	    		return;
	    	}
	    	dataService.addProyecto($scope.proyecto).then(function(proyectos){
	    		$scope.proyectos = proyectos;
	    		$scope.formProyecto = 0;
	    		swal("Guardado", "¡Proyecto guardado con éxito!", "success")
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

		dataService.getEmpresas().then(function(empresas){
			$scope.empresas = empresas;
		});

		dataService.getClientes().then(function(clientes){
			$scope.clientes = clientes;
		});
	});

	//USUARIOS CONTROLLER

	app.controller('usuariosController', function($http,$scope,dataService){

		$scope.itemsByPage=10;
	    $scope.usuarios = [];
	    $scope.displayedCollection = [];
	    $scope.formUsuario = 0;
	    $scope.usuario = {};
	    $scope.asyncSelected = undefined;
	    $scope.format = 'dd-MMMM-yyyy';
	    $scope.minDate = new Date();
		$scope.estatus = [
			{status:1,descripcion:"Activo"},
			{status:0,descripcion:"Inactivo"}
		];

		dataService.getUsuarios().then(function(usuarios){
	    	$scope.usuarios = usuarios;
			$scope.displayedCollection = [].concat(usuarios);
	    });
	    dataService.getTipoUsuario().then(function(tipoUsuario){
			$scope.tipoUsuario = tipoUsuario;
		});

	    $scope.getStatus = function(Status){
	    	return Status ? 'Activo' : 'Baja';
	    }

	    //Función que regresa el nombre del proyecto recibiendo el ID del mismo
	    $scope.getNombreProy = function(NumUsuario, NumProyecto)
	    {
	    	if(NumProyecto!=null)
	    	{
	    		var parametros = "opc=obtenNombreProy"+"&numproy="+NumProyecto+"&id="+Math.random();

	    		$.ajax({
					cache:false,
					url: "data/obtenernombre.php",
					type: "POST",
					dataType: "json",
					data: parametros,
					success: function(response){
						if(response.respuesta == true) 
						{
							console.log("Se accedió al archivo con éxito");
							$("." + NumUsuario).html(response.nombre);
							return response.nombre;
						}
						else
							console.log("Error al intentar acceder al archivo");
					},
					error: function(xhr, ajaxOptions, x){
						console.log("Error de conexión");
					}
				});
		    	/*dataService.getNombreProyecto(NumProyecto).then(function(nombreProy){
		    		$scope.ProyectoAsignado = nombreProy;
		    	});*/
		    	//return NumProyecto;
	    	}

	    }

	    $scope.isSelected = function(idUsuario){
			return $scope.usuario.idUsuario == idUsuario;
		}

		$scope.newUsuario = function(){
	    	$scope.usuario = {
	    		idUsuario:0,
	    		usuario:'',
	    		email:'',
	    		nombre: '',
	    		domicilio:'',
	    		telefono:'',
	    		password:'',
	    		idTipoUsuario:null,
	    		estatus:1,
	    		ProyectoAsignado:0,
	    	};
	    	$scope.SeAgrega = true;
	    	console.log($scope.SeAgrega);
	    	$scope.setForm(1);
	    }

	    $scope.setForm = function(value){
	    	$scope.formUsuario = value;
	    	if(value){
	    		$('#js-usuario-nombre').focus();
	    	}
	    }

		$scope.setUsuario = function(idUsuario){
			$scope.usuario = $scope.usuarios.filter(function (el) {
												return el.idUsuario == idUsuario;
											})[0];
		}

	    $scope.editUsuario = function(idUsuario){
	    	$scope.newUsuario();
	    	$scope.SeAgrega = false;
	    	$scope.SeEdita = true;
	    	console.log($scope.SeEdita);
	    	$scope.setUsuario(idUsuario);
	    	$scope.formUsuario = 1;
	    }

	    $scope.guardaCambiosUsuario = function(idUsuario){
	    	$scope.setUsuario(idUsuario);
	    	$scope.formUsuario = 1;

	    	dataService.editUsuario(idUsuario, $scope.usuario).then(function(usuarios){
	    		$scope.usuarios = usuarios;
	    		$scope.formUsuario = 0;
	    		swal("Editado", "¡Usuario modificado con éxito!", "success")
	    	});
	    }

	    $scope.addUsuario = function(){
	    	dataService.addUsuario($scope.usuario).then(function(usuarios){
	    		$scope.usuarios = usuarios;
	    		$scope.formUsuario = 0;
	    		swal("Guardado", "¡Usuario editado con éxito!", "success")
	    	});
	    }

	    $scope.removeUsuario = function(idUsuario){
	    	swal({
	    		title: "¿Desea eliminar el usuario?",
	    		text: "No podras recuperar el usuario despues de ser eliminado!",
	    		type: "warning",
	    		showCancelButton: true,
	    		confirmButtonColor: "#DD6B55",
	    		confirmButtonText: "Si, eliminalo!",
	    		closeOnConfirm: false },
	    		function(){
	    			dataService.removeUsuario(idUsuario).then(function(usuarios){
	    				$scope.usuarios = usuarios;
						$scope.displayedCollection = [].concat(usuarios);
						swal({
							title:"Eliminado!",
							text:"El usuario ha sido eliminado.",
							type:"success",
							timer:2000,
						});
	    			});
	    		});
	    }


	});

	//EMPRESAS CONTROLLER

	app.controller('empresasController', function($http,$scope,dataService){

		$scope.itemsByPage=10;
	    $scope.empresas = [];
	    $scope.displayedCollection = [];
	    $scope.formEmpresa = 0;
	    $scope.empresa = {};
	    $scope.asyncSelected = undefined;
	    $scope.format = 'dd-MMMM-yyyy';
	    $scope.minDate = new Date();
		$scope.estatus = [
			{status:1,descripcion:"Activo"},
			{status:0,descripcion:"Inactivo"}
		];

		dataService.getEmpresas().then(function(empresas){
	    	$scope.empresas = empresas;
			$scope.displayedCollection = [].concat(empresas);
	    });

	    $scope.getStatus = function(Status){
	    	return Status ? 'Activo' : 'Baja';
	    }

	    $scope.isSelected = function(idEmpresa){
			return $scope.empresa.idEmpresa == idEmpresa;
		}

		$scope.newEmpresa = function(){
	    	$scope.empresa = {
	    		idEmpresa:0,
	    		nombre: '',
	    		encargado: '',
	    		RFC:'',
	    		direccion:'',
	    		telefono:'',
	    		estatus:1,
	    	};
	    	$scope.SeAgrega = true;
	    	console.log($scope.SeAgrega);
	    	$scope.setForm(1);
	    }

	    $scope.setForm = function(value){
	    	$scope.formEmpresa = value;
	    	if(value){
	    		$('#js-empresa-nombre').focus();
	    	}
	    }

		$scope.setEmpresa = function(idEmpresa){
			$scope.empresa = $scope.empresas.filter(function (el) {
												return el.idEmpresa == idEmpresa;
											})[0];
		}

	    $scope.editEmpresa = function(idEmpresa){
	    	$scope.newEmpresa();
	    	$scope.SeAgrega = false;
	    	$scope.SeEdita = true;
	    	console.log($scope.SeEdita);
	    	$scope.setEmpresa(idEmpresa);
	    	$scope.formEmpresa = 1;
	    }

	    $scope.guardaCambiosEmpresa = function(idEmpresa){
	    	$scope.setEmpresa(idEmpresa);
	    	$scope.formEmpresa = 1;

	    	dataService.editEmpresa(idEmpresa, $scope.empresa).then(function(empresas){
	    		$scope.empresas = empresas;
	    		$scope.formEmpresa = 0;
	    		swal("Editado", "¡Empresa modificada con éxito!", "success")
	    	});
	    }

	    $scope.addEmpresa = function(){
	    	dataService.addEmpresa($scope.empresa).then(function(empresas){
	    		$scope.empresas = empresas;
	    		$scope.formEmpresa = 0;
	    		swal("Guardada", "¡Empresa dada de alta con éxito!", "success")
	    	});
	    }

	    $scope.removeEmpresa = function(idEmpresa){
	    	swal({
	    		title: "¿Desea eliminar la empresa?",
	    		text: "No podras recuperar la empresa despues de ser eliminada!",
	    		type: "warning",
	    		showCancelButton: true,
	    		confirmButtonColor: "#DD6B55",
	    		confirmButtonText: "Si, eliminala!",
	    		closeOnConfirm: false },
	    		function(){
	    			dataService.removeEmpresa(idEmpresa).then(function(empresas){
	    				$scope.empresas = empresas;
						$scope.displayedCollection = [].concat(empresas);
						swal({
							title:"Eliminada!",
							text:"La empresa ha sido eliminada.",
							type:"success",
							timer:2000,
						});
	    			});
	    		});
	    }


	});

	//CLIENTES CONTROLLER

	app.controller('clientesController', function($http,$scope,dataService){

		$scope.itemsByPage=10;
	    $scope.clientes = [];
	    $scope.displayedCollection = [];
	    $scope.formCliente = 0;
	    $scope.cliente = {};
	    $scope.asyncSelected = undefined;
	    $scope.format = 'dd-MMMM-yyyy';
	    $scope.minDate = new Date();
	    $scope.empresas = [];
	    $scope.estatus = [
			{status:1,descripcion:"Activo"},
			{status:0,descripcion:"Inactivo"}
		];

		dataService.getClientes('').then(function(clientes){
			console.log(clientes);
	    	$scope.clientes = clientes;
			$scope.displayedCollection = [].concat(clientes);
	    });

	    dataService.getEmpresas().then(function(empresas){
			$scope.empresas = empresas;
		});

		$scope.getStatus = function(Status){
	    	return Status ? 'Activo' : 'Baja';
	    }

	    $scope.isSelected = function(idCliente){
			return $scope.cliente.idCliente == idCliente;
		}

		$scope.newCliente = function(){
	    	$scope.cliente = {
	    		idCliente:0,
	    		nombre: '',
	    		telefono:'',
	    		email:'',
	    	};
	    	$scope.SeAgrega = true;
	    	console.log($scope.SeAgrega);
	    	$scope.setForm(1);
	    }

	    $scope.setForm = function(value){
	    	$scope.formCliente = value;
	    	if(value){
	    		$('#js-cliente-nombre').focus();
	    	}
	    }

		$scope.setCliente = function(idCliente){
			$scope.cliente = $scope.clientes.filter(function (el) {
												return el.idCliente == idCliente;
											})[0];
		}

	    $scope.editCliente = function(idCliente){
	    	$scope.newCliente();
	    	$scope.SeAgrega = false;
	    	$scope.SeEdita = true;
	    	console.log($scope.SeEdita);
	    	$scope.setCliente(idCliente);
	    	$scope.formCliente = 1;
	    }

	    $scope.guardaCambiosCliente = function(idCliente)
	    {
	    	$scope.setCliente(idCliente);
	    	$scope.formCliente = 1;

	    	dataService.editCliente(idCliente, $scope.cliente).then(function(clientes){
	    		$scope.clientes = clientes;
	    		$scope.formCliente = 0;
	    		swal("Editado", "¡Cliente modificado con éxito!", "success")
	    	});
	    }

	    $scope.addCliente = function(){
	    	dataService.addCliente($scope.cliente).then(function(clientes){
	    		$scope.clientes = clientes;
	    		$scope.formCliente = 0;
	    		swal("Guardado!", "¡Cliente dado de alta con éxito!", "success")
	    	});
	    }

	    $scope.removeCliente = function(idCliente){
	    	swal({
	    		title: "¿Desea eliminar el cliente?",
	    		text: "No podras recuperar el cliente después de ser eliminado!",
	    		type: "warning",
	    		showCancelButton: true,
	    		confirmButtonColor: "#DD6B55",
	    		confirmButtonText: "Si, eliminalo!",
	    		closeOnConfirm: false },
	    		function(){
	    			dataService.removeCliente(idCliente).then(function(clientes){
	    				$scope.clientes = clientes;
						$scope.displayedCollection = [].concat(clientes);
						swal({
							title:"Eliminado!",
							text:"El cliente ha sido eliminado.",
							type:"success",
							timer:2000,
						});
	    			});
	    		});
	    }


	});

	/***			DOCUMENTOS CONTROLLER 												***/
	app.controller('documentosController',function($http,$scope,dataService){
			$scope.options = [
				"Descripción de proyecto",
				"Requerimientos",
				"Plan de proyecto",
				"Reporte de actividades",
				"Reporte de evolución"
			];

			$scope.selected = "";

			$scope.isSelected = function(option){
				return $scope.selected == option;
			}

			$scope.setTab = function(tab){
				$scope.selected = tab;
			}

			$scope.getClientes = function(nombre){
	    	return dataService.getClientes(nombre).then(function(clientes){
	    		return clientes;
	    	});

	    }

	    	$scope.getEmpresas = function(nombre){
	    	return dataService.getEmpresas(nombre).then(function(empresas){
	    		return empresas;
	    	});
	    }
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
				getUsuarioRAP:getUsuarioRAP,
				getUsuarioRCP:getUsuarioRCP,
				getUsuarioAnalista:getUsuarioAnalista,
				getUsuarioArquitecto:getUsuarioArquitecto,
				getUsuarioDesarrollador:getUsuarioDesarrollador,
				getUsuarioTester:getUsuarioTester,
				getUsuarioRAP2:getUsuarioRAP2,
				getUsuarioRCP2:getUsuarioRCP2,
				getUsuarioAnalista2:getUsuarioAnalista2,
				getUsuarioArquitecto2:getUsuarioArquitecto2,
				getUsuarioDesarrollador2:getUsuarioDesarrollador2,
				getUsuarioTester2:getUsuarioTester2,
				getNombreProyecto:getNombreProyecto,
				getClientes:getClientes,
				getProcesos:getProcesos,
				getRecursos:getRecursos,
				addProyecto:addProyecto,
				editProyecto:editProyecto,
				getCliente:getCliente,
				getUsuarios:getUsuarios,
				getTipoUsuario:getTipoUsuario,
				addUsuario:addUsuario,
				editUsuario:editUsuario,
				removeUsuario:removeUsuario,
				getEmpresas:getEmpresas,
				addEmpresa:addEmpresa,
				editEmpresa:editEmpresa,
				removeEmpresa:removeEmpresa,
				addCliente:addCliente,
				editCliente:editCliente,
				removeCliente:removeCliente
			});

			function getUsuarioRAP () {
				return $http({
					method:'get',
					url:'usuariorap/search',
					params:{}
				}).then(handleSuccess,handleError);
			}

			function getUsuarioRCP () {
				return $http({
					method:'get',
					url:'usuariorcp/search',
					params:{}
				}).then(handleSuccess,handleError);
			}

			function getUsuarioAnalista () {
				return $http({
					method:'get',
					url:'usuarioanalista/search',
					params:{}
				}).then(handleSuccess,handleError);
			}

			function getUsuarioArquitecto () {
				return $http({
					method:'get',
					url:'usuarioarquitecto/search',
					params:{}
				}).then(handleSuccess,handleError);
			}

			function getUsuarioDesarrollador () {
				return $http({
					method:'get',
					url:'usuariodesarrollador/search',
					params:{}
				}).then(handleSuccess,handleError);
			}

			function getUsuarioTester () {
				return $http({
					method:'get',
					url:'usuariotester/search',
					params:{}
				}).then(handleSuccess,handleError);
			}

			//Editar tipos de usuario
			function getUsuarioRAP2 (id) {
				return $http({
					method:'get',
					url:'usuariorap2/search/'+id,
					params:{}
				}).then(handleSuccess,handleError);
			}

			function getUsuarioRCP2 (id) {
				return $http({
					method:'get',
					url:'usuariorcp2/search/'+id,
					params:{}
				}).then(handleSuccess,handleError);
			}

			function getUsuarioAnalista2 (id) {
				return $http({
					method:'get',
					url:'usuarioanalista2/search/'+id,
					params:{}
				}).then(handleSuccess,handleError);
			}

			function getUsuarioArquitecto2 (id) {
				return $http({
					method:'get',
					url:'usuarioarquitecto2/search/'+id,
					params:{}
				}).then(handleSuccess,handleError);
			}

			function getUsuarioDesarrollador2 (id) {
				return $http({
					method:'get',
					url:'usuariodesarrollador2/search/'+id,
					params:{}
				}).then(handleSuccess,handleError);
			}

			function getUsuarioTester2 (id) {
				return $http({
					method:'get',
					url:'usuariotester2/search/'+id,
					params:{}
				}).then(handleSuccess,handleError);
			}

			//Continúa...

			function getNombreProyecto(NumProy){
				return $http({
					method:'get',
					url:'clientes/search/'+NumProy,
					params:{}
				}).then(handleSuccess,handleError);
			}

			function removeCliente(id){
				return $http({
					method:'DELETE',
					url:'clientes/'+id,
					params:{},
				}).then(handleSuccess,handleError);
			}

			function editCliente(){
				return $http({
					method:'post',
					url:'clientes/edit',
					params:{}
				}).then(handleSuccess,handleError);
			}

			function addCliente (cliente){
				return $http({
					method:'post',
					url:'clientes/add',
					params:cliente,
				}).then(handleSuccess,handleError);
			}

			function removeEmpresa(id){
				return $http({
					method:'DELETE',
					url:'empresas/'+id,
					params:{},
				}).then(handleSuccess,handleError);
			}

			function editEmpresa(id, empresa){
				return $http({
					method:'put',
					url:'empresas/'+id,
					params:empresa,
				}).then(handleSuccess,handleError);
			}

			function addEmpresa (empresa){
				return $http({
					method:'post',
					url:'empresas/add',
					params:empresa,
				}).then(handleSuccess,handleError);

			}

			function getEmpresas () {
				return $http({
					method:'get',
					url:'empresas/search',
					params:{}
				}).then(handleSuccess,handleError);
			}

			function removeUsuario(id){
				return $http({
					method:'DELETE',
					url:'usuarios/'+id,
					params:{},
				}).then(handleSuccess,handleError);
			}

			function editUsuario(id, usuario){
				return $http({
					method:'put',
					url:'usuarios/'+id,
					params:usuario,
				}).then(handleSuccess,handleError);
			}

			function addUsuario (usuario){
				return $http({
					method:'post',
					url:'usuarios/add',
					params:usuario,
				}).then(handleSuccess,handleError);

			}

			function getUsuarios () {
				return $http({
					method:'get',
					url:'usuarios/search',
					params:{}
				}).then(handleSuccess,handleError);
			}

			function getTipoUsuario () {
				return $http({
					method:'get',
					url:'tipousuario/search',
					params:{}
				}).then(handleSuccess,handleError);
			}

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

			/*function getClientes(nombre){
				return $http({
					method:'get',
					url:nombre ? 'clientes/search/'+nombre:'clientes/search',
					params:{},
				}).then(handleSuccess,handleError);
			}*/

			function getClientes () {
				return $http({
					method:'get',
					url:'clientes/search',
					params:{}
				}).then(handleSuccess,handleError);
			}

			function getCliente(id){
				return $http({
					method:'get',
					url:'cliente/'+id,
					params:{}
				}).then(handleSuccess,handleError)
			}

			function editCliente(id, cliente)
			{
				return $http({
					method:'put',
					url:'cliente/'+id,
					params:cliente,
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
			function editProyecto(id, proyecto){
				return $http({
					method:'put',
					url:'proyectos/'+id,
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
                    	return( $q.reject( "Ha ocurrido un error desconocido." ) );
                }
                return( $q.reject( response.data.message ) );
            }

            function handleSuccess( response ) {
                return( response.data );
            }
		}
	)

})();
