<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UsersTour extends Model
{
    use HasFactory;

    protected $table = 'users_rip'; // Tên bảng
    protected $primaryKey = 'user_trip_id'; // Khóa chính
    protected $fillable = ['user_id', 'trip_id', 'status']; // Các cột được phép thêm/sửa

    // Quan hệ với bảng `tours`
    public function tour()
    {
        return $this->belongsTo(Trip::class, 'trip_id');
    }

    // Quan hệ với bảng `users`
    // public function user()
    // {
    //     return $this->belongsTo(User::class, 'user_id');
    // }
}
