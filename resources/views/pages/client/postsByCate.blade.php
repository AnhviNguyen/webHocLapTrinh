@php
    use Carbon\Carbon;
@endphp

@extends('layouts.clients.client')
@section('title')
Các bài viết 
@endsection
@section('content')
<section id="blog-page" class="pt-80 pb-120">
    <div class="container container-edit">
       <div class="row">
           <div class="col-lg-8">

                @foreach ($posts as $post)
               <div class="singel-blog mt-80 row">  
                   <div class="blog-cont col-md-8">
                       <a href="{{ route('posts.postDetail', ['id' => $post->id]) }}"><h3>{{$post->title}}</h3></a>
                       <ul>
                           <li><a href="#"><i class="fa fa-calendar"></i>{{ Carbon::parse($post->created_at)->format('F d, Y') }}</a></li>
                           <li><a href="#"><i class="fa fa-user"></i>{{$post->user_name}}</a></li>
                           <li><a href="#"><i class="fa fa-tags"></i>Education</a></li>
                       </ul>
                       <p>{!! substr(htmlspecialchars($post->content), 0, 122) !!}...</p>
                       <span class="categories-post-tag mt-3">{{$cate->name}}</span>
                   </div>
                   <div class="blog-thum col-md-4 pr-6 d-flex align-items-center justify-content-center">
                    <img src="{{ asset('storage/'.$post->image_path)  }}" alt="Blog Detail">
                   </div>
               </div> <!-- singel blog -->
               @endforeach

            <!-- row -->

           </div>
           <div class="col-lg-4 mt-50">
               <div class="saidbar">
                   <div class="row ml-4">
                       <div class="col-lg-12 col-md-6 ">
                           <div class="categories mt-30 ">
                               <h4  class="d-flex align-items-center justify-content-center">Categories</h4>
                               <ul>
                                    @foreach ($categories as $category)
                                        <li><a href="{{ route('posts.category', $category) }}">{{$category->name}}</a></li>
                                    @endforeach
                               </ul>
                           </div>
                       </div> <!-- categories -->
                       <div class="col-lg-12 col-md-6">
                           <div class="saidbar-post mt-30">
                               <h4 class="d-flex align-items-center justify-content-center">Popular Posts</h4>
                               <ul>
                                   <li>
                                        @foreach ($postLike as $post)
                                        <a href="{{ route('posts.postDetail',$post->id) }}" class="mb-6">
                                            <div class="singel-post">
                                               <div class="thum">
                                                <img src="{{ asset('storage/'.$post->image_path)  }}" alt="Blog Detail">
                                               </div>
                                               <div class="cont">
                                                   <h6>{{$post->title}}</h6>
                                                   <span>{{ Carbon::parse($post->created_at)->format('F d, Y') }}</span>
                                               </div>
                                           </div> <!-- singel post -->
                                        </a>
                                        @endforeach
                                   </li>
                               </ul>
                           </div> <!-- saidbar post -->
                       </div>
                   </div> <!-- row -->
               </div> <!-- saidbar -->
           </div>
       </div> <!-- row -->
    </div> <!-- container -->
</section>
@endsection