<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class ExternalLinksTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('external_links')->delete();
        
        \DB::table('external_links')->insert(array (
            0 => 
            array (
                'id' => 1,
                'object_type' => 'sale_orders',
                'object_id' => 5,
                'object_key' => '729707696869a72f5461a88f47993a1c3770a3ab',
                'created_at' => '2021-11-08 03:35:38',
            ),
            1 => 
            array (
                'id' => 2,
                'object_type' => 'sale_orders',
                'object_id' => 9,
                'object_key' => '06be018f690d74a0996292f46b4b08d6f8b4eb11',
                'created_at' => '2021-11-08 03:35:38',
            ),
            2 => 
            array (
                'id' => 3,
                'object_type' => 'tickets',
                'object_id' => 113,
                'object_key' => '7eeb6ce50978bd5be4346ea03868f98a55df6bef',
                'created_at' => '2021-11-08 03:35:38',
            ),
        ));
        
        
    }
}