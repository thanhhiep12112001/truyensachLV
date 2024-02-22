@extends('.layout')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm rounded">
                <div class="card-header">{{ __('Đăng kí tài khoản') }}</div>
                <div class="card-body">
                    <h2 class="text-center mb-4 mt-3">ĐĂNG KÍ TÀI KHOẢN</h2>
                    <form method="POST" action="{{ route('register') }}">
                        @csrf
                        <div class="row mb-3 justify-content-center">
                            <div class="col-md-8">
                                <label for="name" class="mb-2">{{ __('Tên tài khoản') }}</label>
                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-3 justify-content-center">
                            <div class="col-md-8">
                                <label for="email" class="mb-2">{{ __('Đia chỉ Email') }}</label>
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email">
                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-3 justify-content-center">
                            <div class="col-md-8">
                                <label for="password" class="mb-2">{{ __('Mật khẩu') }}</label>
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">
                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-4 justify-content-center">
                            <div class="col-md-8">
                                <label for="password-confirm" class="mb-2">{{ __('Xác nhận mật khẩu') }}</label>
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                            </div>
                        </div>

                        <div class="row mb-5 justify-content-center">
                            <div class="col-md-8">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Xác nhận đăng kí') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
