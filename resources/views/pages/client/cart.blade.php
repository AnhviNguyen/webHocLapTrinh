@extends('layouts.clients.client')
@section('title')
    Giỏ hàng
@endsection

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

@section('content')
    <section>
        <form action="{{ route('post-cart-payment') }}" method="POST">
            @csrf
            <div class="container mt-100">
                <table id="cart" class="table table-condensed">
                    <thead>
                        <tr>
                            <th style="width:50%; font-size: 20px;">Khóa học</th>
                            <th style="width:10%">Giá</th>
                            <th style="width:22%" class="text-center">Số tiền</th>
                            <th style="width:10%"></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($courses as $course)
                            <tr>
                                <td data-th="Product">
                                    <div class="row my-4">
                                        <div class="checkbox-wrapper-31">
                                            <input type="checkbox" name="courses[]" class="course-checkbox"
                                                id="course_{{ $course->id }}" data-price="{{ $course->sale_price }}"
                                                value="{{ $course->id }}" onchange="updateTotal()">
                                            <svg viewBox="0 0 35.6 35.6">
                                                <circle class="background" cx="17.8" cy="17.8" r="17.8"></circle>
                                                <circle class="stroke" cx="17.8" cy="17.8" r="14.37"></circle>
                                                <polyline class="check" points="11.78 18.12 15.55 22.23 25.17 12.87">
                                                </polyline>
                                            </svg>
                                        </div>
                                        <div class="col-sm-3 hidden-xs d-flex justify-content-center align-items-center">
                                            <img style="border-radius: 8px;" src="{{ asset('storage/'. $course->image_path) }}"
                                                alt="img_course" class="img-responsive" />
                                        </div>
                                        <div class="col-sm-8">
                                            <h4 class="nomargin">{{ $course->name }}</h4>
                                            <p class="course-ctn">{{ $course->detail }}</p>
                                        </div>
                                    </div>
                                </td>
                                <td data-th="Price ">
                                    <p class="my-4">
                                        <div class="price">
                                            <span><del style="color: gray;">{{ number_format($course->price, 0, '', '.') }} đ
                                                </del>
                                                {{ number_format($course->sale_price, 0, '', '.') }} đ</span>
                                        </div>
                                    </p>
                                </td>
                                <td data-th="Subtotal" class="text-center my-4">
                                    <p class="my-4"><span
                                            style="color: red;">{{ number_format($course->sale_price, 0, '', '.') }}
                                            đ</span></p>
                                </td>
                                <td class="actions" data-th="">
                                    <a href="{{ route('removeCart', ['courseId' => $course->id]) }}">
                                        <button class="noselect button_edit mt-4" type="button">
                                            <span class="text">Xóa</span>
                                            <span class="icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewBox="0 0 24 24">
                                                    <path
                                                        d="M24 20.188l-8.315-8.209 8.2-8.282-3.697-3.697-8.212 8.318-8.31-8.203-3.666 3.666 8.321 8.24-8.206 8.313 3.666 3.666 8.237-8.318 8.285 8.203z">
                                                    </path>
                                                </svg>
                                            </span>
                                        </button>
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr>
                            <td><a href="{{ route('courses.view') }}" class="btn btn-warning"><i
                                        class="fa fa-angle-left pr-3"></i>Tiếp tục xem khóa học</a></td>
                            <td colspan="2" class="hidden-xs"></td>
                            <td class="hidden-xs text-center pt-4">
                                <b>Total: <span id="totalAmount">0 đ</span></b>
                            </td>
                            <td>
                                <button onclick="return confirmPayment()" type="submit" class="btn btn-success btn-block">Mua khóa học <i class="fa fa-angle-right"></i>
                                </button>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </form>
    </section>

    <script>
        function confirmPayment() {
            var result = confirm("Bạn có chắc chắn muốn thanh toán không?");
            return result;
        }

        function confirmRestore() {
            var result = confirm("Bạn có chắc chắn muốn khôi phục không?");
            return result;
        }

        function updateTotal() {
            var checkboxes = document.querySelectorAll('.course-checkbox');
            var totalAmount = 0;
            checkboxes.forEach(function (checkbox) {
                if (checkbox.checked) {
                    totalAmount += parseFloat(checkbox.getAttribute('data-price'));
                }
            });
            document.getElementById('totalAmount').innerText = numberFormat(totalAmount);
        }

        function numberFormat(number) {
            return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(number);
        }
    </script>
@endsection
