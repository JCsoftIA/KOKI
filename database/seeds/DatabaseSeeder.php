<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(CategoriaTableSeeder::class);
        $this->call(ProductoTableSeeder::class);
        $this->call(PersonaTableSeeder::class);
        $this->call(ProveedorTableSeeder::class);
        $this->call(RolTableSeeder::class);
        $this->call(UsuarioTableSeeder::class);
        //$this->call(IngresoTableSeeder::class);
    }
}
