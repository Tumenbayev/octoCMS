<?php namespace Adilbek\News\Updates;

use Schema;
use October\Rain\Database\Schema\Blueprint;
use October\Rain\Database\Updates\Migration;

class CreateNewsTable extends Migration
{
    public function up()
     {
         Schema::create('adilbek_news_news', function($table)
         {
             Schema::dropIfExists('adilbek_news_news');
             $table->engine = 'InnoDB';
             $table->increments('id');
             $table->string('title');
             $table->text('description');
             $table->timestamps();
         });
     }
    public function down()
    {
        Schema::dropIfExists('adilbek_news_news');
    }
}
