<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePersonasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('personas', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre', 100)->unique();
            $table->string('tipo_documento', 20)->nullable();
            $table->string('num_documento', 20)->nullable();
            $table->string('direccion', 70)->nullable();
            $table->string('telefono', 20)->nullable();
            $table->string('email', 50)->nullable();
            $table->timestamps();
        });
        DB::table('personas')->insert(array('id'=>'1','nombre'=>'ruth','tipo_documento'=>'DNI', 'num_documento'=>'12345678', 'direccion'=>'jr no se que', 'telefono'=>'8931978', 'email'=>'ruth@web.com'));
        DB::table('personas')->insert(array('id'=>'2','nombre'=>'eliana','tipo_documento'=>'DNI', 'num_documento'=>'12345678', 'direccion'=>'jr no se que', 'telefono'=>'8931978', 'email'=>'ruth@web.com'));
        DB::table('personas')->insert(array('id'=>'3','nombre'=>'jean','tipo_documento'=>'DNI', 'num_documento'=>'12345678', 'direccion'=>'jr no se que', 'telefono'=>'8931978', 'email'=>'ruth@web.com'));
        DB::table('personas')->insert(array('id'=>'4','nombre'=>'mario','tipo_documento'=>'DNI', 'num_documento'=>'12345678', 'direccion'=>'jr no se que', 'telefono'=>'8931978', 'email'=>'ruth@web.com'));
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('personas');
    }
}
