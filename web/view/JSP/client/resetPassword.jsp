<%-- 
    Document   : login.jsp
    Created on : 4 Jun, 2024, 4:48:55 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
        <link rel="icon" href="/view/assets/home/img/1.png" type="image/x-icon">
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <style>
            /* Custom styles for #F2F0F1 background and black text */
            body {
                background-color: #F2F0F1;
                color: black;
            }
            .card {
                background-color: white;
                border: none;
            }
            .card-body {
                color: black;
            }
            .form-control {
                color: black;
            }
            .form-floating label {
                color: black;
            }
            .btn-primary {
                background-color: black;
                border-color: black;
            }
            .btn-primary:hover {
                background-color: #333333;
                border-color: #333333;
            }
            .text-danger {
                color: red;
            }
            .btn-primary{
                padding: 15px;
            }
        </style>
    </head>
    <body>
        <section class="p-3 p-md-4 p-xl-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6 col-xxl-5">
                        <div class="card shadow-sm rounded-4" style="margin-top: 170px">
                            <div class="card-body p-3 p-md-4 p-xl-5">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="mb-5">
                                            <h3>Reset Password</h3>
                                        </div>
                                    </div>
                                </div>
                                <form action="resetPassword" method="POST">
                                    <div class="row gy-3 overflow-hidden">
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="email" class="form-control" value="${email}" name="email" id="email" placeholder="name@example.com" required>
                                                <label for="email" class="form-label">Email</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                                                <label for="password" class="form-label">Password</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="password" class="form-control" name="confirm_password" id="confirm_password" placeholder="Confirm Password" required>
                                                <label for="confirm_password" class="form-label">Confirm Password</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="d-grid">
                                                <button class="btn bsb-btn-2xl btn-primary" type="submit">Reset Password</button>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="text-danger">${mess}</p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
