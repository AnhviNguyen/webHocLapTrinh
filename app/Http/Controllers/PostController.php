<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Post;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index(){
        $post = Post::getPostPag(5);
        $postRand = Post::getPostRand();
        $categories = Category::getAllCate();
        return view("pages.client.posts", [
            'posts' => $post,
            'postLike' => $postRand,
            'categories' => $categories
        ]);
    }

    public function postsByCategory(Category $category){
        $posts=$category->posts;
        $postRand = Post::getPostRand();
        $categories = Category::getAllCate();
        return view("pages.client.postsBycate", [
            'posts' => $posts,
            'cate' => $category,
            'postLike' => $postRand,
            'categories' => $categories
        ]);

    }

    public function test(Request $request){
        if($request->ajax() || 'NULL'){
          $products =Post::paginate(2);
          return view('posts.index',compact('products'));
        }
    }

    public function postDetail($id){

        $post=Post::find($id);
        $postsSameUser=$post->user->posts;

        $postRand = Post::take(3)->get();
   
        return view("pages.client.post-detail", [
            'post' => $post,
            'postSameUser' =>  $postsSameUser,
            'postRand' => $postRand
          ]);
    }

    public function write_post(){
        if (!Auth::guard('student')->check()) {
            return Redirect::guest(route('login'));
            
        } else {
            $categories = Category::getAllCate();
            return view('pages.client.write_post', [
                "categories" => $categories
            ]);
        }
    }


    public function add(Request $request){
            $request->validate(
                [
                    'image' => 'image',
                    'title' => 'required|string',
                    'content' => 'required|string',
                    'category_id' => ['required', 'integer', function ($attribute, $value, $fail) {
                        if ($value === '0') return $fail('Vui lòng chọn danh mục khóa học');
                    }],
                ],
                [
                    'required' => ':attribute bắt buộc phải nhập.',
                    'string' => ':attribute phải là kí tự.',
                    'numeric' => ':attribute phải là kiểu dữ liệu số',
                    'image' => 'File không hợp lệ. Vui lòng thử lại'
                ],
                [
                    'title' => 'Nội dung chính',
                    'category_id' => "Danh mục khóa học",
                    "image" => ' Hình ảnh',
                    'content' => 'Nội dung'

                ]
            );
    
            if ($request->has('image')) {
                $imagePath = $request->file('image')->store('img/news', 'public');
            }
    
            $post = new Post();
            $post->title = $request->title;
            $post->category_id = $request->category_id;
            $post->content = $request->content;
            $post->image_path = $imagePath;
            $post->user_id = Auth::guard('student')->user()->id;

            $post->save();
    
            return redirect()->route('posts.view');
    }

  
    
}
