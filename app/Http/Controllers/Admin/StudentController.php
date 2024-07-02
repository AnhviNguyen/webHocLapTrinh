<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Group;
use App\Models\Post;
use App\Models\User;
use App\Models\Admin;
use App\Models\Category;
use App\Models\Course;
use App\Models\Order;
use App\Models\Teacher;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;

class StudentController extends Controller
{

    public function index()
    {
    }
    public function add()
    {
        return view("pages.backend.student.add");
    }
    public function postAdd(Request $request)
    {

        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:students'],
            'password' => ['required', 'string', 'min:6'],
        ], [
            'required' => ':attribute bắt buộc phải nhập.',
            'email' => ':attribute không đúng định dạng.',
            'string' => ':attribute phải là kí tự.',
            'min' => ':attribute phải có ít nhất :min kí tự.',
            'max' => ':attribute nhiều nhất ít nhất :max kí tự.',
            'unique' => ':attribute đã tồn tại.',

        ], [
            'name' => 'Họ và tên',
            'email' => 'Email',
            'password' => 'Mật khẩu'
        ]);

        Student::create([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'password' => Hash::make($request->input('password')),
        ]);

        return redirect()->route("admin.student.list")->with("success", "Thêm học viên thành công");
    }

    public function listStudent()
    {

        $students = Student::orderBy('created_at','desc')->paginate(6);
        return view("pages.backend.student.list",compact('students'));
    }


    public function profile(Student $student)
    {

     
        


        return view("pages.backend.student.profile", compact(['student']));
    }

    public function edit(Student $student)
    {
        return view("pages.backend.student.edit",compact('student'));
    }
    public function postEdit(Request $request, Student $student)
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            
        ], [
            'required' => ':attribute bắt buộc phải nhập.',
            'email' => ':attribute không đúng định dạng.',
            'string' => ':attribute phải là kí tự.',
            'min' => ':attribute phải có ít nhất :min kí tự.',
            'max' => ':attribute nhiều nhất ít nhất :max kí tự.',
            'unique' => ':attribute đã tồn tại.',
            'confirmed' => ':attribute không khớp.'
        ], [
            'name' => 'Họ và tên',
            'email' => 'Email',
            'password' => 'Mật khẩu'
        ]);

        $student->name = $request->input('name');

        if ($request->has('image')) {
            $imagePath = $request->file('image')->store('img/users', 'public');
            $student->image_path = $imagePath;
        }
        $student->save();

        return redirect()->route("admin.student.list")->with("success", "Cập nhật học viên thành công");
    }

    public function delete(Student $student)
    {

        if ($student->delete()) {
            return back()->with("success", "Xóa người dùng thành công");
        } else {
            return back()->with("error", "Đã có lỗi xảy ra. Vui lòng thử lại");
        }
    }
}
