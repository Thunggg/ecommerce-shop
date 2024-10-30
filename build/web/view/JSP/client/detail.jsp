
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/view/assets/home/css/detail.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <title>ONE LIFE GRAPHIC T-SHIRT</title>
    </head>
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
                        <li><a href="/home">Giới Thiệu</a></li>
                        <li><a href="/product">Sản Phẩm</a></li>
                        <li><a href="#">Bài Viết</a></li>
                        <li><a href="#">Liên Hệ</a></li>
                    </ul>
                </nav>
                <form class="search-form">
                    <input class="search-input" type="text" placeholder="Tìm kiếm sản phẩm...">
                    <button class="search-button" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
                <div class="icons">
                    <a href="#"><i class="fa-solid fa-truck-fast"></i></a>
                    <a class="user-icon" href="#"><i class="fa-solid fa-circle-user"></i></a>
                </div>
            </div>
        </div>
        <div class="main-container">
            <div class="product-images">
                <div class="thumbnail-container">
                    <img src="/api/placeholder/80/80" alt="Thumbnail 1" class="thumbnail active">
                    <img src="/api/placeholder/80/80" alt="Thumbnail 2" class="thumbnail">
                    <img src="/api/placeholder/80/80" alt="Thumbnail 3" class="thumbnail">
                </div>
                <div class="main-image">
                    <img src="/api/placeholder/500/500" alt="Main product image">
                </div>
            </div>

            <div class="product-info">
                <h1 class="product-title">ONE LIFE GRAPHIC T-SHIRT</h1>
                <div class="price">
                    <span class="current-price">$260</span>
                    <span class="original-price">$300</span>
                    <span class="discount">-40%</span>
                </div>

                <div class="color-options">
                    <h3>Select Color</h3>
                    <div class="color-circles">
                        <div class="color-circle olive active"></div>
                        <div class="color-circle navy"></div>
                        <div class="color-circle black"></div>
                    </div>
                </div>

                <div class="size-options">
                    <h3>Choose Size</h3>
                    <div class="size-buttons">
                        <button class="size-button">Small</button>
                        <button class="size-button">Medium</button>
                        <button class="size-button active">Large</button>
                        <button class="size-button">X-Large</button>
                    </div>
                </div>

                <div class="quantity-selector">
                    <button class="quantity-button">-</button>
                    <span>1</span>
                    <button class="quantity-button">+</button>
                </div>

                <button class="add-to-cart">Add to Cart</button>

                <div class="reviews">
                    <h2>Rating & Reviews</h2>
                    <div class="review">
                        <div class="review-header">
                            <strong>Samantha D.</strong>
                            <span>August 14, 2023</span>
                        </div>
                        <div class="stars">★★★★★</div>
                        <p>This product is great! The design is unique and the fabric feels so comfortable. As a fellow designer I appreciate the attention to detail. It's become my favorite go-to shirt!</p>
                    </div>
                    <div class="review">
                        <div class="review-header">
                            <strong>Alex M.</strong>
                            <span>August 13, 2023</span>
                        </div>
                        <div class="stars">★★★★★</div>
                        <p>Exactly what I was expecting! The cotton was almost just like wool quality is top notch. Being a UX/UI designer myself, I'm quite picky about aesthetics and this didn't let me down.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="container similar-products">
            <h2>YOU MIGHT ALSO LIKE</h2>
            <div class="product-grid">
                <div class="product-card">
                    <img src="/api/placeholder/250/250" alt="Related product 1">
                    <h3>Polo with Contrast Trim</h3>
                    <p>$212</p>
                </div>
                <div class="product-card">
                    <img src="/api/placeholder/250/250" alt="Related product 2">
                    <h3>Gradient Graphic T-shirt</h3>
                    <p>$145</p>
                </div>
                <div class="product-card">
                    <img src="/api/placeholder/250/250" alt="Related product 3">
                    <h3>Polo with Tipping Details</h3>
                    <p>$180</p>
                </div>
                <div class="product-card">
                    <img src="/api/placeholder/250/250" alt="Related product 4">
                    <h3>Black Striped T-shirt</h3>
                    <p>$120</p>
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