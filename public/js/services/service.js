angular.module('services',[])

.service("dataService",function($http,$q) {

    return({
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
  });
