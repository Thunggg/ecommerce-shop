<%-- 
    Document   : login
    Created on : Nov 5, 2024, 10:17:18 AM
    Author     : tins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/view/assets/home/css/login.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <title>Đăng Nhập</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="icon" href="/view/assets/home/img/1.png" type="image/x-icon">
    </head>

    <body>
        <!-- LOGIN FORM CREATION -->
        <div class="background"></div>
        <div class="container">
            <div class="item">
                <a href="home"><img src="/view/assets/home/img/1.png" alt="" class="img-logo"></a>
                <div class="text-item">
                    <h2>Welcome! <br><span>To Our Clothing Shop</span></h2>
                    <p>Style is a silent statement.</p>
                    <div class="social-icon">
                        <a href="#"><i class='bx bxl-facebook'></i></a>
                        <a href="#"><i class='bx bxl-twitter'></i></a>
                        <a href="#"><i class='bx bxl-youtube'></i></a>
                        <a href="#"><i class='bx bxl-instagram'></i></a>
                        <a href="#"><i class='bx bxl-linkedin'></i></a>
                    </div>
                </div>
            </div>
            <div class="login-section">
                <div class="form-box login">
                    <form action="login" method="post">
                        <h2>Sign In</h2>
                        <div class="input-box">
                            <span class="icon"><i class='bx bxs-envelope'></i></span>
                            <input type="email" name="email" id="email" required autocomplete="off">
                            <label>Email</label>
                        </div>
                        <div class="input-box">
                            <span class="icon"><i class='bx bxs-lock-alt'></i></span>
                            <input type="password" name="password"  id="password" required autocomplete="off">
                            <label>Password</label>
                        </div>
                        <div class="remember-password">
                            <label for=""><input type="checkbox">Remember Me</label>
                            <a href="requestPassword">Forget Password</a>
                        </div>
                        <button class="btn">Login In</button>
                        <div class="create-account">
                            <a  href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/login&response_type=code&client_id=575970476797-2vn7tasun3u5nlcq0q957m7g45epfsam.apps.googleusercontent.com&approval_prompt=force" class="btn btn-lg">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                                <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                                </svg>
                                <span class="ms-2 fs-6">Sign in with Google</span>
                            </a>
                        </div>
                    </form>
                </div>
                <div class="form-box register">
                    <form action="">
                        <h2>Sign Up</h2>
                        <div class="input-box">
                            <span class="icon"><i class='bx bxs-user'></i></span>
                            <input type="text" required>
                            <label>Username</label>
                        </div>
                        <div class="input-box">
                            <span class="icon"><i class='bx bxs-envelope'></i></span>
                            <input type="email" required>
                            <label>Email</label>
                        </div>
                        <div class="input-box">
                            <span class="icon"><i class='bx bxs-lock-alt'></i></span>
                            <input type="password" required>
                            <label>Password</label>
                        </div>
                        <div class="remember-password">
                            <label for=""><input type="checkbox">I agree with this statment</label>
                        </div>
                        <button class="btn">Login In</button>
                        <div class="create-account">
                            <p>Already Have An Account? <a href="#" class="login-link">Sign In</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("email").value = "";
                document.getElementById("password").value = "";
            });
        </script>


    </body>
</html>