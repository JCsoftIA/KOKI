<?php

use Illuminate\Database\Seeder;

class IngresoTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for($i=1;$i<=1000;$i++){
            DB::table('ingresos')->insert([
                'idproveedor'=>random_int(1,500),
                'idusuario'=>random_int(1,4),
                'tipo_comprobante'=>str_random(10),
                'serie_comprobante'=>str_random(7),
                'num_comprobante'=>str_random(10),
                'fecha_hora'=>now(),
                'impuesto'=>0.18,
                'total'=>random_int(1,500)+mt_rand(0,99)/10,
                'estado'=>str_random(15),
                'created_at'=>now(),
                'updated_at'=>now()
            ]);
        }
    }
}
