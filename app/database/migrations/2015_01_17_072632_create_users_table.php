<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	 public function up()
    {
        
        Schema::create('usuarios', function($table){
 
            $table->increments('idUsuario');
            $table->string('usuario');
            $table->string('password', 100);
            $table->string('nombre', 60);
            $table->boolean('estatus');
            $table->string('domicilio',100);
            $table->string('telefono',15);
            $table->string('remember_token',100);
            $table->timestamps();
 
        });
    }
 
    /**
     * Revert the changes to the database.
     *
     * @return void
     */
    public function down()
    {
        
        Schema::drop('usuarios');
 
    }

}
