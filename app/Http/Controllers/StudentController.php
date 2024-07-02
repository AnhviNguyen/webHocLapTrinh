<?php

namespace App\Http\Controllers;

use App\Models\Student;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Hash;

class StudentController extends Controller
{

    protected function redirectTo() {
        return '/login'; // Chuyển hướng đến trang dashboard của admin sau khi đăng nhập thành công
    }
    public function showFormLogin(Request $request)
    {
        return view("pages.client.login");
    }
    public function showFormRegister(Request $request)
    {
        return view("pages.client.register");
    }
    public function login(Request $request)
    {
        $request->validate(
            [
               'email' => 'required|string|email',
                'password' => 'required|string|min:6',
            ],
            [
                'required' => ':attribute bắt buộc phải nhập.',
                'email' => ':attribute không đúng định dạng.',
                'string' => ':attribute phải là kí tự.',
                'min' => ':attribute phải có ít nhất :min kí tự.'
            ],
            [
               'email' => 'Email',
                'password' => 'Mật khẩu'
            ]
        );

        $dataLogin=$request->except(['_token']);
       
        if(Auth::guard('student')->attempt($dataLogin)){

            return redirect()->route('home');
        } else {
            return redirect()->route('login')->with('msg','Đăng nhập không thành công. Vui lòng thử lại.');
        }
    }


    public function register(Request $request){
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:students'],
            'password' => ['required', 'string', 'min:6', 'confirmed'],
        ], [
            'required' => ':attribute bắt buộc phải nhập.',
            'email'=>':attribute không đúng định dạng.',
            'string' => ':attribute phải là kí tự.',
            'min'=>':attribute phải có ít nhất :min kí tự.',
            'max'=>':attribute nhiều nhất ít nhất :max kí tự.',
            'unique'=> ':attribute đã tồn tại.',
            'confirmed'=>':attribute không khớp.'
        ], [
            'name' => 'Họ và tên',
            'email'=> 'Email',
            'password'=> 'Mật khẩu'
        ]);
    
        Student::create([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'password' => Hash::make($request->input('password')),
        ]);
    
        return redirect()->route('login')->with('msg','Đăng ký tài khoản thành công.');
    }
    
    
    public function logout(Request $request)
    {
        $this->guard()->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        if ($response = $this->loggedOut($request)) {
            return $response;
        }

        return $request->wantsJson()
            ? new JsonResponse([], 204)
            : redirect('/login');
    }

    protected function guard()
    {
        return Auth::guard('student');
    }

    protected function loggedOut(Request $request)
    {
        //
    }

    public function viewProfile()
    {
        if (Auth::guard('student')->user()) {
            return view("pages.client.profile");
        } else {
            return redirect()->route("login");
        }
    }
    public function editProfile($id, Request $request)
    {
        $student=Student::find($id);
        $request->validate(
            [
                'name' => 'required|string|',
                'email' => 'required|string|email',
                'image' => 'image'
            ],
            [
                'required' => ':attribute bắt buộc phải nhập.',
                'email' => ':attribute không đúng định dạng.',
                'string' => ':attribute phải là kí tự.',
                'min' => ':attribute phải có ít nhất :min kí tự.',
                'image' => 'File không hợp lệ. Vui lòng thử lại'
            ],
            [
                'name' => 'Họ tên',
                'email' => 'Email',
                'password' => 'Mật khẩu',
                'image' => 'Hình ảnh'
            ]
        );

        if ($request->has('image')) {
            $imagePath = $request->file('image')->store('img/users', 'public');
            $student->image_path=$imagePath;
        }
        $student->name = $request->name;
        if (!empty($student->password)) {
            $student->password = bcrypt($request->password);
        }
        $student->save();
        return back()->with('notice', 'Cập nhật thông tin thành công');
    }
}
