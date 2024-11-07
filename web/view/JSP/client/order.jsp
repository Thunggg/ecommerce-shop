<%-- 
    Document   : order
    Created on : Nov 7, 2024, 2:04:56 AM
    Author     : tins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/view/assets/home/css/index.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="icon" href="/view/assets/home/img/1.png" type="image/x-icon">
        <link rel="icon" href="/view/assets/home/img/1.png" type="image/x-icon">
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
    <style>
        .main-container{
            margin-top: 100px;
        }
        .logo{
            margin-left: 200px;
        }
        .navigation{
            margin-left: -300px;
        }
    </style>
    <body>
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
                    <a href="#"><i class="fa-solid fa-truck-fast"></i></a>
                    <a class="user-icon" href="#"><i class="fa-solid fa-circle-user"></i></a>
                </div>
            </div>
        </div>
        <div class="container main-container">
            <div class="order-section">
                <h1 class="text-center my-4">Thông Tin Đơn Hàng</h1>
                <table class="table table-striped table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Sản Phẩm</th>
                            <th scope="col">Kích Thước</th>
                            <th scope="col">Màu Sắc</th>
                            <th scope="col">Giá</th>
                            <th scope="col">Số Lượng</th>
                            <th scope="col">Trạng thái giao hàng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="c" items="${order}">
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <!-- Uncomment and use this line if image path is available -->

                                        <div>
                                            <h5 class="mb-1">${c.getProductName()}</h5>
                                            <small>ID: ${c.getProductId()}</small>
                                        </div>
                                    </div>
                                </td>
                                <td>${c.getSize()}</td>
                                <td>${c.getColor()}</td>
                                <td>$${fn:substringBefore(c.price * c.getStockQuantity(), '.')}</td>
                                <td>
                                    <span class="form-control" style="width: 80px; text-align: center;">${c.getStockQuantity()}</span>
                                </td>
                                <td>
                                    <div class="btn btn-primary">Đang vận chuyển</div>

                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div>
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
                </div>
                <div style="display: flex; justify-content: center;">
                    <button class="xemthem" id="load-more-top" onclick="loadMore('top')">Xem Thêm</button>
                </div>
            </div>
            <div class="newsletter">
                <h3>STAY UP TO DATE ABOUT OUR LATEST OFFERS</h3>
                <div class="newsletter-input">
                    <input type="email" placeholder="Enter your email address">
                    <button>Subscribe to Newsletter</button>
                </div>
            </div>
        </div>

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
