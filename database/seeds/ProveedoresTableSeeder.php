<?php

use Illuminate\Database\Seeder;

class ProveedoresTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for($i=1;$i<=100;$i++){
            DB::table('proveedores')->insert([
                'id'=>$i,
                'contacto'=>str_random(20),
                'telefono_contacto'=>str_random(9),
            ]);
        }
    }
}
