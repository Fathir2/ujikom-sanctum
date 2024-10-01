<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class information extends Model
{
    use HasFactory;

    protected $fillable = ['title', 'description',  'date'];
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}


