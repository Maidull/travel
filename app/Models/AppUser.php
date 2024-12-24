<?php
namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable; 
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Laravel\Passport\HasApiTokens;

class AppUser extends Authenticatable 
{
    use HasFactory, HasApiTokens;

    protected $table = 'app_user';
    protected $fillable = ['name', 'email', 'password'];

    /**
     * Xác định cột ID được sử dụng để xác thực.
     *
     * @return mixed
     */
    public function getAuthIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Lấy giá trị của mật khẩu người dùng.
     *
     * @return string
     */
    public function getAuthPassword()
    {
        return $this->password;
    }

    public function tokens(): HasMany
    {
        return $this->hasMany(OauthAccessToken::class, 'user_id');
    }
}
