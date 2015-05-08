<?php


class UserTableSeeder extends Seeder {
    public function run(){
        User::create(array(
            'usuario'  => 'admin',
            'password'     => Hash::make('admin'),
            'nombre'=> 'paul',
            'estatus' => 1,
            'domicilio' => 'Tecnologico de Culiacan',
            'telefono' => '6677112233',
            'idTipoUsuario'=>'1'
        ));
    }
}