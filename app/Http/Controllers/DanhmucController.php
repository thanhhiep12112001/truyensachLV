<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Danhmuc;
use App\Models\Truyen;
use Illuminate\Http\Response;

class DanhmucController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $Danhmuc = Danhmuc::orderBy('id','DESC')->get();
        return view('admincp.Danhmuc.index')->with(compact('Danhmuc'));

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        return view('admincp.Danhmuc.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'ten_danhmuc' =>'required|unique:Danhmuc|max:255',
            'slug_danhmuc' =>'required|unique:Danhmuc|max:255',

            'mo_ta' =>'required|max:255',
            'kichhoat'=>'required',
        ],
        [
            'ten_danhmuc.unique'=>'Tên danh mục đã có xin điền tên khác',
            'slug_danhmuc.unique'=>'Slug danh mục đã có xin điền slug khác',
            'ten_danhmuc.required'=>'Phải điền tên danh mục',
            'mo_ta.required'=>'Phải điền mô tả',
            'slug_danhmuc.required'=>'Phải điền slug danh mục',
        ]
    );
            $Danhmuc= new Danhmuc ();
            $Danhmuc->ten_danhmuc=$data['ten_danhmuc'];
            $Danhmuc->slug_danhmuc=$data['slug_danhmuc'];
            $Danhmuc->mo_ta=$data['mo_ta'];
            $Danhmuc->kichhoat=$data['kichhoat'];
            $Danhmuc->save();
            return redirect()->back()->with('status','Thêm danh mục thành công');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        $Danhmuc = Danhmuc::find($id);
        return view('admincp.Danhmuc.edit')->with(compact('Danhmuc'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        $data = $request->validate([
            'ten_danhmuc' =>'required|unique:Danhmuc|max:255',
            'slug_danhmuc' =>'required|unique:Danhmuc|max:255',
            'mo_ta' =>'required',
            'kichhoat'=>'required',
        ],
        [
            'ten_danhmuc.unique'=>'Tên danh mục đã có xin điền tên khác',
            'slug_danhmuc.unique'=>'Slug danh mục đã có xin điền slug khác',
            'ten_danhmuc.required'=>'Phải điền tên danh mục',
            'mo_ta.required'=>'Phải điền mô tả',
            'slug_danhmuc.required'=>'Phải điền slug danh mục',
        ]
    );
            $Danhmuc= Danhmuc::find($id);

            $Danhmuc->ten_danhmuc=$data['ten_danhmuc'];
            $Danhmuc->slug_danhmuc=$data['slug_danhmuc'];
            $Danhmuc->mo_ta=$data['mo_ta'];
            $Danhmuc->kichhoat=$data['kichhoat'];

            $Danhmuc->save();
            return redirect()->back()->with('status','Cập nhật danh mục thành công');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        $check_item = Truyen::where('danhmuc_id',$id)->get()->first();
        if($check_item){
            return redirect()->back()->with('status','Xóa danh mục thất bai do có tồn tại truyên thuộc danh mục');
        } else {
            Danhmuc::where('id',$id)->delete();
            return redirect()->back()->with('status','Xóa danh mục thành công');
        }
        return redirect()->back();
    }
}
