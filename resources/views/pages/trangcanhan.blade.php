@extends('.layout')
@section('content')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bread-list bread_style">
            <li class="breadcrumb-item">
                <a href="{{ url('/truyen-hay') }}">
                    <i class="fa fa-home" style="margin-right:10px" aria-hidden="true"></i>Trang chủ </a>
            </li>
            <li class="breadcrumb-item">
                <a href="">Trang cá nhân</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">Thông tin tài khoản</li>
        </ol>
    </nav>
    <div class="row justify-content-center mx-3 my-2">
        <div class="col-md-10">
            <div class="card shadow-sm rounded mx-3 mb-2">
                <div class="card-header">Thông tin tài khoản</div>
                <div class="card-body">
                    <div class="row justify-content-center align-items-center">
                        <div class="col-md-2 px-3">
                            <i class="fas fa-user fa-7x text-secondary"></i>
                        </div>
                        <div class="col-md-6">
                            <h3 class="card-title">{{ $user->name }}</h3>
                            <p class="card-text">Email: {{ $user->email }}</p>
                            <p class="card-text">Loại tài khoản:
                                @if ($user->is_vip == 0)
                                    <strong class="text-danger">Tài khoản FREE</strong>
                                @else
                                    <strong class="text-success"> Tài khoản VIP</strong>
                                @endif
                            </p>
                            <p class="card-text">Ngày hết hạn Vip:
                                @if ($user->is_vip == 0)
                                    <strong class="text-danger">Tài khoản FREE</strong>
                                @else
                                <strong class="text-success">{{ date('d/m/Y', strtotime($user->vip_expire_at)) }}</strong>
                                @endif
                            </p>
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                data-bs-target="#exampleModal">
                                Cập nhật tài khoản
                            </button>
                        </div>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Cập nhật thông tin tài khoản</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <form action="{{ route('profile.update') }}" method="post">
                                        @csrf
                                        @method('put')
                                    <div class="form-group">
                                        <label for="name">Name</label>
                                        <input type="text" name="name" value="{{ old('name', $user->name) }}" class="form-control" required>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy
                                        </button>
                                        <button type="submit" class="btn btn-danger">Lưu cập nhật</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card shadow-sm rounded mx-3 my-2">
                <div class="card-header">Truyện theo dõi</div>
                <div class="card-body">
                    @if (count($truyen_theo_doi) > 0)
                        @foreach ($truyen_theo_doi as $item)
                            <div class="row my-2 shadow-sm mx-2 rounded justify-content-center align-items-center">
                                <div class="col-md-2">
                                    <img style="max-height: 100px"
                                        src="{{ asset('public/uploads/truyen/' . $item->hinhanh) }}" class="img-fluid"
                                        alt="Hình ảnh truyện">
                                </div>
                                <div class="col-md-6">
                                    <h5 class="card-title ">{{ $item->tentruyen }}</h5>
                                </div>
                                <div class="col-md-2">
                                    <a class="text-warning"><i class="fa fa-heart-broken"> Bỏ theo dõi</i></a>
                                </div>
                                <div class="col-md-2">
                                    <a class="text-danger"><i class="fa fa-trash"> Xóa truyện</i></a>
                                </div>
                            </div>
                        @endforeach
                    @else
                        <div class="row">
                            <h3>Không có thông tin truyện theo dõi.</h3>
                        </div>
                    @endif

                </div>
            </div>
        </div>
    </div>
@endsection
