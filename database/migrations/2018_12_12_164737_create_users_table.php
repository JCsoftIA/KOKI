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
