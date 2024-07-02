@extends('layouts.backend.backend')
@section('page_title')
    Thông tin giáo viên
@endsection

<head>
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css')}}">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css')}}">

     
</head>

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">

                <!-- Profile Image -->
                <div style="margin-top: 12px; margin-left: 6px" class="card card-primary card-outline">
                    <div class="card-body box-profile">
                        <div class="text-center">
                            <img class="profile-user-img img-fluid img-circle" src="{{asset('storage/'.$teacher->image_path)}}"
                                alt="User profile picture">
                        </div>

                        <h3 class="profile-username text-center">{{ $teacher->name }}</h3>

                        <ul class="list-group list-group-unbordered mb-3">
                            <li class="list-group-item">
                                <b>Email</b> <a class="float-right">{{ $teacher->email }}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Nhóm</b> <a class="float-right">Giáo viên</a>
                            </li>

                            <li class="list-group-item">
                                <b>Kinh nghiệm</b> <a class="float-right">{{ $teacher->exp }}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Mô tả</b>
                                <p>{{ $teacher->description }}</p>
                            </li>

                        </ul>

                        <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->


                <!-- /.card -->
            </div>
            <!-- /.col -->
            <div style="margin-top: 12px" class="col-md-9">
                <div class="card">

                    <ul style="padding: 8px" class="nav nav-pills">
                        <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">Bài viết</a></li>
                        <li class="nav-item"><a class="nav-link" href="#timeline" data-toggle="tab">Khóa học</a></li>

                    </ul>

                    <div class="card-body">
                        <div class="tab-content">
                            <div class="active tab-pane" id="activity">
                                <!-- Post -->
                              
                                @foreach ($posts as $item)
                                    <div style="margin: 10px 0;" class="singel-blog mt-80 row">
                                        <div class="blog-cont col-md-9">
                                            <a href="http://127.0.0.1:8000/posts/posts-detail/2">
                                                <h3>{{ $item->title }}</h3>
                                            </a>
                                            <ul>
                                                <li><a href="#"><i
                                                            class="fa fa-calendar"></i>{{ $item->created_at }}</a></li>
                                                <li><a href="#"><i class="fa fa-user"></i>{{ $teacher->name }}</a></li>

                                            </ul>
                                            <p
                                                style="display: -webkit-box;
                                          -webkit-box-orient: vertical;
                                          overflow: hidden;
                                          -webkit-line-clamp: 2;margin-bottom: 30px;">
                                                {{ $item->content }}</p>
                                            <span
                                                style="padding: 10px 20px;
                                            background-color: rgb(237, 237, 237);
                                            border-radius: 30px;"
                                                class="categories-post-tag mt-3">{{ $item->category->name }}</span>

                                                @if ($item->user_id==Auth::user()->id)
                                                    <div style="margin-top: 30px" class="d-flex align-items-center">
                                                        <a style="margin: 0 4px" href='{{ route('admin.post.edit', $item) }}'>
                                                            <span style="border-radius: 2px" title="Edit" type='button'
                                                                class="btn btn-flat btn-sm btn-primary">
                                                                <i class="fas fa-edit    "></i>
                                                            </span>
                                                        </a>
                        
                                                        <a style="margin: 0 4px; border-radius: 4px"
                                                            href='{{ route('admin.post.delete', $item) }}'>
                                                            <span style="border-radius: 2px" title="Delete" type='button'
                                                                onclick="return confirmDelete() " class="btn btn-flat btn-sm btn-danger">
                                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                                            </span></a>
                                                        </a>
                                                    </div>
                                                @endif
                                        </div>
                                        <div class="blog-thum col-md-3 d-flex align-items-center justify-content-center">
                                            <img style="width: 100%" src="{{ asset('storage/' . $item->image_path) }}" alt="Blog Detail">
                                        </div>
                                    </div>
                                @endforeach
                               
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="timeline">

                                <div class="courses-cont pt-20">
                                    <div class="row">
                                        @foreach ($teacher->courses as $course)
                                            <div class="col-md-6">
                                                <div class="singel-course mt-30">
                                                    <div class="thum">
                                                        <div class="image">
                                                            <img src="{{asset('storage/'.$course->image_path)}}" alt="Course">
                                                        </div>
                                                        <div class="price">
                                                            @if ($course->sale_price == 0)
                                                                <span>Free</span>
                                                            @else
                                                                <span><del>{{ number_format($course->price, 0, '', '.') }}
                                                                        đ</del>
                                                                    {{ number_format($course->sale_price, 0, '', '.') }}
                                                                    đ</span>
                                                            @endif
                                                        </div>
                                                    </div>
                                                    <div class="cont">
                                                       
                                                        <a href="#">
                                                            <h4>{{ $course->name }}</h4>
                                                        </a>
                                                        
                                                    </div>
                                                </div> <!-- singel course -->
                                            </div>
                                        @endforeach



                                    </div> <!-- row -->
                                </div> <!-- courses cont -->


                            </div>
                            <!-- /.tab-pane -->


                            <!-- /.tab-pane -->
                        </div>
                        <!-- /.tab-content -->
                    </div><!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div><!-- /.container-fluid -->
    </section>
@endsection
