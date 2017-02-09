<?php namespace Team\Team\Updates;

use Schema;
use October\Rain\Database\Schema\Blueprint;
use October\Rain\Database\Updates\Migration;

class CreateTeamsTable extends Migration
{
    public function up()
    {
        Schema::create('team_team_teams', function(Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('name');
            $table->text('description');
            $table->string('position');
            $table->integer('is_published');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('team_team_teams');
    }
}
