<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class TicketsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('tickets')->delete();
        
        \DB::table('tickets')->insert(array (
            0 => 
            array (
                'id' => 113,
                'customer_id' => 1,
                'email' => 'jones@techvill.net',
                'name' => 'William Jones',
                'department_id' => 2,
                'priority_id' => 3,
                'ticket_status_id' => 1,
                'ticket_key' => 'TIC-5e96ff969a1cb',
                'subject' => 'Set Up the environment',
                'user_id' => 1,
                'date' => \Carbon::now()->subDays(7)->toDateTimeString(),
                'project_id' => 5,
                'last_reply' => \Carbon::now()->subDays(7)->toDateTimeString(),
                'assigned_member_id' => 1,
            ),
            1 => 
            array (
                'id' => 114,
                'customer_id' => 1,
                'email' => 'jones@techvill.net',
                'name' => 'William Jones',
                'department_id' => 3,
                'priority_id' => 2,
                'ticket_status_id' => 1,
                'ticket_key' => 'TIC-5e971ecb4e2e7',
                'subject' => 'Purchase',
                'user_id' => 1,
                'date' => \Carbon::now()->subDays(7)->toDateTimeString(),
                'project_id' => 2,
                'last_reply' => \Carbon::now()->subDays(7)->toDateTimeString(),
                'assigned_member_id' => 2,
            ),
            2 => 
            array (
                'id' => 115,
                'customer_id' => 4,
                'email' => 'morrison@techvill.net',
                'name' => 'Harvey Morrison',
                'department_id' => 2,
                'priority_id' => 3,
                'ticket_status_id' => 1,
                'ticket_key' => 'TIC-5e971f1286fae',
                'subject' => 'Product Details',
                'user_id' => 1,
                'date' => \Carbon::now()->subDays(7)->toDateTimeString(),
                'project_id' => 3,
                'last_reply' => \Carbon::now()->subDays(7)->toDateTimeString(),
                'assigned_member_id' => 3,
            ),
        ));
        
        
    }
}