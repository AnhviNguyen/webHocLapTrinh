<?php
use App\Models\Cart;
use Illuminate\Support\Facades\Auth;

if (Auth::guard('student')->user()) {
    $numberCart = Cart::countCourseFromCart(Auth::guard('student')->user()->id);
} else {
    $numberCart='';
}

?>

<style>
    .cart-shop::after {
        content: '{{ $numberCart }}';
    }
</style>
<header id="header-part" class="border-bottom">
    <div class="header-logo-support ">
        <div class="container-fluid ">
            <div class="row">
                <div class="col-lg-4 d-none d-xl-block">
                    <div class="logo">
                        <a class="d-flex justify-content-center align-items-center" href="{{ route('home') }}">
                            <img class="logo mx-3" src="/client/images/logo.png" alt="logo">
                            <h6 class="content-logo">LiVi<span>Code</span></h6>
                        </a>
                    </div>
                </div>

                <div class="search_box-total col-lg-4 col-md-8  d-none d-sm-block">
                    <form class="search_box" action="{{ url('search_product') }}" method="POST">
                        @csrf
                        <input type="text" name="search" id="search_input"
                            placeholder="Tìm kiếm khóa học, bài viết, video ...">
                        <button type="submit"><i class="fa fa-search search_box-btn" aria-hidden="true"></i></button>
                    </form>
                </div>

                <div id="result" class="panel panel-default" style="display: none;">
                    <ul class="list-group" id="list-result">

                    </ul>
                </div>




                <div class="col-lg-4 col-md-4 col-12 d-flex justify-content-end align-items-center">

                    @if (Auth::guard('student')->check())
                        <div class="d-flex justify-content-between align-items-center">
                            <a href="{{ route('cart', ['id' => Auth::guard('student')->user()->id]) }}"><i
                                    class="fa fa-shopping-cart cart-shop"
                                    data-number-cart="{{ $numberCart->number_of_courses ?? '0' }} aria-hidden="true"></i></a>

                            <p id='showBoxButton' class="auth-user" href="">
                                {{ Auth::guard('student')->user()->name }}

                                <i class="fa fa-caret-down" aria-hidden="true"></i>
                            </p>
                            <ul id="hiddenBox" class="user-detail">
                                <div>
                                    <a href="{{ route('student.view-profile', Auth::guard('student')->user()->id) }}">Xem
                                        thông tin cá nhân</a>
                                  
                                    <a class="logout-item" href="{{ route('logout') }}"
                                        onclick="event.preventDefault();
                                                 document.getElementById('logout-form').submit();">
                                        {{ __('Đăng xuất') }}
                                    </a>
                                </div>
                            </ul>
                        </div>

                        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                            @csrf
                        </form>
                    @else
                        <div class=" button float-left">
                            <a href="{{ route('login') }}" class="main-btn">Đăng nhập</a>
                        </div>
                        <div class="button float-left">
                            <a href="{{ route('register') }}" class="main-btn">Đăng ký</a>
                        </div>
                    @endif


                </div>

            </div> <!-- row -->
        </div> <!-- container -->
    </div> <!-- header logo support -->

    

</header>


<script>
    let isBoxVisible = false;

    document.getElementById('showBoxButton').addEventListener('click', function(event) {
        if (isBoxVisible) {
            document.getElementById('hiddenBox').style.display = 'none';
        } else {
            document.getElementById('hiddenBox').style.display = 'block';
        }
        isBoxVisible = !isBoxVisible; // Chuyển đổi trạng thái
        event.stopPropagation(); // Ngăn sự kiện click từ việc lan truyền đến body
    });

    document.body.addEventListener('click', function() {
        if (isBoxVisible) {
            document.getElementById('hiddenBox').style.display = 'none';
            isBoxVisible = false; // Cập nhật trạng thái
        }
    });
</script>
