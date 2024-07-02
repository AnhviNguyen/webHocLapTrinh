<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Lesson;
use App\Models\Video;
use Illuminate\Http\Request;

class LessonController extends Controller
{
    public function index($id_video ){
        
       $video=Video::find($id_video);
       $lesson = $video->lesson;
       $course = $lesson->course;
      
       $previous_video = Video::where('lesson_id', $lesson->id)
            ->where('id', '<', $video->id)
            ->orderBy('id', 'desc')
            ->first();
           

        $next_video = Video::where('lesson_id', $lesson->id)
            ->where('id', '>', $video->id)
            ->orderBy('id', 'asc')
            ->first();
           
     
        return view ('pages.client.lesson', compact('lesson','course','video','previous_video','next_video'));
    }
}
