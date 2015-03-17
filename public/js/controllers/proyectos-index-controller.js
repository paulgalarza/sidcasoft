angular.module('sidcasoft')
  .controller('ProyectosIndexController',function($scope){
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
        idEstatus:1,
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
      $scope.newProyecto();
      $scope.SeAgrega = false;
      $scope.SeEdita = true;
      console.log($scope.SeEdita);
      $scope.setProyecto(idProyecto);
      $scope.formProyecto = 1;
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
      $scope.proyecto.idCliente = $scope.cliente.idCliente;
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
  });
