<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Course;
use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CourseController extends Controller
{
    public function index(Request $request)
    {

        $query = Course::query();

        if ($request->filled('category')) {
            $query->whereHas('category', function ($q) use ($request) {
                $q->whereIn('id', $request->category);
            });
        }

        if (isset($request->min) && $request->min != null) {
            $query->where('price', '>=', $request->min);
        }
        if (isset($request->max) && $request->max != null) {
            $query->where('price', '<=', $request->max);
        }

        $courses = Course::getCoursePaginated($query, 6);
        $countCourse = Course::getCountCourse($query);

        $cate = Category::getAllCate();

        return view("pages.client.courses", [
            'courses' => $courses,
            'count' => $countCourse,
            'category' => $cate
        ]);
    }

    public function courseDetail($id)
    {
        $course = Course::find($id);
        $coursesOfStudent = [];

        $firstLesson = $course->lessons->first()->videos->first();



        if (Auth::guard('student')->user()) {
            $coursesOfStudent = Auth::guard('student')->user()->courses;
        }
        if (!$course) {
            abort(404, "Page not found");
        } else {
            $category=$course->category;
            $coursesCate=$category->courses;
            $courseLatest = Course::getCourseRandom($course->id);
            $lesson = $course->lessons;
            $reviews = Review::getReviewByCourse($id, 5);

            return view('pages.client.course-detail', [
                'course' => $course,
                'coursesCate' => $coursesCate,
                'courseLatest' => $courseLatest,
                'lessons' => $lesson,
                'reviews' => $reviews,
                'coursesOfStudent' => $coursesOfStudent,
                'firstLesson' => $firstLesson
            ]);
        }
    }
}
