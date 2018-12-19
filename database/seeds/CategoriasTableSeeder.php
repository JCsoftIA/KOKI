<?php

use Illuminate\Database\Seeder;

class CategoriasTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for($i=1;$i<=20;$i++){
            DB::table('categorias')->insert([
                'nombre'=>str_random(12),
                'descripcion'=>str_random(100),
                'condicion'=>random_int(0,1),
                'created_at'=>now(),
                'updated_at'=>now()
            ]);
        }
    }
}
