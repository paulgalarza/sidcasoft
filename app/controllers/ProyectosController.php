<?php

class ProyectosController extends BaseController {

	protected $layout = 'layouts.master';

	public function getIndex()
	{
		return View::make('proyectos/index');
	}

	


}
