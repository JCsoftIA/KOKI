<?php

use Illuminate\Database\Seeder;

class PersonaTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for($i=1;$i<=500;$i++){
            DB::table('personas')->insert([
                'nombre'=>str_random(20),
                'tipo_documento'=>str_random(10),
                'num_documento'=>str_random(11),
                'direccion'=>str_random(50),
                'telefono'=>str_random(9),
                'email'=>str_random(50),
                'created_at'=>now(),
                'updated_at'=>now()
            ]);
        }
    }
}
