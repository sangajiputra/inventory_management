<?php

namespace Database\Seeders\ProductSeeds;

use Illuminate\Database\Seeder;

class ExpensesTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('expenses')->delete();
        
        
        
    }
}