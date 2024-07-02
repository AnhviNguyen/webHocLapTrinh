@extends('layouts.clients.client')
@section('title')
   Thanh toán
@endsection

@section('content')
    <div style="height: 100%;
display: flex;
align-items: center;" class="container mt-4 p-0">

        <div class="row col-12">
            <div class="col-lg-8">
                <p class="pb-2 fw-bold">Order</p>
                <div class="card">

                    <div>
                        <div class="table-responsive px-md-4 px-2 pt-3">
                            <table class="table table-borderless">
                                <tbody>
                                    <tr class="border-bottom">
                                        <div class="row">


                                            <div style="border-bottom: 1px solid #ccc" class="col-lg-12">
                                                <div class="singel-course mt-30">
                                                    <div class="row no-gutters">
                                                        <div class="col-md-3 mr-5">
                                                            <div class="thum">
                                                                <div class="image">
                                                                    <img src="{{ asset('storage/'.$course->image_path)  }}" alt="Course">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="cont p-0">
                                                                <a href="#">
                                                                    <h4 class="pt-0 pb-3">{{ $course->name }} </h4>
                                                                </a> <br>

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
                                                        </div>
                                                    </div> <!--  row  -->
                                                </div> <!-- singel course -->
                                            </div>

                                        </div>
                                    </tr>
                                    <tr class="border-bottom">

                                    </tr>
                                    <tr class="">

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 payment-summary">
                <p class="fw-bold pt-lg-0 pt-4 pb-2">Payment Summary</p>
                <div class="card px-md-3 px-2 pt-4">



                    <div class="d-flex flex-column b-bottom">

                        <div class="d-flex justify-content-between"> <small class="text-muted">Tổng tiền</small>
                            <p>{{ $course->sale_price }}</p>
                        </div>
                    </div>

                </div>
            </div>
            <form style="display: block;margin: 0 auto;margin-top: 30px;"  action="{{ route('post-payment', $course) }}" method="POST">
                @csrf
                <button  type="submit" class="btn btn-primary">Thanh
                    toán</button>
            </form>

        </div>
    </div>
@endsection

