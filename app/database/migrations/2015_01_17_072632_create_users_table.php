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
        
        Schema::create('usuarios', function($tabla){
 
            $tabla->increments('id');
            $tabla->string('username', 60);
            $tabla->string('password', 100);
            $tabla->timestamps();
 
        });
 
        DB::table('usuarios')->insert(
            array(
                'username' => 'admin',
                'password' => Hash::make('123456')
            )
        );
 
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
