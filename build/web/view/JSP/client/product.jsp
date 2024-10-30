<%-- 
    Document   : detail
    Created on : Oct 28, 2024, 6:57:53 PM
    Author     : tins
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        <title>SHOP.CO - Casual Collection</title>
    </head>
    <script>
        function updatePriceValue(value) {
            // Update the displayed value
            document.getElementById("priceValue").textContent = value;
            // Set the hidden input's value for form submission
            document.getElementById("priceInput").value = value;
        }
    </script>
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
        <div class="container main-container">
            <aside class="filters">
                <form action="product" method="GET">
                    <h2>Filters</h2>

                    <!-- Category Filter -->
                    <div class="filter-section">
                        <label class="filter-title" for="category-select">Category</label>
                        <select id="category-select" name="category">
                            <option value="-1">All</option>
                            <option value="1">Áo</option>
                            <option value="2">Quần</option>
                            <option value="3">Phụ Kiện</option>
                        </select>
                    </div>

                    <!-- Price Range Filter -->
                    <div class="filter-section">
                        <div class="filter-title">Price Range</div>
                        <div class="price-range">
                            <input type="range" class="price-slider" name="priceSlider" min="50" max="10000" value="200" oninput="updatePriceValue(this.value)">
                            <div>Price: $<span id="priceValue">200</span></div>
                        </div>
                    </div>

                    <!-- Color Filter -->
                    <div class="filter-section">
                        <div class="filter-title">Colors</div>
                        <div class="color-options">
                            <label><input type="radio" name="color" value="Đen" style="display: none;"><span style="display: inline-block; width: 20px; height: 20px; background-color: black; border-radius: 50%; cursor: pointer;"></span></label>
                            <label><input type="radio" name="color" value="Trắng" style="display: none;"><span style="display: inline-block; width: 20px; height: 20px; background-color: white; border-radius: 50%; border: 1px solid #ddd; cursor: pointer;"></span></label>
                            <label><input type="radio" name="color" value="Xám" style="display: none;"><span style="display: inline-block; width: 20px; height: 20px; background-color: gray; border-radius: 50%; cursor: pointer;"></span></label>
                            <label><input type="radio" name="color" value="Xanh dương" style="display: none;"><span style="display: inline-block; width: 20px; height: 20px; background-color: blue; border-radius: 50%; cursor: pointer;"></span></label>
                            <label><input type="radio" name="color" value="Đỏ" style="display: none;"><span style="display: inline-block; width: 20px; height: 20px; background-color: red; border-radius: 50%; cursor: pointer;"></span></label>
                            <label><input type="radio" name="color" value="Vàng" style="display: none;"><span style="display: inline-block; width: 20px; height: 20px; background-color: yellow; border-radius: 50%; cursor: pointer;"></span></label>
                            <label><input type="radio" name="color" value="Nâu" style="display: none;"><span style="display: inline-block; width: 20px; height: 20px; background-color: sienna; border-radius: 50%; cursor: pointer;"></span></label>
                            <label><input type="radio" name="color" value="Xanh lá" style="display: none;"><span style="display: inline-block; width: 20px; height: 20px; background-color: green; border-radius: 50%; cursor: pointer;"></span></label>
                            <label><input type="radio" name="color" value="Xanh đen" style="display: none;"><span style="display: inline-block; width: 20px; height: 20px; background-color: darkblue; border-radius: 50%; cursor: pointer;"></span></label>
                        </div>
                    </div>

                    <!-- Size Filter -->
                    <div class="filter-section">
                        <div class="filter-title">Size</div>
                        <c:forEach var="size" items="${uniqueSizes}">
                            <div class="size-options">
                                <label>
                                    <input type="radio" name="size" value="${size}">${size}
                                </label>
                            </div>
                        </c:forEach>
                    </div>


                    <!-- Apply Filter Button -->
                    <button type="submit" class="apply-filter">Apply Filter</button>
                </form>
            </aside>
            <section class="products-section">
                <div class="products-header">
                    <c:set var="c" value="${listproduct}" />
                    <c:set var="categoryParam" value="${param.category}" />
                    <c:choose>
                        <c:when test="${not empty c}">
                            <c:if test="${not empty categoryParam}">
                                <c:set var="typeId" value="${categoryParam}" />
                                <h1>
                                    <c:choose>
                                        <c:when test="${typeId == '1'}">Áo</c:when>
                                        <c:when test="${typeId == '2'}">Quần</c:when>
                                        <c:when test="${typeId == '3'}">Phụ Kiện</c:when>
                                    </c:choose>
                                </h1>
                            </c:if>
                            <c:if test="${empty categoryParam || categoryParam == '-1'}">
                                <h1>All Products</h1>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <h1>No products available.</h1>
                        </c:otherwise>
                    </c:choose>

                    <div>
                        <span>Showing 1-10 of 100 Products</span>
                        <select class="sort-dropdown">
                            <option>Most Popular</option>
                            <option>Newest</option>
                            <option>Price: Low to High</option>
                            <option>Price: High to Low</option>
                        </select>
                    </div>
                </div>
                <div class="products-grid">
                    <c:forEach var="c" items="${listproduct}" begin="1" end="27">
                        <a href="/view/JSP/client/detail.jsp">
                            <div class="product-card">
                                <img src="${c.getImages()}" alt="Gradient Graphic T-shirt" class="product-image">
                            </div>
                            <div class="product-info">
                                <h3 class="product-title">${c.getProductName()}</h3>
                                <div class="rating">★★★★☆ 3.5/5</div>
                                <div class="product-price">
                                    <span>$${fn:substringBefore(c.getPrice(), '.')}</span>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                    <!-- More product cards... -->
                </div>

                <div class="pagination">
                    <a class="span">← Previous</a>
                    <a class="page-number active">1</a>
                    <a class="page-number">2</a>
                    <a class="page-number">3</a>
                    <a>...</a>
                    <a class="page-number">8</a>
                    <a class="page-number">9</a>
                    <a class="page-number">10</a>
                    <a class="span">Next →</a>
                </div>
            </section>
        </div>
        <div class="container newsletter">
            <h3>STAY UP TO DATE ABOUT OUR LATEST OFFERS</h3>
            <div class="newsletter-input">
                <input type="email" placeholder="Enter your email address">
                <button>Subscribe to Newsletter</button>
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