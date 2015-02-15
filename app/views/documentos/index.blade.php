@extends('layouts.leftMenu')
@section('content')

<h1 class="text-primary">Documentos</h1>
<hr>
<div class="" ng-controller="documentosController as documentos">

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
        <div class="col-md-6">
          <div class="form-group row">
            <label class="control-label col-md-4">Fecha:</label>
            <div class="col-md-8">
              <input required class="form-control" is-open="openedInicio" datepicker-options="dateOptions" ng-required="true" ng-model="proyecto.fechaInicio" datepicker-popup="@{{format}}">
            </div>
          </div>
        </div>

        <div class="col-md-6" style="text-aling:right;">
          <div class="form-group row">
            <label class="control-label col-md-4">ID Proyecto:</label>
            <div class="col-md-8">
              <input type="text" name="name" value="" class="form-control">
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>

</div>
@stop
