<?php namespace Slider\Slider\Updates;

use Schema;
use October\Rain\Database\Schema\Blueprint;
use October\Rain\Database\Updates\Migration;

class CreateSlidersTable extends Migration
{
    public function up()
    {
        Schema::create('slider_slider_sliders', function(Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('title');
            $table->text('description');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('slider_slider_sliders');
    }
}
