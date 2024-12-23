<?php
namespace App\Models;

use Laravel\Sanctum\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class AppUser extends Authenticatable
{
    use HasApiTokens, HasFac, Notifiable;

    protected $table = 'app_user';

    protected $fillable = [
        'name',
        'email',
        'password',
    ];
}
