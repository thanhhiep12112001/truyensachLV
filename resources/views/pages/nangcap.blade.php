@extends('.layout')
@section('content')
    <div class="mx-3 my-5">
        @if (session('error'))
            <div class="alert alert-danger text-center" role="alert">
                {{ session('error') }}
            </div>
        @endif
        <div class="row row-cols-1 row-cols-md-3 mb-3 text-center justify-content-center mx-5">
            <div class="col-md-8">
                <div class="card mb-4 rounded-3 shadow-lg">
                    <div class="card-header py-3">
                        <h4 class="my-0 fw-normal">Nâng cấp tài khoản</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title">99000 vnđ<small class="text-muted fw-light">/ tài
                                khoản</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li> Nhận thông báo truyện mới nhất.</li>
                            <li>Mở khóa tất cả truyện.</li>
                            <li>Tài khoản VIP 30 ngày.</li>
                        </ul>
                        <form action="{{route('thanh-toan')}}" method="post">
                            @csrf
                            <input type="hidden" value="99000" name="prices">
                            @if(auth()->user()->is_vip==1)
                                <button type="submit" class="w-100 btn btn-lg btn-primary" disabled>Thanh toán
                                    ngay
                                </button>
                            @else
                                <button type="submit" class="w-100 btn btn-lg btn-primary">Thanh toán ngay
                                </button>
                            @endif

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
