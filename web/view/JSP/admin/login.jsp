<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/bootstrap.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <!-- Thêm FontAwesome -->
        <!-- Thêm SweetAlert CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.min.css">
    </head>
    <body>

        <style>
            body {
                background-color: #f4f7fa;
                font-family: 'Arial', sans-serif;
            }

            .myForm {
                max-width: 600px;
                margin: 50px auto;
                padding: 30px;
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .login {
                text-align: center;
                font-size: 36px;
                color: #333;
                margin-bottom: 30px;
            }

            .form-group label {
                font-weight: bold;
                color: #555;
            }

            .form-control {
                border-radius: 5px;
                padding: 12px;
                font-size: 16px;
                margin-bottom: 20px;
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                padding: 10px 20px;
                font-size: 14px;
                border-radius: 5px;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }

            .btn-block {
                width: 100%;
            }

            .input-group-addon {
                cursor: pointer;
            }
            
            .swal2-popup {
                font-size: 18px !important;  /* Tăng kích thước chữ trong SweetAlert */
                width: 500px !important;     /* Tăng chiều rộng của hộp thoại */
                padding: 30px !important;    /* Tăng padding bên trong hộp thoại */
            }

            .swal2-title {
                font-size: 30px !important;  /* Tăng kích thước tiêu đề */
                font-weight: bold !important;
            }

            .swal2-html-container {
                font-size: 20px !important;  /* Tăng kích thước văn bản thông báo */
            }

            .swal2-confirm {
                font-size: 18px !important;  /* Tăng kích thước nút xác nhận */
                padding: 12px 30px !important;  /* Thay đổi padding của nút */
                background-color: #007bff !important;
                border-color: #007bff !important;
            }

            .swal2-confirm:hover {
                background-color: #0056b3 !important;
                border-color: #0056b3 !important;
            }
            
        </style>

        <div class="container">
            <div class="myForm">
                <h1 class="login">Login</h1>

                <!-- Hiển thị thông báo lỗi bằng SweetAlert -->
                <c:if test="${not empty sessionScope.errorMessage}">
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.all.min.js"></script>
                    <script>
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: '${sessionScope.errorMessage}',
                            confirmButtonText: 'OK'
                        });
                    </script>
                    <c:remove var="errorMessage" /> <!-- Xóa thông báo lỗi sau khi hiển thị -->
                </c:if>

                <form action="/admin/login" method="post" id="loginForm">
                    <div class="form-group">
                        <label for="user">Username</label>
                        <input type="text" class="form-control" name="user" id="user" placeholder="Enter your username">
                    </div>
                    <div class="form-group">
                        <label for="pass">Password</label>
                        <div class="input-group">
                            <input type="password" class="form-control" name="pass" id="pass" placeholder="Enter your password">
                            <span class="input-group-addon" id="togglePassword">
                                <i class="fas fa-eye"></i> <!-- Biểu tượng con mắt -->
                            </span>
                        </div>
                    </div>
                    <button name="btnLogin" id="btnLogin" class="btn btn-primary btn-lg btn-block">Login</button>
                </form>
            </div>
        </div>

        <script src="/view/assets/admin/js/jquery-3.7.1.js"></script>
        <script src="/view/assets/admin/js/jquery.validate.js"></script>
        <script>
            // Validate form input
            $("#loginForm").validate({
                rules: {
                    user: {
                        required: true,
                        minlength: 3
                    },
                    pass: {
                        required: true,
                        minlength: 3
                    }
                },
                messages: {
                    user: {
                        required: "Please enter username",
                        minlength: "Please enter username at least 3 characters"
                    },
                    pass: {
                        required: "Please enter password",
                        minlength: "Please enter password at least 3 characters"
                    }
                },
                errorElement: "div",
                errorClass: "text-danger",
            });

            // JavaScript để chuyển đổi hiển thị mật khẩu
            document.getElementById('togglePassword').addEventListener('click', function () {
                var passwordField = document.getElementById('pass');
                var icon = this.querySelector('i');
                if (passwordField.type === 'password') {
                    passwordField.type = 'text';
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                } else {
                    passwordField.type = 'password';
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                }
            });
        </script>
    </body>
</html>
