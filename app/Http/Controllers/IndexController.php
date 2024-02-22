<?php

namespace App\Http\Controllers;

use App\Models\Binhluan;
use App\Models\Chuong;
use App\Models\Danhmuc;
use App\Models\TheloaiTruyen;
use App\Models\Truyen;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Storage;

class IndexController extends Controller
{
    // tim kiem nang cao
    public function timkiem_ajax(Request $request)
    {
        $data = $request->all();
        if ($data['keywords']) {
            $truyen = Truyen::where('kichhoat', 0)->where('tentruyen', 'LIKE', '%' . $data['keywords'] . '%')
            ->orWhere('tacgia','LIKE','%' . $data['keywords'] . '%')->get();
            $output = '<ul class="dropdown-menu" style="display:block;padding: 10px">';
            foreach ($truyen as $key => $tr) {
                $output .= '<li class="li_search_ajax" style="margin-top: 10px; margin-bottom: 10px"><a href="' . url('xem-truyen/' . $tr->slug_truyen) . '" style="color: #000; text-transform: uppercase">' . $tr->tentruyen . '</a></li>';
            }
            $output .= '</ul>';
            echo $output;
        }
    }

    public function home()
    {
        if (\auth()->check()) {
            $user = auth()->user();
            if ($user && $user->vip_expire_at && now()->greaterThan($user->vip_expire_at)) {
                DB::table('users')->where('id', auth()->user()->id)
                    ->update([
                        'is_vip' => 0,
                        'vip_expire_at' => null
                    ]);

                // Đặt session để thông báo cập nhật thành công
                session()->flash('status', 'Tài khoản VIP của bạn đã hết hạn. Mua gói NGAY để không bỏ lỡ nội dung mới');
            }
        }
        $theloais = TheloaiTruyen::all(); // Lấy tất cả các thể loại từ cơ sở dữ liệu
        $theloai = TheloaiTruyen::orderBy('id', 'DESC')->get();
        $danhmuc = Danhmuc::orderBy('id', 'DESC')->get();
        $truyen = Truyen::orderBy('id', 'DESC')->where('kichhoat', 0)->paginate(6);
        $truyen_hay = Truyen::orderBy('luotxem', 'DESC')->where('kichhoat', 0)->take(10)->get();
        return view('pages.home')->with(compact('theloai', 'truyen', 'truyen_hay', 'theloais', 'danhmuc'));
    }

    public function danhmuc($slug)
    {
        if (\auth()->check()) {
            $user = auth()->user();
            if ($user && $user->vip_expire_at && now()->greaterThan($user->vip_expire_at)) {
                DB::table('users')->where('id', auth()->user()->id)
                    ->update([
                        'is_vip' => 0,
                        'vip_expire_at' => null
                    ]);

                // Đặt session để thông báo cập nhật thành công
                session()->flash('status', 'Tài khoản VIP của bạn đã hết hạn. Mua gói NGAY để không bỏ lỡ nội dung mới');
            }
        }
        $theloais = TheloaiTruyen::all();
        $theloai = TheloaiTruyen::orderBy('id', 'DESC')->get();
        $danhmuc = Danhmuc::orderBy('id', 'DESC')->get();
        $danhmuc_id = Danhmuc::where('slug_danhmuc', $slug)->first();
        $ten_danhmuc = $danhmuc_id->ten_danhmuc;
        $truyen = Truyen::orderBy('id', 'DESC')->where('kichhoat', 0)->where('danhmuc_id', $danhmuc_id->id)->get();
        return view('pages.danhmuc')->with(compact('danhmuc', 'truyen', 'ten_danhmuc', 'theloai', 'theloais'));
    }

    public function theloai($slug)
    {
        if (\auth()->check()) {
            $user = auth()->user();
            if ($user && $user->vip_expire_at && now()->greaterThan($user->vip_expire_at)) {
                DB::table('users')->where('id', auth()->user()->id)
                    ->update([
                        'is_vip' => 0,
                        'vip_expire_at' => null
                    ]);

                // Đặt session để thông báo cập nhật thành công
                session()->flash('status', 'Tài khoản VIP của bạn đã hết hạn. Mua gói NGAY để không bỏ lỡ nội dung mới');
            }
        }
        $theloais = TheloaiTruyen::all();
        $theloai = TheloaiTruyen::orderBy('id', 'DESC')->get();
        $danhmuc = Danhmuc::orderBy('id', 'DESC')->get();
        $theloai_id = TheloaiTruyen::where('slug_theloai', $slug)->first();
        $tentheloai = $theloai_id->tentheloai;
        $truyen = Truyen::orderBy('id', 'DESC')->where('kichhoat', 0)->where('theloai_id', $theloai_id->id)->get();
        return view('pages.theloai')->with(compact('theloai', 'theloais', 'truyen', 'tentheloai', 'danhmuc'));
    }

    public function xemtruyen($slug)
    {
        if (\auth()->check()) {
            $user = auth()->user();
            if ($user && $user->vip_expire_at && now()->greaterThan($user->vip_expire_at)) {
                DB::table('users')->where('id', auth()->user()->id)
                    ->update([
                        'is_vip' => 0,
                        'vip_expire_at' => null
                    ]);

                // Đặt session để thông báo cập nhật thành công
                session()->flash('status', 'Tài khoản VIP của bạn đã hết hạn. Mua gói NGAY để không bỏ lỡ nội dung mới');
            }
        }
        $theloais = TheloaiTruyen::all();
        $theloai = TheloaiTruyen::orderBy('id', 'DESC')->get();
        $danhmuc = Danhmuc::orderBy('id', 'DESC')->get();
        $truyen = Truyen::with('theloaitruyen')->where('slug_truyen', $slug)->where('kichhoat', 0)->first();
        $truyen->luotxem++;
        $truyen->save();
        $chuong = Chuong::with('truyen')->orderBy('id', 'ASC')->where('truyen_id', $truyen->id)->get();
        $truyen_hay = Truyen::orderBy('luotxem', 'DESC')->where('kichhoat', 0)->take(3)->get();
        $chuong_dau = Chuong::with('truyen')->orderBy('id', 'ASC')->where('truyen_id', $truyen->id)->first();
        $chuong_moi = Chuong::with('truyen')->orderBy('id', 'DESC')->where('truyen_id', $truyen->id)->first();
        $cungdanhmuc = Truyen::with('danhmuc', 'theloaitruyen')->where('danhmuc_id', $truyen->danhmuc->id)->whereNotIn('id', [$truyen->id])->get();
        $lastReadChapterSlug = isset($_COOKIE['lastReadChapter']) ? $_COOKIE['lastReadChapter'] : null;
        if ($lastReadChapterSlug) {
            $lastReadChapter = Chuong::with('truyen')->where('slug_chuong', $lastReadChapterSlug)->where('truyen_id', $truyen->id)->first();
            if ($lastReadChapter) {
                return redirect()->to('xem-chuong/' . $lastReadChapterSlug);
            }
        }
        return view('pages.truyen')->with(compact('theloai', 'danhmuc', 'theloais', 'truyen', 'chuong', 'cungdanhmuc', 'chuong_dau', 'truyen_hay', 'chuong_moi'));
    }

    public function xemchuong($slug)
    {
        if (\auth()->check()) {
            $user = auth()->user();
            if ($user && $user->vip_expire_at && now()->greaterThan($user->vip_expire_at)) {
                DB::table('users')->where('id', auth()->user()->id)
                    ->update([
                        'is_vip' => 0,
                        'vip_expire_at' => null
                    ]);

                // Đặt session để thông báo cập nhật thành công
                session()->flash('status', 'Tài khoản VIP của bạn đã hết hạn. Mua gói NGAY để không bỏ lỡ nội dung mới');
            }
        }
        $theloais = TheloaiTruyen::all();
        $theloai = TheloaiTruyen::orderBy('id', 'DESC')->get();
        $danhmuc = Danhmuc::orderBy('id', 'DESC')->get();
        $truyen = Chuong::where('slug_chuong', $slug)->first();
        $user = User::orderBy('id', 'DESC')->get();
        $comment = Binhluan::with('user', 'chuong')->orderBy('id', 'ASC')->where('chuong_id', $truyen->id)->get();
        $chuong = Chuong::with('truyen')->where('slug_chuong', $slug)->where('truyen_id', $truyen->truyen_id)->first();
        $all_chuong = Chuong::with('truyen')->orderBy('id', 'ASC')->where('truyen_id', $truyen->truyen_id)->get();
        $next_chuong = Chuong::where('truyen_id', $truyen->truyen_id)->where('id', '>', $chuong->id)->min('slug_chuong');
        $prev_chuong = Chuong::where('truyen_id', $truyen->truyen_id)->where('id', '<', $chuong->id)->max('slug_chuong');
        // Kiểm tra xem chương tiếp theo có phải là chương VIP không
        $next_chuong_is_vip = $next_chuong ? Chuong::where('slug_chuong', $next_chuong)->where('is_vip', 1)->exists() : false;
        // Kiểm tra xem người dùng có phải là VIP không
        $is_vip_user = auth()->check() && auth()->user()->is_vip;
        $max_id = Chuong::where('truyen_id', $truyen->truyen_id)->orderBy('id', 'DESC')->first();
        $min_id = Chuong::where('truyen_id', $truyen->truyen_id)->orderBy('id', 'ASC')->first();
        $truyen_bread = Truyen::with('theloaitruyen')->where('id', $truyen->truyen_id)->first();
        $lastReadChapterSlug = $slug;
        setcookie('lastReadChapter', $lastReadChapterSlug, time() + (86400 * 30), "/");
         // set the cookie to expire in 30 days
        return view('pages.chuong')->with(compact('is_vip_user','truyen','next_chuong_is_vip', 'danhmuc', 'theloai', 'theloais', 'chuong', 'all_chuong', 'next_chuong', 'prev_chuong', 'max_id', 'min_id', 'truyen_bread', 'comment'));
    }

    //tim kiem
    public function timkiem(Request $request)
    {
        if (\auth()->check()) {
            $user = auth()->user();
            if ($user && $user->vip_expire_at && now()->greaterThan($user->vip_expire_at)) {
                DB::table('users')->where('id', auth()->user()->id)
                    ->update([
                        'is_vip' => 0,
                        'vip_expire_at' => null
                    ]);

                // Đặt session để thông báo cập nhật thành công
                session()->flash('status', 'Tài khoản VIP của bạn đã hết hạn. Mua gói NGAY để không bỏ lỡ nội dung mới');
            }
        }
        $data = $request->all();
        $theloais = TheloaiTruyen::all();
        $danhmuc = Danhmuc::orderBy('id', 'DESC')->get();
        $theloai = TheloaiTruyen::orderBy('id', 'DESC')->get();
        $tukhoa = $data['tukhoa'];
        $truyen = Truyen::with('theloaitruyen')->where('tentruyen', 'LIKE', '%' . $tukhoa . '%')->orWhere('tomtat', 'LIKE', '%' . $tukhoa . '%')->orWhere('tacgia', 'LIKE', '%' . $tukhoa . '%')->get();
        return view('pages.timkiem')->with(compact('danhmuc', 'theloai', 'theloais', 'truyen', 'tukhoa'));
    }

    //tag
    public function tag($tag)
    {
        if (\auth()->check()) {
            $user = auth()->user();
            if ($user && $user->vip_expire_at && now()->greaterThan($user->vip_expire_at)) {
                DB::table('users')->where('id', auth()->user()->id)
                    ->update([
                        'is_vip' => 0,
                        'vip_expire_at' => null
                    ]);

                // Đặt session để thông báo cập nhật thành công
                session()->flash('status', 'Tài khoản VIP của bạn đã hết hạn. Mua gói NGAY để không bỏ lỡ nội dung mới');
            }
        }
        $theloai = TheloaiTruyen::orderBy('id', 'DESC')->get();
        $tags = explode("-", $tag);
        $truyen = Truyen::where(
            function ($query) use ($tags) {
                for ($i = 0; $i < count($tags); $i++) {
                    $query->orwhere('tukhoa', 'LIKE', '%' . $tags[$i] . '%');
                }
            }
        )->paginate(10);
        return view('pages.tag')->with(compact('theloai', 'truyen', 'tag'));
    }

    public function theodoi($id)
    {
        if (\auth()->check()) {
            $user = auth()->user();
            if ($user && $user->vip_expire_at && now()->greaterThan($user->vip_expire_at)) {
                DB::table('users')->where('id', auth()->user()->id)
                    ->update([
                        'is_vip' => 0,
                        'vip_expire_at' => null
                    ]);

                // Đặt session để thông báo cập nhật thành công
                session()->flash('status', 'Tài khoản VIP của bạn đã hết hạn. Mua gói NGAY để không bỏ lỡ nội dung mới');
            }
        }
        if (!Auth::check()) {
            return redirect()->back()->with('status', 'Register or Login now !!');
        }
        $user = Auth::user();
        $truyen = Truyen::find($id);
        if (!$truyen) {
            return redirect()->back()->with('status', 'không được rồi !!');
        }
        $user->likes()->attach($truyen);
        return redirect()->back()->with('status', 'theo dõi truyện thành công !!');
    }

    public function botheodoi($id)
    {
        if (!Auth::check()) {
            return redirect()->back()->with('status', 'Register or Login now !!');
        }
        $user = Auth::user();
        $truyen = Truyen::find($id);
        if (!$truyen) {
            return redirect()->back()->with('status', 'Book not found !!');
        }
        $user->likes()->detach($truyen);
        return redirect()->back()->with('status', 'Unfollowed book successfully !!');
    }

    public function danhSachYeuThich()
    {
        if (\auth()->check()) {
            $user = auth()->user();
            if ($user && $user->vip_expire_at && now()->greaterThan($user->vip_expire_at)) {
                DB::table('users')->where('id', auth()->user()->id)
                    ->update([
                        'is_vip' => 0,
                        'vip_expire_at' => null
                    ]);

                // Đặt session để thông báo cập nhật thành công
                session()->flash('status', 'Tài khoản VIP của bạn đã hết hạn. Mua gói NGAY để không bỏ lỡ nội dung mới');
            }
        }
        $theloais = TheloaiTruyen::all();
        $danhmuc = Danhmuc::orderBy('id', 'DESC')->get();
        $theloai = TheloaiTruyen::orderBy('id', 'DESC')->get();
        // Kiểm tra người dùng đã đăng nhập chưa
        if (!Auth::check()) {
            return redirect()->back()->with('status', 'Please log in to view your favorites !!');
        }
        // Lấy người dùng hiện tại
        $user = Auth::user();
        // Lấy danh sách truyện đã yêu thích của người dùng hiện tại
        $danhSachYeuThich = $user->likes()->get();
        // Trả về view với danh sách truyện đã yêu thích
        return view('pages.like')->with(compact('danhmuc', 'theloai', 'theloais', 'danhSachYeuThich'));
    }
    
}
