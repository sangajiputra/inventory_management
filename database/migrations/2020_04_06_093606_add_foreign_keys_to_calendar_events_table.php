<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToCalendarEventsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('calendar_events', function(Blueprint $table)
		{
			$table->foreign('created_by', 'calendar_events_created_by_foreign')->references('id')->on('users')->onUpdate('CASCADE')->onDelete('CASCADE');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('calendar_events', function(Blueprint $table)
		{
			$table->dropForeign('calendar_events_created_by_foreign');
		});
	}

}
