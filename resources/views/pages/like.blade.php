@extends('../layout')
@section('content')
<nav aria-label="breadcrumb">
  <ol class="breadcrumb bread-list bread_style">
    <h1>Danh sách truyện yêu thích</h1>
  </ol>
</nav>
<div class="container">
<div style="margin-top: 30px">
  
  <div class="album py-1">
    <div>
      <div class="row row-cols-1 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 row-cols-xl-6 g-3">
        @foreach($danhSachYeuThich as $truyen)
        <div class="col col-content">
          <a href="{{url('xem-truyen/'.$truyen->slug_truyen)}}" class="col-sm-9 d-flex flex-column" style="width: 130px">
            <img class="image-hover"  src="{{asset('public/uploads/truyen/'.$truyen->hinhanh)}}">
            <div class="d-block justify-content-center align-items-center" style="margin-top: 12px">
            <h6 class="text-center fw-bold" style="max-height: 80px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; display: block; width: 100%;">{{$truyen->tentruyen}}</h6>
              <div class="d-flex justify-content-center align-items-center">
              <button type="button" class="btn btn-sm btn-warning" style="max-height: 80px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; display: block; width: 100%;">{{$truyen->tacgia}}</button>
              </div>
            </div>
          </a>
        </div>
        @endforeach
      </div>
    </div>
  </div>
</div>
</div>
<style>
  a{
    text-decoration: none;
  }
</style>
@endsection