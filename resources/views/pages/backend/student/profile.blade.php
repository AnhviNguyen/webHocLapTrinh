@extends('layouts.backend.backend')
@section('page_title')
    Thông tin học viên
@endsection

<head>
    <link rel="stylesheet" href="'plugins/fontawesome-free/css/all.min.css')}}">
    <!-- Theme style -->
    <link rel="stylesheet" href="'dist/css/adminlte.min.css')}}">
</head>

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">

                <!-- Profile Image -->
                <div style="margin-top: 12px; margin-left: 6px" class="card card-primary card-outline">
                    <div class="card-body box-profile">
                        <div class="text-center">
                            <img class="profile-user-img img-fluid img-circle"
                                src="{{ asset('storage/' . $student->image_path) }}" alt="student profile picture">
                        </div>

                        <h3 class="profile-studentname text-center">{{ $student->name }}</h3>

                        <ul class="list-group list-group-unbordered mb-3">
                            <li class="list-group-item">
                                <b>Email</b> <a class="float-right">{{ $student->email }}</a>
                            </li>


                        </ul>


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

                        <li class="nav-item"><a class="nav-link" href="#timeline" data-toggle="tab">Khóa học</a></li>

                    </ul>

                    <div class="card-body">


                        @foreach ($student->courses as $item)
                            <div class="singel-course mt-30">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <div class="thum">
                                            <div class="image">
                                                <img src="{{asset('storage/'.$item->image_path)}}" alt="Course">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div style="margin-left: 20px" class="cont p-0">
                                            <a href="{{ route('courses.courseDetail', ['id'=>$item->id]) }}">
                                                <h4 class="pt-0 pb-3">{{ $item->name }}</h4>
                                            </a> <br>
                                           
                                            <div class="price"> <span><del>{{ $item->price }} đ</del>
                                                    {{ $item->sale_price }} đ</span></div>
                                            <div class="course-teacher">
                                                <div class="thum">
                                                    <a href="{{ route('teachers.teacherDetail', ['id'=>$item->teacher->id]) }}"><img src="{{asset('storage/'.$item->teacher->image_path)}}" alt="teacher"></a>
                                                </div>
                                                <div class="name pr-3 pt-2">
                                                    <a href="{{ route('teachers.teacherDetail', ['id'=>$item->teacher->id]) }}">
                                                        <h6>{{ $item->teacher->name }}</h6>
                                                    </a>
                                                </div>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div> <!--  row  -->
                            </div>
                        @endforeach


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
