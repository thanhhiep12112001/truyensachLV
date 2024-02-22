@extends('layouts.app')
@section('content')
    @include('layouts.nav')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">Giao dịch mua gói - Nâng cấp tài khoản</div>

                    <div class="card-body">
                        @if (session('status'))
                            <div class="alert alert-success" role="alert">
                                {{ session('status') }}
                            </div>
                        @endif
                        <form class="d-flex" style="margin-bottom: 10px">
                            <input class="form-control me-2" type="search" placeholder="Tìm kiếm" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </button>
                        </form>
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Mã giao dịch</th>
                                <th scope="col">Tài khoản giao dịch</th>
                                <th scope="col">Mã ngân hàng</th>
                                <th scope="col">Loại</th>
                                <th scope="col">Nội dung</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col">Tổng tiền</th>
                                <th scope="col">Ngày thanh toán</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($trans as $item)
                                <tr>
                                    <th scope="row">{{$item->id}}</th>
                                    <td>{{$item->trans_no}}</td>
                                    @if(isset($item->id_user))
                                        @php $user= \App\Models\User::all()->where('id','=',$item->id_user)->first() @endphp
                                        <td class="fw-bold">{{$user->name}}</td>
                                    @else
                                        <td>Không có thông tin</td>
                                    @endif
                                    <td>{{$item->bank_code}}</td>
                                    <td>{{$item->trans_type}}</td>
                                    <td>{{$item->trans_info}}</td>
                                    <td class="text-success fw-bold">{{$item->status}}</td>
                                    <td>{{ number_format($item->trans_amount, 0, ',', '.') }} đ</td>
                                    <td>{{ $item->created_at->format('d/m/Y H:i:s') }}</td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .pass {
            height: 100px;
            width: 70px;
            overflow-y: hidden;
        }

        .pass:hover {
            height: 100px;
            width: 70px;
            overflow-y: scroll !important;
        }

        .sw-style {
            margin-bottom: 0;
        }

        .btn-style {
            padding: 0 12px;
        }
    </style>
@endsection
