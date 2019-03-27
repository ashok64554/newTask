<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePostingWorkersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posting_workers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid',50);
            $table->unsignedBigInteger('worker_id');
            $table->unsignedBigInteger('posting_id');
            $table->enum('status',['matched','reject','canceled'])->default('matched');
            $table->foreign('worker_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('posting_id')->references('id')->on('postings')->onDelete('cascade');
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
        Schema::dropIfExists('posting_workers');
    }
}
