<?php

use Illuminate\Database\Seeder;
use V8CH\Combine\Auth\Database\CombineAuthSeeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
         $this->call(CombineAuthSeeder::class);
        $this->call(WwwV8chComSeeder::class);
    }
}
