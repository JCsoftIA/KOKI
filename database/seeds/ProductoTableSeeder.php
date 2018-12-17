<?php

use Illuminate\Database\Seeder;

class ProductoTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for($i=1;$i<=1000;$i++){
            DB::table('productos')->insert([
                'idcategoria'=>random_int(1,20),
                'codigo'=>str_random(10),
                'nombre'=>str_random(20),
                'precio_venta'=>random_int(1,5)+mt_rand(0,5)/10,
                'stock'=>random_int(1,300),
                'descripcion'=>str_random(100),
                'created_at'=>now(),
                'updated_at'=>now()
            ]);
        }
    }
}
