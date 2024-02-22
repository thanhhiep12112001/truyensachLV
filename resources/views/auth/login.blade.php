@extends('.layout')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm rounded my-5">
                <div class="card-header">Đăng nhập tài khoản</div>
                <div class="card-body">
                    <h2 class="text-center mb-4 mt-3">ĐĂNG NHẬP</h2>
                    <form method="POST" action="{{ route('login') }}">
                        @csrf
                        <div class="row mb-3 justify-content-center">
                            <div class="col-md-8">
                                <label for="email" class="mb-2" >{{ __('Địa chỉ email') }}</label>
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
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
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="row mb-3 justify-content-center">
                            <div class="col-md-8">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                    <label class="form-check-label" for="remember">
                                        {{ __('Lưu đăng nhập') }}
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-5 justify-content-center">
                            <div class="col-md-8">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Đăng nhập') }}
                                </button>

                                @if (Route::has('password.request'))
                                    <a class="btn btn-link" href="{{ route('password.request') }}">
                                        {{ __('Bạn quên mật khẩu?') }}
                                    </a>
                                @endif
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
