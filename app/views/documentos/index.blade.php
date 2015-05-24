@extends('layouts.master')
@section('content')

<div class="" ng-controller="documentosController as documentos">
  <h1 class="text-primary">Documentos</h1>
  <hr>

  <div class="col-md-3 col-sm-3">
    <ul class="nav nav-pills nav-stacked" style="max-width: 300px;">
      <li ng-repeat="option in options" ng-class="{'active':isSelected(option)}" ng-click="setTab(option)"><a href="#" >@{{option}}</a></li>
    </ul>
  </div>
  <div class="col-md-9 col-sm-9">
    <div class="panel panel-primary">
      <div class="panel-heading">@{{selected}}</div>

      <!-- HOME -->
      <div ng-if="isSelected('')" class="panel-body text-primary" style="text-align: center;">
        <i class="fa fa-file-text" style="font-size:500%;"></i>
        <h2 class="">Documentos</h2>
      </div>


      <!-- REQUERIMIENTOS -->
      <div ng-if="isSelected(options[0])" class="panel-body">
        <form class="form-horizontal">

          <div class="form-group" style="text-rigth">
            <div class="col-sm-offset-7">
              <label class="control-label col-md-4">Fecha:</label>
              <div class="col-md-8">
                <input type="text" class="form-control">
              </div>
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-md-4">Nombre de Proyecto:</label>
            <div class="col-md-8">
              <input type="text" class="form-control">
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-md-4">Título de Proyecto:</label>
            <div class="col-md-8">
              <input type="text" class="form-control">
            </div>
          </div>
          
          <div class="form-group">
            <label class="control-label col-md-4">Empresa:</label>
            <div class="col-md-6">
              <div class="input-group">
              <span class="input-group-btn">
                <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
              </span>
              <input required type="text" ng-model="empresa" placeholder="Buscar empresa.." typeahead="empresa as empresa.nombre for empresa in getEmpresas($viewValue)" typeahead-loading="loadingEmpresas" class="form-control">
                <i ng-show="loadingEmpresas" class="glyphicon glyphicon-refresh"></i>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-md-4">Cliente:</label>
            <div class="col-md-6">
              <div class="input-group">
              <span class="input-group-btn">
                <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
              </span>
              <input required type="text" ng-model="cliente" placeholder="Buscar cliente.." typeahead="cliente as cliente.nombre for cliente in getClientes($viewValue)" typeahead-loading="loadingClientes" class="form-control">
                <i ng-show="loadingClientes" class="glyphicon glyphicon-refresh"></i>
              </div>
            </div>
          </div>

            <div class="form-group">
              <label class="control-label col-md-4">Responsable:</label>
              <div class="col-md-8">
                <input type="text" class="form-control">
              </div>
            </div>

            <div class="form-group" style="margin-bottom:40px;">
              <label class="control-label col-md-4">Descripción del Proyecto:</label>
              <div class="col-md-8">
                <textarea class="form-control" rows="10"></textarea>
              </div>
            </div>
      </form>
      <button class="btn btn-default pull-right" ng-click="setForm(0)">Cancelar</button>
      <button class="btn btn-primary pull-right" style="margin-right:5px;"><span class="glyphicon glyphicon-print"> Imprimir</span></button>
      </div>
    </div>
  </div>
</div>
@stop
