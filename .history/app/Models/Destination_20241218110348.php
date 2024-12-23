namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Destinations extends Model
{
    use CrudTrait;
    use HasFactory;

    protected $table = 'destinations'; // Tên bảng trong cơ sở dữ liệu
    protected $primaryKey = 'destination_id'; // Khóa chính
    protected $guarded = ['destination_id']; // Các trường không được phép gán tự động

    // Quan hệ với bảng trips
    public function trips()
    {
        return $this->hasMany(\App\Models\Trip::class, 'destination_id');
    }
}
