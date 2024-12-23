namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UsersTour extends Model
{
    protected $table = 'users_tour';
    protected $primaryKey = 'user_tour_id';
    protected $fillable = ['user_id', 'tour_id', 'status'];

    public function tour()
    {
        return $this->belongsTo(Tour::class, 'tour_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
