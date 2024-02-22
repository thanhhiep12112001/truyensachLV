<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_user')->nullable();
            $table->string('trans_no');
            $table->string('trans_des')->nullable();
            $table->decimal('trans_amount', 12, 2)->nullable();
            $table->string('trans_type')->nullable();
            $table->string('bank_code')->nullable();
            $table->string('trans_info')->nullable();
            $table->enum('status', ['thanh toán thành công', 'thanh toán thất bại', 'chưa thanh toán'])->default('chưa thanh toán');
            $table->timestamps();
            $table->foreign('id_user')->references('id')->on('users')->cascadeOnUpdate()->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transactions');
    }
}
