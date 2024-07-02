<!DOCTYPE html>
<!-- Coding by CodingLab | www.codinglabweb.com-->
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>

    <!-- CSS -->
    <link rel="stylesheet" href="{{ asset('client/css/style.css') }}">

    <!-- Boxicons CSS -->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>

</head>

<body>
    <section class="container-login forms">
        <div class="form login">
            <div class="form-content">
                <header>Chào mừng đến với LiViCode</header>
                <form method="POST" action="{{ route('register') }}">
                    @csrf
                    <div class="field input-field">
                        <input id="email" type="text" placeholder="Họ và tên"
                            class="input @error('name') is-invalid @enderror" name="name"
                            value="{{ old('name') }}">
                        @error('name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="field input-field">
                        <input id="email" type="text" placeholder="Email"
                            class="input @error('email') is-invalid @enderror" name="email"
                            value="{{ old('email') }}">
                        @error('email')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>

                    <div class="field input-field">
                        <input type="password" placeholder="Mật khẩu"
                            class="password @error('password') is-invalid @enderror" name="password">
                        @error('password')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="field input-field">
                        <input type="password" placeholder="Nhập lại mật khẩu"
                            class="password" id="password-confirm" name="password_confirmation" >
                        @error('password')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>

                   

                    <div class="field button-field">
                        <button type="submit" class="btn btn-primary">Đăng ký</button>
                    </div>
                </form>

                <div class="form-link">
                    <span>Bạn đã có tài khoản ? <a href={{ route('login') }} class="link signup-link" >Đăng nhập</a></span>
                </div>
            </div>

            


        </div>

       
       
    </section>

    <!-- JavaScript -->
    <script src="js/script.js"></script>
</body>

</html>
