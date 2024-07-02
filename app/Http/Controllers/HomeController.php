<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Course;
use App\Models\Post;
use App\Models\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller


{
    private $coursesForFree;
    private $paidCourse;
    private $teacherAtHome;
    private $postAtHome;
    private $courseCate;
    
    public function __construct() {
        $this->coursesForFree = Course::getCoursesForFree();
        $this->paidCourse = Course::getPaidCourse();
        $this->teacherAtHome = Teacher::getTeachersAtHome();
        $this->postAtHome = Post::getPostsAtHome();
    }


    /**
     * Create a new controller instance.
     *
     * @return void
     */
    // public function __construct()
    // {
    //     $this->middleware('auth');
    // }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    
    public function index()

    {



        $coursesOfStudent=[];
        if(Auth::guard('student')->user()){
            $coursesOfStudent=Auth::guard('student')->user()->courses;
          
        }

        $categories=Category::take(3)->get();
       
        return view('pages.client.home', [
            'categories'=>$categories,
            'coursesFree' => $this->coursesForFree,
            'coursePaid' => $this->paidCourse,
            'teachers' => $this->teacherAtHome,
            'posts' => $this->postAtHome,
            'coursesOfStudent'=>$coursesOfStudent
            
        ]);
    }
}
