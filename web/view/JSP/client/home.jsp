<%-- 
    Document   : home
    Created on : Oct 24, 2024, 1:18:37 PM
    Author     : Nguyen_Tien_Thuan_CE181024
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/view/assets/home/css/index.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="icon" href="/view/assets/home/img/1.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <title>Obsidian Shop | Mua và Bán</title>

    </head>
    <script>
        function loadMore(type) {
            let url = 'home'; // Đường dẫn đến servlet xử lý yêu cầu
            let params = 'type=' + type;

            fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: params
            })
                    .then(response => response.text())
                    .then(data => {
                        if (type === 'new') {
                            document.getElementById('new-arrivals').innerHTML += data;
                        } else {
                            document.getElementById('top-selling').innerHTML += data;
                        }
                    })
                    .catch(error => console.error('Error:', error));
        }
    </script>

    <body>
        <!-- Header -->
        <div class="top-bar">
            <div class="container">
                <div class="promo-text"><span>Đăng Ký để được giảm giá 20%.</span><a class="register-now" href="#">Đăng Ký
                        Ngay</a></div>
                <div class="close-icon"><i class="fa-solid fa-xmark"></i></div>
            </div>
        </div>
        <div class="header">
            <div class="container header-content">
                <div class="logo"><a href="/home"><img src="/view/assets/home/img/logo/Untitled_Project1123-removebg.png"></a></div>
                <nav class="navigation">
                    <ul class="nav-list">
                        <li><a href="home">Giới Thiệu</a></li>
                        <li><a href="product">Sản Phẩm</a></li>
                        <li><a href="order">Đã mua</a></li>
                        <li><a href="#">Liên Hệ</a></li>
                    </ul>
                </nav>
                <div class="icons">
                    <a href="order"><i class="fa-solid fa-truck-fast"></i></a>
                    <!-- Kiểm tra session và hiển thị tương ứng -->
                    <c:choose>
                        <c:when test="${not empty cookie.email}">
                            <!-- Nếu email trong session tồn tại, hiển thị Sign out -->
                            <a style="text-decoration: none;" href="signout">Sign out</a>
                        </c:when>
                        <c:otherwise>
                            <!-- Nếu chưa đăng nhập, hiển thị icon đăng nhập -->
                            <a class="user-icon" href="login"><i class="fa-solid fa-circle-user"></i></a>
                            </c:otherwise>
                        </c:choose>
                </div>
            </div>
        </div>
        <div class="main-banner">
            <div class="container banner-content">
                <div class="banner-text">
                    <h1>CHUYÊN THỜI TRANG PHONG CÁCH, HIỆN ĐẠI</h1>
                    <p>Chúng tôi chuyên cung cấp nhiều loại quần áo được chế tác tỉ mỉ, được thiết kế để làm nổi bật cá tính
                        của bạn và đáp ứng phong cách của bạn.</p>
                    <a class="view-now" href="product">Xem Ngay</a>
                    <div class="stats">
                        <div class="stat-item">
                            <div class="stat-number">200+</div>
                            <div class="stat-label">Thương Hiệu</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">2,000+</div>
                            <div class="stat-label">Sản Phẩm Chất Lượng</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">30,000+</div>
                            <div class="stat-label">Khách Hàng</div>
                        </div>
                    </div>
                </div>
                <div class="banner-image">
                    <img class="main-image" src="/view/assets/home/img/banner/Rectangle 2.jpg" alt="Main Image">
                </div>
            </div>
        </div>
        <!-- END Header -->
        <nav class="brand-nav">
            <a href="#">VERSACE</a>
            <a href="#">ZARA</a>
            <a href="#">GUCCI</a>
            <a href="#">PRADA</a>
            <a href="#">Calvin Klein</a>
        </nav>

        <div class="container">
            <!-- New Arrivals Section -->
            <!-- New Arrivals Section -->
            <h2 class="Happy">New Arrivals</h2>
            <div class="product-grid" id="new-arrivals">
                <c:forEach begin="1" end="20" var="product" items="${ListP}">
                    <div class="product-card">
                        <a href="detail?id=${product.getId()}"><img src="${product.getImages()}" alt="T-shirt with Type Design"></a>
                        <a href="detail?id=${product.getId()}" class="product-title">${product.productName}</a>
                        <p class="price">$${fn:substringBefore(product.getPrice(), '.')}</p>
                    </div>
                </c:forEach>
            </div>
            <div style="display: flex; justify-content: center;">
                <button class="xemthem"id="load-more-new" onclick="loadMore('new')">Xem Thêm</button>
            </div>

            <!-- Top Selling Section -->
            <h2 class="Happy-sel">Top Selling</h2>
            <div class="product-grid" id="top-selling">
                <c:forEach begin="1" end="8" var="product" items="${ListSell}">
                    <div class="product-card">
                        <a href="detail?id=${product.getId()}"><img src="${product.getImages()}" alt="Vertical Striped Shirt"></a>
                        <a href="detail?id=${product.getId()}" class="product-title">${product.getProductName()}</a>
                        <div class="giaca">                        
                            <div class="product-price">
                                <span>$${fn:substringBefore(product.getPrice(), '.')}</span>
                            </div>
                            <div class="dis">
                                <span class="discount">${fn:substringBefore(product.getDiscount() * 100,'.')}%</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div style="display: flex; justify-content: center;">
                <button class="xemthem" id="load-more-top" onclick="loadMore('top')">Xem Thêm</button>
            </div>
            <div class="h2">
                <h2>Browse by Dress Style</h2>
                <!-- Browse by Dress Style -->
                <div class="dress-style-grid">
                    <div class="style-card">
                        <img class="img-1"src="/view/assets/home/img/banner/Frame 61.jpg" alt="Casual Style">
                    </div>
                    <div class="style-card">
                        <img class="img-2" src="/view/assets/home/img/Frame 62.jpg" alt="Formal Style">

                    </div>
                    <div class="style-card">
                        <img class="img-3" src="/view/assets/home/img/Frame 64.jpg" alt="Party Style">

                    </div>
                    <div class="style-card">
                        <img class="img-4" src="/view/assets/home/img/Frame 63.jpg" alt="Gym Style">
                    </div>
                </div>
            </div>

            <!-- Happy Customers Section -->
            <h2 class="Happy">Our Happy Customers</h2>
            <div class="review-grid">
                <div class="review-card">
                    <div class="stars">★★★★★</div>
                    <p>"The product quality is amazing and exactly as described. Will definitely shop here again!"</p>
                </div>
                <div class="review-card">
                    <div class="stars">★★★★★</div>
                    <p>"Shipping was fast and the clothes fit perfectly. Great customer service!"</p>
                </div>
                <div class="review-card">
                    <div class="stars">★★★★★</div>
                    <p>"Fantastic collection and amazing prices. Highly recommended!"</p>
                </div>
            </div>

            <!-- Newsletter Section -->
            <div class="newsletter">
                <h3>STAY UP TO DATE ABOUT OUR LATEST OFFERS</h3>
                <div class="newsletter-input">
                    <input type="email" placeholder="Enter your email address">
                    <button>Subscribe to Newsletter</button>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer>
            <div class="footer-grid">
                <div class="footer-column">
                    <h4>SHOP.CO</h4>
                    <p>We have clothes that suit your style and which you're proud to wear. From women to men.</p>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-github"></i></a>
                    </div>
                </div>
                <div class="footer-column">
                    <h4>COMPANY</h4>
                    <ul>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Features</a></li>
                        <li><a href="#">Works</a></li>
                        <li><a href="#">Career</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h4>HELP</h4>
                    <ul>
                        <li><a href="#">Customer Support</a></li>
                        <li><a href="#">Delivery Details</a></li>
                        <li><a href="#">Terms & Conditions</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h4>FAQ</h4>
                    <ul>
                        <li><a href="#">Account</a></li>
                        <li><a href="#">Manage Deliveries</a></li>
                        <li><a href="#">Orders</a></li>
                        <li><a href="#">Payments</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h4>RESOURCES</h4>
                    <ul>
                        <li><a href="#">Free eBooks</a></li>
                        <li><a href="#">Development Tutorial</a></li>
                        <li><a href="#">How to - Blog</a></li>
                        <li><a href="#">YouTube Playlist</a></li>
                    </ul>
                </div>
            </div>
            <div class="end">
                <p class="footer-note">Shop.co © 2000-2023, All Rights Reserved</p>
                <div class="payment-icons">
                    <i class="fa-brands fa-cc-visa"></i>
                    <i class="fab fa-cc-mastercard"></i>
                    <i class="fab fa-cc-paypal"></i>
                    <i class="fab fa-cc-apple-pay"></i>
                    <i class="fab fa-cc-google-pay"></i>
                </div>
            </div>
        </footer>
    </body>
</html>
