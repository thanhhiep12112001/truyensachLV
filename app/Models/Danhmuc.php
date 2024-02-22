<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Truyen;

class Danhmuc extends Model
{
    use HasFactory;
    public $timestamps = false;//lưu tgian thêm tạo mới
    protected $fillable = [
        'ten_danhmuc','kichhoat','slug_danhmuc','mo_ta'
    ];
    protected $primaryKey='id';
    protected $table='danhmuc';

    public function truyen()
    {
         return $this->hasMany('App\Models\Truyen');   
    }

}
