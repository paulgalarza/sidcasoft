<?php



Route::get('/',function()
{
	return View::make('hello');
});


Route::controller('home','HomeController');