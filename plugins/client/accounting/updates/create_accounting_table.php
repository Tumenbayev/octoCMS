<?php namespace Client\Accounting\Updates;

use Schema;
use October\Rain\Database\Schema\Blueprint;
use October\Rain\Database\Updates\Migration;

class CreateAccountingTable extends Migration
{
    public function up()
    {
        Schema::create('client_accounting_accounting', function(Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->integer('client_id');
            $table->string('price');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('client_accounting_accounting');
    }
}
