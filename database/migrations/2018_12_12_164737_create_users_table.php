<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->integer('id')->unsigned();
            $table->foreign('id')->references('id')->on('personas')->onDelete('cascade');
            
            $table->string('usuario')->unique();
            $table->string('password');
            $table->boolean('condicion')->default(1);

            $table->integer('idrol')->unsigned();
            $table->foreign('idrol')->references('id')->on('roles');


            $table->rememberToken();
            $table->timestamps();
        });
        $encrypted = Crypt::encrypt('ruth');
        DB::table('users')->insert(array('id'=>'1','usuario'=>'ruth','password'=>'$2y$10$SpKQa9GQGSw1Sp4GIdleperzNJbPMP3ZIWpg9dY.ZgvpjJ.G/3c0S', 'condicion'=>'1', 'idrol'=>1, 'remember_token'=>'drs'));
        DB::table('users')->insert(array('id'=>'2','usuario'=>'eliana','password'=>'$2y$10$I2weAKXc/AleHlCmb9c5MuidRTEosJu7dppY4FwDyq7jol0vrmN0e', 'condicion'=>'1', 'idrol'=>2, 'remember_token'=>'drs'));
        DB::table('users')->insert(array('id'=>'3','usuario'=>'jean','password'=>'$2y$10$QIRz49wkFV9SWQvoqShzUuTO.x50QJNKPcRMlV3WQMDrz0j8x88my', 'condicion'=>'1', 'idrol'=>3,'remember_token'=>'drs'));
        DB::table('users')->insert(array('id'=>'4','usuario'=>'mario','password'=>'$2y$10$U1NZfO7NMTDjeAMgK3JDg.IeDMuXwrEJU9yz5LGB4wjLp6Z88mYiO', 'condicion'=>'1', 'idrol'=>4, 'remember_token'=>'drs'));
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
