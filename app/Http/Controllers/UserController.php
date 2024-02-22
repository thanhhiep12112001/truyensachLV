<?php

namespace App\Http\Controllers;

use App\Models\Lichsu;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $list_user = User::orderBy('id','DESC')->get();
        $list_user = User::orderByRaw('is_vip DESC')->get();
        return view('admincp.user.index')->with(compact('list_user'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        //
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
        //
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
        $user = User::find($id);
        $user->is_admin = $request->has('is_admin') ? 1 : null;

        $user->save();
        return redirect()->back()->with('status','Cập nhật user thành công');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        User::find($id)->delete();
        return redirect()->back()->with('status','Xóa user thành công');
    }
    public function editProfile()
    {
        $user = Auth::user();
        return view('pages.trangcanhan', compact('user'));
    }

    public function updateProfile(Request $request)
    {
        $user = Auth::user();

        $request->validate([
            'name' => 'required|string|max:255',
        ]);
        $user->update([
            'name' => $request->input('name'),
        ]);

        return redirect()->back()->with('status', 'Cập nhật thành công');
    }
}
