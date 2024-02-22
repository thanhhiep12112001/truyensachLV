@php use Illuminate\Support\Facades\Auth; @endphp
@php use Illuminate\Support\Facades\DB; @endphp
@extends('../layout')
@section('content')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bread-list  bread_style">
            <li class="breadcrumb-item">
                <a href="{{ url('/truyen-hay') }}">
                    <i class="fa fa-home" style="margin-right:10px" aria-hidden="true"></i>Trang chủ </a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">{{ $truyen->tentruyen }}</li>
        </ol>
    </nav>
    <div class="container row noidung">
        <div class="col-md-10">
            <div class="col-md-9 d-flex">
                @php
                    $mucluc = count($chuong);
                @endphp
                <div class="col-md-3">
                    <img class="image-hover" src="{{ asset('public/uploads/truyen/' . $truyen->hinhanh) }}">
                </div>
                <div class="col-md-9 noidung2">
                    <ul>
                        <li>Tên truyện: {{ $truyen->tentruyen }}</li>
                        <li>Tác giả: {{ $truyen->tacgia }}</li>
                        <li>Danh mục:<a
                                href="{{ url('danh-muc/' . $truyen->danhmuc->slug_danhmuc) }}">{{ $truyen->danhmuc->ten_danhmuc }}</a>
                        </li>
                        <li>Thể loại:
                            @if ($truyen->theloaitruyen)
                                <!-- Kiểm tra nếu câu truyện chỉ có một thể loại -->
                                <a
                                    href="{{ url('the-loai/' . $truyen->theloaitruyen->slug_theloai) }}">{{ $truyen->theloaitruyen->tentheloai }}</a>
                            @else
                                <!-- Nếu câu truyện có nhiều thể loại -->
                                @foreach ($truyen->theloais as $gen)
                                    <a href="{{ url('the-loai/' . $gen->slug_theloai) }}">{{ $gen->tentheloai }}</a>
                                    @if (!$loop->last)
                                        ,
                                    @endif
                                @endforeach
                            @endif
                        </li>
                        <li>Số chương: {{ $mucluc }}</li>
                        <li>Số lượt xem: {{ $truyen->luotxem }}</li>
                        <div class="fb-like" data-href="http://127.0.0.1:8000/xem-truyen/thon-phe-tinh-khong" data-width=""
                            data-layout="" data-action="" data-size="" data-share="true"></div>
                        <li> Trạng thái :
                            @if ($truyen->kichhoat == 0)
                                <span class="text text-success">Đang cập nhật</span>
                            @else
                                <span class="text text-danger">Hoàn thành</span>
                            @endif
                        </li>
                        <div class="col-md-auto my-2">
                            @php
                                if (Auth::check()) {
                                    $theodoi = DB::table('likes')
                                        ->where('id_user', '=', Auth::user()->id)
                                        ->where('truyen_id', '=', $truyen->id)
                                        ->get();
                                    $count = $theodoi->count();
                                }
                                $likes = DB::table('likes')
                                    ->where('truyen_id', $truyen->id)
                                    ->get();
                                $countlikes = $likes->count();
                            @endphp
                            @guest
                                <form action="{{ route('theodoi', $truyen->id) }}" method="POST" enctype="multipart/form-data">
                                    @csrf
                                    <button type="submit" class="btn btn-outline-success">
                                        <i class="far fa-heart"></i> Yêu thích {{ $countlikes }}
                                    </button>
                                </form>
                            @else
                                @if ($count > 0)
                                    <form action="{{ route('botheodoi', $truyen->id) }}" method="post"
                                        enctype="multipart/form-data">
                                        @method('delete')
                                        @csrf
                                        <button type="submit" class="btn btn-outline-success">
                                            <i class="fas fa-heart"></i> Bỏ yêu thích
                                        </button>
                                    </form>
                                @else
                                    <form action="{{ route('theodoi', $truyen->id) }}" method="POST"
                                        enctype="multipart/form-data">
                                        @csrf
                                        <button type="submit" class="btn btn-outline-success"><i
                                                class="bi bi-bookmark-heart"></i> Yêu thích {{ $countlikes }}
                                        </button>
                                    </form>
                                @endif
                            @endguest
                        </div>

                        @if ($chuong_dau)
                            <li><a href="{{ url('xem-chuong/' . $chuong_dau->slug_chuong) }}" class="btn btn-sm btn-primary"
                                    onclick="saveLastReadChapter('{{ $chuong_dau->slug_chuong }}')">Đọc ngay</a>
                            </li>
                            <li><a href="{{ url('xem-chuong/' . $chuong_moi->slug_chuong) }}"
                                    class="btn btn-sm btn-success mt-1">Đọc chương mới nhất</a></li>
                        @else
                            <li>
                                <button class="btn btn-sm btn-warning" disabled>Chương đang cập nhật</button>
                            </li>
                        @endif
                    </ul>

                </div>

            </div>
            <div class="col-md-12 card mt-3 contentcard">
                <div class="card-body">
                    <h5 class="card-title">Tóm tắt nội dung</h5>
                    <h6 class="card-text font_content">{!! $truyen->tomtat !!}</h6>
                </div>
            </div>
            <h6 style="margin-top: 10px">Từ khóa tìm kiếm: </h6>
            @php
                $tukhoa = explode(',', $truyen->tukhoa);
            @endphp
            <div class="tagcloud05">
                <ul>
                    @foreach ($tukhoa as $key => $tu)
                        <li><a href="{{ url('tag/' . Str::slug($tu)) }}"><span>{{ $tu }}</span></a></li>
                    @endforeach
                </ul>
            </div>
            <h5 style="margin-top: 10px">Mục lục</h5>
            <ul class="mucluctruyen">
                @if ($mucluc > 0)
                    @foreach ($chuong as $key => $chap)
                        @if ($chap->is_vip == 0 || (auth()->check() && auth()->user()->is_vip == 1))
                            <li><a href="{{ url('xem-chuong/' . $chap->slug_chuong) }}">{{ $chap->tieude }}</a></li>
                        @else
                            <li>{{ $chap->tieude }} (Chỉ VIP mới đọc được)</li>
                        @endif
                    @endforeach
                @else
                    <li>Mục lục đang cập nhật, vui lòng quay lại sau...</li>
                @endif
            </ul>
        </div>
        <div class="col-md-2">
            <h5 class="mb-3">Truyện hay xem nhiều</h5>
            @foreach ($truyen_hay as $key => $value)
                <a href="{{ url('xem-truyen/' . $value->slug_truyen) }}"
                    class="col-md-3 d-flex flex-column justify-content-between" style="width: 135px">
                    <img class="image-hover" src="{{ asset('public/uploads/truyen/' . $value->hinhanh) }}">
                    <div class="d-flex flex-column" style="margin-top: 13px">
                        <h6 class="text-center fw-bold">{{ $value->tentruyen }}</h6>
                        <!-- <p class="text-center"><i class="fa fa-eye" aria-hidden="true" style="margin-right: 10px"></i>{{ $value->luotxem }}</p> -->
                    </div>
                </a>
            @endforeach
        </div>
        <div class="fb-comments" data-href="http://127.0.0.1:8000/xem-truyen/linh-vu-thien-ha" data-width=""
            data-numposts="5"></div>
    </div>
    <script>
        function saveLastReadChapter(slug) {
            localStorage.setItem('lastReadChapter', slug);
        }
    </script>
    <style>
        a {
            text-decoration: none;
        }

        .bread-list {
            padding-left: 20px;
        }

        nav .breadcrumb .breadcrumb-item a {
            text-decoration: none;
        }

        nav .breadcrumb .breadcrumb-item a i {
            margin-right: 10px;
        }

        .noidung {
            padding-left: 20px;
        }

        .noidung2 ul {
            list-style: none;
        }

        .noidung2 ul li {
            margin-bottom: 5px;
        }

        .noidung2 ul li a {
            text-decoration: none;
        }

        .mota {
            margin-top: 10px;
        }

        .mucluctruyen li a {
            text-decoration: none;
        }

        /* tu khoa */

        .tagcloud05 ul {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .tagcloud05 ul li {
            display: inline-block;
            margin: 0 0 .3em 1em;
            padding: 0;
        }

        .tagcloud05 ul li a {
            position: relative;
            display: inline-block;
            height: 30px;
            line-height: 30px;
            padding: 0 1em;
            background-color: #3498db;
            border-radius: 0 3px 3px 0;
            color: #fff;
            font-size: 13px;
            text-decoration: none;
            -webkit-transition: .2s;
            transition: .2s;
        }

        .tagcloud05 ul li a::before {
            position: absolute;
            top: 0;
            left: -15px;
            content: '';
            width: 0;
            height: 0;
            border-color: transparent #3498db transparent transparent;
            border-style: solid;
            border-width: 15px 15px 15px 0;
            -webkit-transition: .2s;
            transition: .2s;
        }

        .tagcloud05 ul li a::after {
            position: absolute;
            top: 50%;
            left: 0;
            z-index: 2;
            display: block;
            content: '';
            width: 6px;
            height: 6px;
            margin-top: -3px;
            background-color: #fff;
            border-radius: 100%;
        }

        .tagcloud05 ul li span {
            display: block;
            max-width: 100px;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }

        .tagcloud05 ul li a:hover {
            background-color: #555;
            color: #fff;
        }

        .tagcloud05 ul li a:hover::before {
            border-right-color: #555;
        }

        .contentcard {
            background-color: #ddd
        }
    </style>
@endsection
