<%-- 
    Document   : detail
    Created on : Oct 28, 2024, 6:57:53 PM
    Author     : tins
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/view/assets/home/css/product.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <title>Monitô - Pet Shop</title>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <nav>
                    <div class="logo">Monitô</div>
                    <div class="nav-links">
                        <a href="#">Home</a>
                        <a href="#">Category</a>
                        <a href="#">About</a>
                        <a href="#">Contact</a>
                    </div>
                    <a href="#" class="join-btn">Join the community</a>
                </nav>
            </div>

            <div class="hero">
                <div class="hero-content">
                    <h1>One More Friend</h1>
                    <p>Thousands More Fun!</p>
                    <div class="hero-buttons">
                        <a href="#" class="hero-btn btn-primary">View Intro</a>
                        <a href="#" class="hero-btn btn-secondary">Explore Now</a>
                    </div>
                </div>
            </div>

            <div class="content-wrapper">
                <aside class="filters">
                    <div class="filter-section">
                        <h3>Gender</h3>
                        <div class="filter-options">
                            <label><input type="checkbox"> Male</label>
                            <label><input type="checkbox"> Female</label>
                        </div>
                    </div>

                    <div class="filter-section">
                        <h3>Color</h3>
                        <div class="filter-options">
                            <label><input type="checkbox"> Red</label>
                            <label><input type="checkbox"> Blue</label>
                            <label><input type="checkbox"> Black & White</label>
                            <label><input type="checkbox"> Silver</label>
                            <label><input type="checkbox"> Tan</label>
                        </div>
                    </div>

                    <div class="filter-section">
                        <h3>Breed</h3>
                        <div class="filter-options">
                            <label><input type="checkbox"> Small</label>
                            <label><input type="checkbox"> Medium</label>
                            <label><input type="checkbox"> Large</label>
                        </div>
                    </div>
                </aside>

                <main class="products">
                    <div class="products-header">
                        <h2>Small Dog</h2>
                        <select>
                            <option>Sort by: Popular</option>
                            <option>Price: Low to High</option>
                            <option>Price: High to Low</option>
                        </select>
                    </div>
                    <div class="inner-wrap">
                        <c:forEach begin="1" end="12" var="product" items="${list}">
                            <div class="inner-item">
                                <div class="inner-image">
                                    <a href="#">
                                        <img src="/view/assets/home/img/pet-2.jpg" alt="#">
                                    </a>
                                </div>
                                <div class="inner-content">
                                    <h3 class="inner-title">
                                        <a href="#">${product.productName}</a>
                                    </h3>
                                    <div class="inner-info">
                                        <div class="inner-info-item">
                                            Giống: <span>Đực</span>
                                        </div>
                                        <div class="inner-info-item">
                                            Tuổi: <span>02 tháng</span>
                                        </div>
                                    </div>
                                    <div class="inner-price">
                                        6.900.000 VND
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- Add more product cards as needed -->
                    </div>

                    <div class="pagination">
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">...</a>
                        <a href="#">26</a>
                        <a href="#">→</a>
                    </div>
                </main>
            </div>
        </div>
        <footer class="footer">
            <div class="container">
                <div class="inner-top">
                    <h3 class="inner-title">
                        Đăng ký ngay để không bỏ lỡ các chương trình của chúng tôi
                    </h3>
                    <form action="" class="inner-form">
                        <input type="email" placeholder="Nhập email của bạn...">
                        <button type="submit">Đăng Ký Ngay</button>
                    </form>
                </div>
                <div class="inner-middle">
                    <nav class="inner-menu">
                        <ul>
                            <li>
                                <a href="/">Trang Chủ</a>
                            </li>
                            <li>
                                <a href="#">Danh Mục</a>
                            </li>
                            <li>
                                <a href="#">Giới Thiệu</a>
                            </li>
                            <li>
                                <a href="#">Liên Hệ</a>
                            </li>
                        </ul>
                    </nav>
                    <nav class="inner-socials">
                        <ul>
                            <li>
                                <a href="#" target="_blank">
                                    <i class="fa-brands fa-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" target="_blank">
                                    <i class="fa-brands fa-x-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" target="_blank">
                                    <i class="fa-brands fa-instagram"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" target="_blank">
                                    <i class="fa-brands fa-youtube"></i>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="inner-bottom">
                    <div class="inner-copyright">
                        © 2023 28Tech. All rights reserved.
                    </div>
                    <div class="inner-logo">
                        <a href="/">
                            <img src="/view/assets/home/img/Frame.svg" alt="">
                        </a>
                    </div>
                    <nav class="inner-links">
                        <ul>
                            <li>
                                <a href="#">Điều khoản dịch vụ</a>
                            </li>
                            <li>
                                <a href="#">Chính sách bảo mật</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </footer>
    </body>
</html>
