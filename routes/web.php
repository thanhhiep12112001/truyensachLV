<?php

use App\Http\Controllers\BinhluanController;
use App\Http\Controllers\ChuongController;
use App\Http\Controllers\DanhmucController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\IndexController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\TheloaiController;
use App\Http\Controllers\TransactionController;
use App\Http\Controllers\TruyenController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::get('/', [IndexController::class, 'home']);
Route::get('/truyen-hay', [IndexController::class, 'home'])->name('home_user');
Route::get('/the-loai/{slug}', [IndexController::class, 'theloai']);
Route::get('/danh-muc/{slug}', [IndexController::class, 'danhmuc']);
Route::get('/xem-truyen/{slug}', [IndexController::class, 'xemtruyen'])->name('xem-truyen');
Route::get('/xem-chuong/{slug}', [IndexController::class, 'xemchuong']);
Route::get('/tag/{tag}', [IndexController::class, 'tag']);
Route::post('/theodoi/{id}', [IndexController::class, 'theodoi'])->name('theodoi');
Route::post('/tim-kiem', [IndexController::class, 'timkiem']);
Route::post('/timkiem-ajax', [IndexController::class, 'timkiem_ajax']);
Route::delete('botheodoi/{id}', [IndexController::class, 'botheodoi'])->name('botheodoi');
Route::get('/danh-sach-yeu-thich', [IndexController::class, 'danhSachYeuThich'])->name('danh-sach-yeu-thich');
Route::resource('/binhluan', BinhluanController::class);
//Route::get('/{any}', [IndexController::class, 'home'])->where('any', '.*');

Route::get('/nang-cap-tai-khoan', function () {
    return view('pages/nangcap');
});
Route::get('/trang-ca-nhan', function () {
    if (\auth()->check()) {
        $user = \App\Models\User::all()->where('id', '=', \auth()->user()->id)->first();
        $truyen_theo_doi = $user->likes;
//        dd($truyen_theo_doi);
        return view('pages/trangcanhan')->with(compact('user', 'truyen_theo_doi'));
    }
});

Route::get('/profile/edit', [UserController::class, 'editProfile'])->name('profile.edit');
Route::put('/profile/update', [UserController::class, 'updateProfile'])->name('profile.update');

Route::post('/thanh-toan', [PaymentController::class, 'payment'])->name('thanh-toan');
Route::get('/thanh-toan/ket-qua-giao-dich', [PaymentController::class, 'response']);

Route::group(['middleware' => ['admin']], function () {
    Route::get('/admin', [HomeController::class, 'index'])->name('home');
    Route::resource('/theloai', TheloaiController::class);
    Route::resource('/danhmuc', DanhmucController::class);
    Route::post('/tim-kiem-the-loai', [TheloaiController::class, 'timkiem']);
    Route::resource('/truyen', TruyenController::class);
    Route::post('/tim-kiem-truyen', [TruyenController::class, 'timkiem']);
    Route::resource('/chuong', ChuongController::class);
    Route::post('/tim-kiem-chuong', [ChuongController::class, 'timkiem']);
    Route::resource('/user', UserController::class);
    Route::put('/user/{id}', [UserController::class, 'update']);
    Route::get('/thong-tin-giao-dich', [TransactionController::class, 'index']);
    Route::get('/thong-ke', [HomeController::class, 'thongke']);
});



Auth::routes();

