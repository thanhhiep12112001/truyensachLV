@extends('layouts.app')

@section('content')
@include('layouts.nav')
<div class="container">
    <div class="row justify-content-center">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">Cập nhật danh mục</div>
          @if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
          <div class="card-body"> @if (session('status')) <div class="alert alert-success" role="alert">
              {{ session('status') }}
            </div> @endif <form method="POST" action="{{route('danhmuc.update',[$Danhmuc->id])}}">
                @method('PUT')
                @csrf
              <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Tên danh mục</label>
                <input id="slug" onkeyup="ChangeToSlug();" name="ten_danhmuc" value="{{$Danhmuc->ten_danhmuc}}" type="text" class="form-control" placeholder="Tên danh mục...">
              </div>
              <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Slug danh mục</label>
                <input id="convert_slug" name="slug_danhmuc" value="{{$Danhmuc->slug_danhmuc}}" type="text" class="form-control" placeholder="Slug danh mục...">
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Mô tả</label>
                <input type="text" class="form-control" value="{{$Danhmuc->mo_ta}}" name="mo_ta" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Mô tả">
              </div>
              <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Kích hoạt</label>
                <select name="kichhoat" class="form-select" aria-label="Default select example">
                    @if($Danhmuc->kichhoat==0)
                    <option selected value="0">Kích hoạt</option>
                    <option value="1">Không kích hoạt</option>
                    @else
                    <option value="0">Kích hoạt</option>
                    <option selected value="1">Không kích hoạt</option>
                    @endif
                  </select>
              </div>
              <button type="submit" name="themdanhmuc" class="btn btn-primary">Cập nhật</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
@endsection