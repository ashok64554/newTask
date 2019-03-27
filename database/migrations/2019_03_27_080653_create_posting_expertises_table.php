<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePostingExpertisesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posting_expertises', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid',50);
            $table->unsignedBigInteger('posting_id');
            $table->unsignedBigInteger('expertise_id');
            $table->foreign('posting_id')->references('id')->on('postings')->onDelete('cascade');
            $table->foreign('expertise_id')->references('id')->on('expertises')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('posting_expertises');
    }
}
