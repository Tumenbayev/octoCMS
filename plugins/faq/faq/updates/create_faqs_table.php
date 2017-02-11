<?php namespace Faq\Faq\Updates;

use Schema;
use October\Rain\Database\Schema\Blueprint;
use October\Rain\Database\Updates\Migration;

class CreateFaqsTable extends Migration
{
    public function up()
    {
        Schema::create('faq_faq_faqs', function(Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('name');
            $table->string('email');
            $table->text('comment');
            $table->text('answer')->nullable();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('faq_faq_faqs');
    }
}
