<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('app_user', function (Blueprint $table) {
            $table->id(); // Tự động tạo cột `id` kiểu BIGINT
            $table->string('name');
            $table->string('email')->unique(); // Email phải là duy nhất
            $table->string('password');
            $table->timestamps(); // Tự động thêm cột `created_at` và `updated_at`
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('app_user');
    }
};
