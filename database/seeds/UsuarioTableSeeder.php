<?php

use Illuminate\Database\Seeder;

class UsuarioTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for($i=1;$i<=4;$i++){
            DB::table('users')->insert([
                'id'=>random_int(1,10),
                'usuario'=>str_random(10),
                'password'=>str_random(20),
                'idrol'=>random_int(1,4),
                //'rememberToken'=>str_random(20),
                'created_at'=>now(),
                'updated_at'=>now()
            ]);
        }
    }
}
