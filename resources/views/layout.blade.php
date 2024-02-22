@php use App\Models\TheloaiTruyen; @endphp
@php use App\Models\Danhmuc; @endphp
@php use Illuminate\Support\Facades\URL; @endphp
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/owl.carousel.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/owl.theme.default.min.css') }}" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico">
    <!-- Thêm Toastify CSS và JS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script src="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.js"></script>
    <title>Truyện hay 24h</title>
    <style>
        .welcome {
            background-color: #fff;
            overflow: hidden;
        }

        .welcome .marquee {
            display: inline-block;
            margin-bottom: 0;
            animation: marquee 20s linear infinite;
        }

        @keyframes marquee {
            0% {
                transform: translateX(100%);
            }

            100% {
                transform: translateX(-100%);
            }
        }

        body {
            user-select: none;
        }

        .bg-title:hover {
            transform: scale(1.1);
            transition: transform 0.3s ease-in-out;
        }

        .bg-title {
            position: relative;
            cursor: pointer;
            border: 3px solid #000;
            border-image: url("data:image/svg+xml;charset=utf-8,%3Csvg width='100' height='100' viewBox='0 0 100 100' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cstyle%3Epath%7Banimation:stroke 5s infinite linear%3B%7D%40keyframes stroke%7Bto%7Bstroke-dashoffset:776%3B%7D%7D%3C/style%3E%3ClinearGradient id='g' x1='0%25' y1='0%25' x2='0%25' y2='100%25'%3E%3Cstop offset='0%25' stop-color='%232d3561' /%3E%3Cstop offset='25%25' stop-color='%23c05c7e' /%3E%3Cstop offset='50%25' stop-color='%23f3826f' /%3E%3Cstop offset='100%25' stop-color='%23ffb961' /%3E%3C/linearGradient%3E %3Cpath d='M1.5 1.5 l97 0l0 97l-97 0 l0 -97' stroke-linecap='square' stroke='url(%23g)' stroke-width='3' stroke-dasharray='388'/%3E %3C/svg%3E") 1;
        }

        .bg-title img {
            height: 185px;
            z-index: 1;
        }

        .bg-title .content {
            position: absolute;
            bottom: 0;
            left: 0;
            background-color: rgba(0, 35, 82, 0.7);
            z-index: 999;
            width: 100%;
            color: #fff;
        }

        .col-content {
            cursor: pointer;
        }

        .image-hover {
            border: 3px solid rgb(0, 255, 242);
            height: 195px;
        }

        .image-hover:hover {
            transform: scale(1.1);
            transition: transform 0.3s ease-in-out;
        }

        .bread_style {
            padding: 10px;
            border-radius: 5px;
        }

        .bread_style li a {
            text-decoration: none;
        }

        /* Style for the pagination links */
        .pagination {
            display: flex;
            justify-content: center;

        }

        .pagination li {
            display: inline-block;
            margin-right: 10px;
            font-size: 16px;
        }

        .pagination li a {
            display: block;
            background-color: #f5f5f5;
            color: #333;
            border-radius: 5px;
        }

        .pagination li a:hover {
            background-color: #333;
            color: #fff;
        }

        .pagination .active a {
            background-color: #333;
            color: #fff;
        }

        .page-link.active,
        .active>.page-link {
            border-radius: 5px;
        }
    </style>
</head>

<body style="background-color: #ddd; overflow-x: hidden;">
    <!-- Thêm mã JavaScript sau khi cập nhật thành công -->
    <script>
        @if (session('status'))
            Toastify({
                text: '{{ session('status') }}',
                duration: 7000,
                close: true,
                gravity: 'top',
                position: 'center',
                backgroundColor: '#ef2e13',
                stopOnFocus: true,
            }).showToast();

            // Chờ 10 giây trước khi reload trang
            setTimeout(function() {
                window.location.reload();
            }, 5000);
        @endif
    </script>
    <div>
        <!-- menu -->

        <div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <div class="container-fluid">
                    <a class="navbar-brand " href="{{ url('/truyen-hay') }}">
                        <i class="fa fa-leanpub" style="margin-right: 10px" aria-hidden="true"></i>TRUYỆN HAY 24H </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-bars" aria-hidden="true" style="margin-right: 5px"></i>Thể loại </a>
                                <ul class="dropdown-menu dropdown-menu-dark bg-secondary"
                                    aria-labelledby="navbarDropdown">
                                    @php $theloai=TheloaiTruyen::all() @endphp
                                    @foreach ($theloai as $key => $the)
                                        <li>
                                            <a class="dropdown-item"
                                                href="{{ url('the-loai/' . $the->slug_theloai) }}">{{ $the->tentheloai }}</a>
                                        </li>
                                    @endforeach
                                </ul>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-bars" aria-hidden="true" style="margin-right: 5px"></i>Danh mục </a>
                                <ul class="dropdown-menu dropdown-menu-dark bg-secondary"
                                    aria-labelledby="navbarDropdown">
                                    @php $danhmuc = Danhmuc::all() @endphp
                                    @foreach ($danhmuc as $key => $danh)
                                        <li>
                                            <a class="dropdown-item"
                                                href="{{ url('danh-muc/' . $danh->slug_danhmuc) }}">{{ $danh->ten_danhmuc }}</a>
                                        </li>
                                    @endforeach
                                </ul>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-cog" aria-hidden="true" style="margin-right: 5px"></i>Tùy chỉnh </a>
                                <ul class="dropdown-menu dropdown-menu-dark bg-secondary"
                                    aria-labelledby="navbarDropdown">
                                    <li class="font-setting" id="font-size-li">
                                        <a class="dropdown-item d-flex justify-content-center flex-column"
                                            href="#">
                                            <p><i class="fa fa-font" style="margin-right: 10px"
                                                    aria-hidden="true"></i>Font size</p>
                                            <input type="number" id="font-size-input" min="14"
                                                max="20">
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item d-flex justify-content-center flex-column"
                                            href="#">
                                            <p><i class="fa fa-pie-chart" style="margin-right: 10px"
                                                    aria-hidden="true"></i>Themes</p>
                                            <select id="theme-select" onchange="changeTheme()" class="form-select"
                                                aria-label="Default select example">
                                                <option value="dark">Dark</option>
                                                <option value="light">Light</option>
                                            </select>
                                        </a>
                                    </li>
                                    <li class="font-setting" id="font-family-li">
                                        <a class="dropdown-item d-flex justify-content-center flex-column"
                                            href="#">
                                            <p><i class="fa fa-font" style="margin-right: 10px"
                                                    aria-hidden="true"></i>Font family</p>
                                            <select id="font-family-select" onchange="changeFontFamily()"
                                                class="form-select" aria-label="Select font family">
                                                <option value="Arial, sans-serif">Arial</option>
                                                <option value="Times New Roman, serif">Times New Roman</option>
                                                <option value="Verdana, sans-serif">Verdana</option>
                                                <!-- Thêm các tùy chọn font chữ khác nếu cần -->
                                            </select>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <div class="d-flex justify-content-between" style="margin-right: 30px">
                            <!-- tim kiem -->
                            <form autocomplete="off" class="d-block" method="POST"
                                action="{{ url('tim-kiem/') }}">
                                @csrf
                                <div class="d-flex">
                                    <input class="form-control" id="keywords" name="tukhoa" type="search"
                                        placeholder="Tìm kiếm..." aria-label="Search">
                                    <button class="btn btn-warning text-light" style="margin-left: 10px"
                                        type="submit">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </button>
                                </div>
                                <div id="search_ajax" style="margin-top: 10px"></div>
                            </form>
                            @guest
                                <ul class="navbar-nav ms-auto navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                                    @if (Route::has('login'))
                                        <li class="nav-item">
                                            <a class="nav-link" href="{{ route('login') }}"><i
                                                    class="fa fa-sign-in-alt"></i>{{ __(' Đăng nhập') }}</a>
                                        </li>
                                    @endif
                                    @if (Route::has('register'))
                                        <li class="nav-item">
                                            <a class="nav-link" href="{{ route('register') }}"><i
                                                    class="fa fa-lock"></i>{{ __(' Đăng kí') }}</a>
                                        </li>
                                    @endif
                                </ul>
                            @else
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                            role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="fa fa-user" aria-hidden="true" style="margin-right: 5px"></i>
                                            {{--                                        {{ Auth::user()->name }} --}} Tài
                                            khoản
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-end bg-secondary"
                                            aria-labelledby="navbarDropdown">
                                            <li>
                                                <a class="dropdown-item">
                                                    <i class="fa fa-spinner" style="margin-right: 10px"
                                                        aria-hidden="true"></i>{{ Auth::user()->name }} @if (Auth::user()->is_vip == 1)
                                                        <strong class="text-warning">VIP</strong>
                                                    @else
                                                        <strong class="text-secondary"> FREE</strong>
                                                    @endif
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="{{ route('logout') }}"
                                                    onclick="event.preventDefault();
                                  document.getElementById('logout-form').submit();"><i
                                                        class="fa fa-sign-out-alt" style="margin-right: 10px"
                                                        aria-hidden="true"></i>Đăng xuất</a>
                                                <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                                    class="d-none">
                                                    @csrf
                                                    <input type="hidden" name="return"
                                                        value="{{ url('/truyen-ha') }}">
                                                </form>
                                            </li>
                                            @if (auth()->user()->is_vip == 0)
                                                <li>
                                                    <a class="dropdown-item"
                                                        href="{{ URL::to('nang-cap-tai-khoan') }}"><i
                                                            class="fa fa-upload" style="margin-right: 10px"
                                                            aria-hidden="true"></i>Nâng cấp tài khoản</a>
                                                </li>
                                            @else
                                                <li>
                                                    <a class="dropdown-item text-warning fw-bold"
                                                        href="{{ URL::to('nang-cap-tai-khoan') }}"><i
                                                            class="fa fa-upload" style="margin-right: 10px"
                                                            aria-hidden="true"></i>Tài khoản VIP</a>
                                                </li>
                                            @endif
                                            <li>
                                                <a class="dropdown-item" href="{{ URL::to('trang-ca-nhan') }}"><i
                                                        class="fa fa-user" style="margin-right: 10px"
                                                        aria-hidden="true"></i>Trang cá nhân</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="{{ URL::to('trang-ca-nhan') }}">
                                                    <i class="fa fa-heart" style="margin-right: 10px"
                                                        aria-hidden="true"></i>Truyện theo dõi</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="{{ URL::to('') }}">
                                                    <i class="fa fa-history" style="margin-right: 10px"
                                                        aria-hidden="true"></i>Truyện đã đọc</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item {{ Auth::user()->is_admin != 1 ? 'd-none' : '' }}"
                                                    href="{{ route('home') }}"><i class="fa fa-cogs"
                                                        style="margin-right: 10px" aria-hidden="true"></i>Quản lý</a>
                                            </li>
                                        </ul>
                                </ul>
                            @endguest
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <div class="welcome" style="background-color: #fff">
            <p class="marquee">
                <i class="fa fa-bicycle" aria-hidden="true" style="margin-right: 10px"></i>Đọc truyện online, đọc
                truyện chữ, truyện full, truyện hay <i class="fa fa-heartbeat"
                    aria-hidden="true" style="margin-left: 10px"></i>
            </p>
        </div>

        <div style="margin-top: 15px; margin-left: 15px;margin-right: 15px">
            <!-- Slider --> @yield('slide')
            <!-- Truyện mới --> @yield('content')
            <!-- footer -->
            <hr />
            <!-- Footer -->
            <footer class="text-center text-lg-start bg-body-tertiary text-muted">
                <!-- Section: Social media -->
                <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
                    <!-- Left -->
                    <div class="me-5 d-none d-lg-block">
                        <span>Get connected with us on social networks:</span>
                    </div>
                    <!-- Left -->

                    <!-- Right -->
                    <div>
                        <a href="" class="me-4 text-reset">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="" class="me-4 text-reset">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="" class="me-4 text-reset">
                            <i class="fab fa-google"></i>
                        </a>
                        <a href="" class="me-4 text-reset">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a href="" class="me-4 text-reset">
                            <i class="fab fa-linkedin"></i>
                        </a>
                        <a href="" class="me-4 text-reset">
                            <i class="fab fa-github"></i>
                        </a>
                    </div>
                    <!-- Right -->
                </section>
                <!-- Section: Social media -->

                <!-- Section: Links  -->
                <section class="">
                    <div class="container text-center text-md-start mt-5">
                        <!-- Grid row -->
                        <div class="row mt-3">
                            <!-- Grid column -->
                            <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                                <!-- Content -->
                                <h6 class="text-uppercase fw-bold mb-4">
                                    <i class="fas fa-gem me-3"></i>Company name
                                </h6>
                                <p>
                                    Here you can use rows and columns to organize your footer content. Lorem ipsum
                                    dolor sit amet, consectetur adipisicing elit.
                                </p>
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                                <!-- Links -->
                                <h6 class="text-uppercase fw-bold mb-4">
                                    Products
                                </h6>
                                <p>
                                    <a href="#!" class="text-reset">Bootstrap</a>
                                </p>
                                <p>
                                    <a href="#!" class="text-reset">HTML</a>
                                </p>
                                <p>
                                    <a href="#!" class="text-reset">MySQL</a>
                                </p>
                                <p>
                                    <a href="#!" class="text-reset">Laravel</a>
                                </p>
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                                <!-- Links -->
                                <h6 class="text-uppercase fw-bold mb-4">
                                    Useful links
                                </h6>
                                <p>
                                    <a href="#!" class="text-reset">Pricing</a>
                                </p>
                                <p>
                                    <a href="#!" class="text-reset">Settings</a>
                                </p>
                                <p>
                                    <a href="#!" class="text-reset">Orders</a>
                                </p>
                                <p>
                                    <a href="#!" class="text-reset">Help</a>
                                </p>
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                                <!-- Links -->
                                <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                                <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
                                <p>
                                    <i class="fas fa-envelope me-3"></i>
                                    phanthanhhiep11122001@gmail.com
                                </p>
                                <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
                                <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
                            </div>
                            <!-- Grid column -->
                        </div>
                        <!-- Grid row -->
                    </div>
                </section>
                <!-- Section: Links  -->

                <!-- Copyright -->
                <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                    © 2021 Copyright:
                    <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
                </div>
                <!-- Copyright -->
            </footer>
            <!-- footer -->

        </div>


    </div>
    <script src="{{ asset('js/app.js') }}" defer></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

    <script type="text/javascript">
        $('.owl-carousel').owlCarousel({
            loop: true,
            margin: 10,
            responsiveClass: true,
            autoplay: true,
            autoplayTimeout: 2000,
            autoplayHoverPause: true,
            responsive: {
                0: {
                    items: 1,
                },
                200: {
                    items: 2,
                },
                300: {
                    items: 3,
                },
                600: {
                    items: 4,
                },
                800: {
                    items: 5,
                },
                1000: {
                    items: 8,
                    loop: false
                }
            }
        })
    </script>
    <!-- tim kiem nang cao -->
    <script type="text/javascript">
        $('#keywords').keyup(function() {
            var keywords = $(this).val();
            if (keywords != '') {
                var _token = $('input[name="_token"]').val();
                $.ajax({
                    url: "{{ url('/timkiem-ajax') }}",
                    method: "POST",
                    data: {
                        keywords: keywords,
                        _token: _token
                    },
                    success: function(data) {
                        $('#search_ajax').fadeIn();
                        $('#search_ajax').html(data);
                    }
                });
            } else {
                $('#search_ajax').fadeOut();
            }
        });

        $(document).on('click', '.li_search_ajax', function() {
            $('#keywords').val($(this).text());
            $('#search_ajax').fadeOut()
        });
    </script>
    {{-- facebook --}}
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v18.0"
        nonce="9jOK8Gwa"></script>
    <!--route chuong -->
    <script>
    $('.select-chuong').on('change', function () {
        var url = $(this).val();
        if (url) {
            window.location = url
        }
    });
    current_chuong();

    function current_chuong() {
        var url = window.location.href;
        $('select[name="select-chuong"]').find('opition[value="' + url + '"]').attr("selected", true);
    }
    </script>
    <!-- theme -->
    <script>
        function changeTheme() {
            var select = document.getElementById("theme-select");
            var theme = select.options[select.selectedIndex].value;
            var welcome = document.getElementsByClassName("welcome")[0];
            var contentcard = document.getElementsByClassName("contentcard")[0];
            var body = document.getElementsByTagName("body")[0];
            if (theme === "dark") {
                body.style.backgroundColor = "#333";
                body.style.color = "#fff";
                welcome.style.backgroundColor = "#ddd";
                welcome.style.color = "orange";
                contentcard.style.backgroundColor = "#333";
                contentcard.style.color = "#fff";
                contentcard.style.borderColor = "#fff";
                localStorage.setItem("theme", "dark");
            } else if (theme === "light") {
                localStorage.removeItem("theme", "dark");
                body.style.backgroundColor = "#ddd";
                body.style.color = "#000";
                welcome.style.backgroundColor = "#fff";
                welcome.style.color = "#000";
                contentcard.style.backgroundColor = "#ddd";
                contentcard.style.color = "#000";
                contentcard.style.borderColor = "rgba(0, 0, 0, 0.175)";
                localStorage.setItem("theme", "light");
            }
        }

        var savedTheme = localStorage.getItem("theme");
        if (savedTheme === "dark") {
            var select = document.getElementById("theme-select");
            select.value = "dark";
            changeTheme();
        } else if (savedTheme === "light") {
            var select = document.getElementById("theme-select");
            select.value = "light";
            changeTheme();
        } else {
            localStorage.removeItem("theme");
        }
    </script>
    <!-- thay doi font size -->
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const fontSizeInput = document.getElementById('font-size-input');
            var font_content = document.getElementsByClassName("font_content")[0];
            const storedFontSize = localStorage.getItem('fontSize');
            if (storedFontSize) {
                font_content.style.fontSize = storedFontSize;
                fontSizeInput.value = parseInt(storedFontSize);
            }

            fontSizeInput.addEventListener('input', () => {
                let fontSize = fontSizeInput.value;
                fontSize = Math.min(Math.max(parseInt(fontSize), 14), 20); // giới hạn giá trị từ 14 đến 20
                fontSize = `${fontSize}px`;
                font_content.style.fontSize = fontSize;
                localStorage.setItem('fontSize', fontSize);
            });
        });
    </script>
    <script>
        function changeFontFamily() {
            var fontFamilySelect = document.getElementById("font-family-select");
            var selectedFont = fontFamilySelect.options[fontFamilySelect.selectedIndex].value;
            document.body.style.fontFamily = selectedFont;
        }
    </script>
    <!-- Include Toastr CSS and JS -->
    <script src="//cdn.ckeditor.com/4.21.0/full/ckeditor.js"></script>
    <script type="text/javascript">
        CKEDITOR.replace('noidung_comment');
    </script>
    <script>
        $(document).ready(function() {
            $('.btn-edit').click(function() {
                $('.form-edit').toggleClass('d-none');
            });
        });
    </script>

</body>

</html>
