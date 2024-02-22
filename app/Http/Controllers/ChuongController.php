<?php

namespace App\Http\Controllers;

use App\Models\Chuong;
use App\Models\Truyen;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class ChuongController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $chuong_t = Chuong::with('truyen')->orderBy('id', 'DESC')->paginate(3);
        return view('admincp.chuong.index')->with(compact('chuong_t'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $truyen = Truyen::orderBy('id', 'DESC')->get();
        return view('admincp.chuong.create')->with(compact('truyen'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $data = $request->validate(
            [
                'tieude' => 'required|unique:chuong|max:255',
                'slug_chuong' => 'required|unique:chuong|max:255',
                'noidung' => 'required',
                'kichhoat' => 'required',
                'truyen_id' => 'required',
            ],
            [
                'tieude.required' => 'Vui lòng nhập tiêu đề',
                'tieude.unique' => 'Tiêu đề đã tồn tại vui lòng điền tên khác',
                'slug_chuong.required' => 'Vui lòng nhập slug chương',
                'slug_chuong.unique' => 'Slug chương đã tồn tại vui lòng điền slug khác',
                'noidung.required' => 'Vui lòng nhập nội dung truyện',
            ]
        );
        $truyen = Truyen::find($request->truyen_id);
        if ($truyen) {
            $dem = $truyen->chuong->count();
            $chuong = new Chuong();
            $chuong->tieude = $data['tieude'];
            $chuong->slug_chuong = $data['slug_chuong'];
            $chuong->noidung = $data['noidung'];
            $chuong->kichhoat = $data['kichhoat'];
            $chuong->truyen_id = $data['truyen_id'];

            $vitri = intval(($dem / 2) + 1);

            if ($dem == 1 || $dem > $vitri) {
                $chuong->is_vip = 1;
            } else {
                $chuong->is_vip = 0;
            }
            $chuong->save();
            return redirect()->back()->with('status', 'Thêm chương thành công');
        } else {
            return redirect()->back()->with('status', 'Fails!');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        $chuong = Chuong::find($id);
        $truyen = Truyen::orderBy('id', 'DESC')->get();
        return view('admincp.chuong.edit')->with(compact('truyen', 'chuong'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        $data = $request->validate(
            [
                'tieude' => 'required|max:255',
                'slug_chuong' => 'required|max:255',
                'noidung' => 'required',
                'kichhoat' => 'required',
                'truyen_id' => 'required',
            ],
            [
                'tieude.required' => 'Vui lòng nhập tiêu đề',
                'slug_chuong.required' => 'Vui lòng nhập slug chương',
                'noidung.required' => 'Vui lòng nhập nội dung truyện',
            ]
        );
        $chuong = Chuong::find($id);
        $chuong->tieude = $data['tieude'];
        $chuong->slug_chuong = $data['slug_chuong'];
        $chuong->noidung = $data['noidung'];
        $chuong->kichhoat = $data['kichhoat'];
        $chuong->truyen_id = $data['truyen_id'];
        $chuong->save();
        return redirect()->back()->with('status', 'Cập nhật chương thành công');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return Response
     */
    public function destroy($id)
    {
        Chuong::find($id)->delete();
        return redirect()->back()->with('status', 'Xóa chương thành công');
    }

    public function timkiem(Request $request)
    {
        $truyen = Truyen::orderBy('id', 'DESC')->get();
        $chuong_t = Chuong::with('truyen')->paginate(4);
        $tukhoa = $request->input('tukhoa', '');
        if ($tukhoa !== '') {
            $chuong_t = Chuong::with('truyen')->where('tieude', 'LIKE', '%' . $tukhoa . '%')->orWhereHas('truyen', function ($query) use ($tukhoa) {
                $query->where('tentruyen', 'LIKE', '%' . $tukhoa . '%')->orWhere('tacgia', 'LIKE', '%' . $tukhoa . '%');
            })->paginate(4);
        }

        return view('admincp.chuong.index')->with(compact('truyen', 'chuong_t', 'tukhoa'));
    }


}
