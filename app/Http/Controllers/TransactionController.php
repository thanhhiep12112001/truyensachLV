<?php

namespace App\Http\Controllers;

use App\Models\Transaction;

class TransactionController extends Controller
{
    //
    public function index()
    {
        $trans = Transaction::all();
        return view('admincp/giaodich/index')->with(compact('trans'));
    }
}
