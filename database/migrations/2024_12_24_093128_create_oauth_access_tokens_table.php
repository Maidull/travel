<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOauthAccessTokensTable extends Migration
{
    public function up()
    {
        Schema::create('oauth_access_tokens', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id'); // ID người dùng
            $table->string('token'); // Access token
            $table->timestamp('expires_at')->nullable(); // Thời gian hết hạn
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('oauth_access_tokens');
    }
};

