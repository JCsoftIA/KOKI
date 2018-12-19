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
        $this->call(CategoriasTableSeeder::class);
        $this->call(ProductosTableSeeder::class);
        $this->call(PersonasTableSeeder::class);
        $this->call(ProveedoresTableSeeder::class);
        $this->call(IngresosTableSeeder::class);
        $this->call(DetalleIngresosTableSeeder::class);
        $this->call(VentasTableSeeder::class);
        $this->call(DetalleVentasTableSeeder::class);

    }
}
