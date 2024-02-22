<?php

namespace App\Http\Controllers;

use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use function auth;

class PaymentController extends Controller

{
    // Thanh toán bằng VN-PAY / Demo thanh toán bằng ngân hàng NCB
    public function payment(Request $request)
    {
        $total = $request->prices;
        // Tạo CODE đơn hàng tự động
        $randomNumber = mt_rand(9999, 1000000);
        $orderCode = "OD-" . $randomNumber;
        // Cấu hình VN-PAY
        error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED);
        date_default_timezone_set('Asia/Ho_Chi_Minh');
        // URL giao diện thanh toán VN-PAY
        $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        // URL trả về khi thanh toán thành công
        $vnp_Returnurl = "http://127.0.0.1:8000/thanh-toan/ket-qua-giao-dich";
        // Tài khoản và mật khẩu của SANBOX VN-PAY (Demo Test)
        $vnp_TmnCode = "N64WNFSX";//Mã website tại VN-PAY
        $vnp_HashSecret = "EEIZYGHTNYAXGDCRYNQTDEAYGFIZQJSN";//Chuỗi kí tự bí mật
        // Cấu hình thông tin thanh toán đặt vé
        $vnp_TxnRef = $orderCode; //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
        $vnp_OrderInfo = 'Thanh toán mua gói nâng cấp tài khoản TRUYENHAY24H';// Thông tin đơn hàng
        $vnp_Amount = $total * 100; // Tổng tiền cần thanh toán
        $vnp_Locale = 'vn'; // việt nam
        $vnp_OrderType = 'payment';
        // tạo mảng chứa thông tin thanh toán VN-PAY
        $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];
        $inputData = array(
            "vnp_Version" => "2.1.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => date('YmdHis'),
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => $vnp_Returnurl,
            "vnp_TxnRef" => $vnp_TxnRef,
        );

        if (isset($vnp_BankCode) && $vnp_BankCode != "") {
            $inputData['vnp_BankCode'] = $vnp_BankCode;
        }

        if (isset($vnp_Bill_State) && $vnp_Bill_State != "") {
            $inputData['vnp_Bill_State'] = $vnp_Bill_State;
        }
        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashdata .= urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = $vnp_Url . "?" . $query;

        if (isset($vnp_HashSecret)) {
            $vnpSecureHash = hash_hmac('sha512', $hashdata, $vnp_HashSecret);//
            $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
        }
        $returnData = array('code' => '00'
        , 'message' => 'Thanh toán mua gói nâng cấp tài khoản thành công.'
        , 'data' => $vnp_Url);
        if (isset($_POST['redirect'])) {
            header('Location: ' . $vnp_Url);
            die();
        } else {
            echo json_encode($returnData);
        }
        return redirect($vnp_Url);
    }

    public function response(Request $request)
    {
        // Xử lý khi thanh toán thành công
        if ($request->vnp_ResponseCode === "00") {

            // Thêm thời gian hết hạn VIP (ví dụ: thêm 30 ngày)
            $expireDate = now()->addDays(30);
            // cập nhật loại tài khoản khi thanh toán thành công
            DB::table('users')->where('id', '=', auth()->user()->id)
                ->update(
                    [
                        'is_vip' => 1,
                        'vip_expire_at' => $expireDate
                    ]
                );
            // lưu thông tin giao dịch của người dùng
            $transaction = Transaction::create([
                'trans_no' => $request->vnp_TransactionNo, // Mã giao dịch
                'bank_code' => $request->vnp_BankCode,
                'trans_amount' => $request->vnp_Amount / 100,
                'trans_type' => $request->vnp_CardType,
                'trans_info' => $request->vnp_OrderInfo,
                'status' => 'thanh toán thành công',
                'id_user' => auth()->user()->id
            ]);
            if ($transaction) {
                return redirect('/nang-cap-tai-khoan')->with('status', 'Nâng cấp tài khoản thành công');
            } else {
                return redirect('/nang-cap-tai-khoan')->with('status', 'Nâng cấp tài khoản thành công. Không thể lưu thông tin giao dịch');
            }

        } else {
            // Xử lý khi thanh toán thất bại
            return redirect('/nang-cap-tai-khoan')->with('error', 'Nâng cấp tài khoản thất bại! Gặp lỗi trong quá trình thành toán');
        }

    }
}
