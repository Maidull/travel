<?php
namespace App\Models;

use Laravel\Sanctum\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;

class AppUser extends Authenticatable
{
    use HasApiTokens, No;

    protected $table = 'app_user';

    protected $fillable = [
        'name',
        'email',
        'password',
    ];
}
