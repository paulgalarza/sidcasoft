'use strict'

angular.module('sidcasoft')
  .service("dataService",function($http,$q) {
		return({
			//addProyecto:addProyecto,
			getProyectos:getProyectos,
			removeProyecto:removeProyecto,
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

		function getClientes(nombre){
			return $http({
				method:'get',
				url:nombre ? 'clientes/search/'+nombre:'clientes/search',
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
	});
