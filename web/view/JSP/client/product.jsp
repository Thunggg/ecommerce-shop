<%-- 
    Document   : detail
    Created on : Oct 28, 2024, 6:57:53 PM
    Author     : tins
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/view/assets/home/css/product.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="icon" href="/view/assets/home/img/1.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <title>Obsidian Shop | Mua và Bán</title>
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
                        <li><a href="home">Giới Thiệu</a></li>
                        <li><a href="/product">Sản Phẩm</a></li>
                        <li><a href="order">Đã mua</a></li>
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
                            <input type="range" class="price-slider" name="priceSlider" min="0" max="5000" value="0" oninput="updatePriceValue(this.value)">
                            <div>Price: $<span id="priceValue">0</span></div>
                        </div>
                    </div>

                    <!-- Color Filter -->
                    <div class="filter-section">
                        <div class="filter-title">Colors</div>
                        <div class="color-options">
                            <label>
                                <input type="radio" name="color" value="Đen" onclick="updateColorSelection(this)>
                                <span style="color: #000000; cursor: pointer;">Đen</span>
                            </label>
                            <label>
                                <input type="radio" name="color" value="Trắng" onclick="updateColorSelection(this)>
                                <span style="color: #000000; cursor: pointer;">Trắng</span>
                            </label>
                            <label>
                                <input type="radio" name="color" value="Xám" onclick="updateColorSelection(this)>
                                <span style="color: gray; cursor: pointer;">Xám</span>
                            </label>
                            <label>
                                <input type="radio" name="color" value="Xanh dương">
                                <span style="color: blue; cursor: pointer;">Xanh dương</span>
                            </label>
                            <label>
                                <input type="radio" name="color" value="Đỏ" >
                                <span style="color: red; cursor: pointer;">Đỏ</span>
                            </label>
                            <label>
                                <input type="radio" name="color" value="Vàng" >
                                <span style="color: yellow; cursor: pointer;">Vàng</span>
                            </label>
                            <label>
                                <input type="radio" name="color" value="Nâu" >
                                <span style="color: sienna; cursor: pointer;">Nâu</span>
                            </label>
                            <label>
                                <input type="radio" name="color" value="Xanh lá">
                                <span style="color: green; cursor: pointer;">Xanh lá</span>
                            </label>
                            <label>
                                <input type="radio" name="color" value="Xanh đen" >
                                <span style="color: darkblue; cursor: pointer;">Xanh đen</span>
                            </label>

                        </div>
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
                </div>
                <div class="products-grid" id="new-arrivals">
                    <c:forEach var="c" items="${listproduct}" begin="1" end="27" >
                        <div class="product-card">
                            <a href="detail?id=${c.getId()}" class="product-card">
                                <img src="${c.getImages()}" alt="Gradient Graphic T-shirt" class="product-image">
                            </a>
                            <div class="product-info">
                                <h3 class="product-title">${c.getProductName()}</h3>
                                <div class="rating">★★★★☆ 3.5/5</div>
                                <div class="gia">  
                                    <div class="product-price">
                                        <span>$${fn:substringBefore(c.getPrice(), '.')}</span>
                                    </div>
                                    <div class="dis">
                                        <c:if test="${c.getDiscount() > 0}">
                                            <span class="discount">${fn:substringBefore(c.getDiscount() * 100,'.')}%</span>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="product-actions">
                                    <a href="detail?id=${c.getId()}"><button class="btn-buy">Buy</button></a>
                                    <a href="detail?id=${c.getId()}"><button class="btn-add-to-cart">Add to Cart</button></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <!-- More product cards... -->
                </div>

                <section class="products-section">
                    <div id="new-arrivals">
                        <!-- Initial products will be loaded here -->
                    </div>
                    <div class="buttonnn">
                        <button class="xemthem" onclick="loadMore('new', currentPage++)">Xem Thêm</button>
                    </div>
                </section>
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
        <script>
            let currentPage = 1; // Start at page 1

            function loadMore(type) {
                let url = '/product'; // URL to the servlet
                let params = 'type=' + type + '&index=' + currentPage; // Include current page index

                fetch(url, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: params
                })
                        .then(response => response.text())
                        .then(data => {
                            // Check if there is new data to append
                            if (data.trim()) {
                                document.getElementById('new-arrivals').innerHTML += data; // Append new products
                                currentPage++; // Increment the current page for the next request
                            } else {
                                // Optionally, you can handle the case when no more products are available
                                alert('No more products available.'); // Or hide the "Load More" button
                            }
                        })
                        .catch(error => console.error('Error:', error));
            }
            function updatePriceValue(value) {
                // Update the span element with the new price value
                document.getElementById('priceValue').innerText = value;
            }
            function updateColorSelection(selectedRadio) {
                // Màu sắc tương ứng với các màu
                const colorMap = {
                    "Đen": "#000000",
                    "Trắng": "#000000",
                    "Xám": "#808080",
                    "Xanh dương": "#0000FF",
                    "Nâu": "#A52A2A",
                    "Vàng": "#FFFF00",
                    "Đỏ": "#FF0000",
                    "Xanh lá": "#008000",
                    "Xanh đen": "#003366",
                    "Bạc": "#C0C0C0",
                    "Xanh Rêu": "#556B2F",
                    "Xám sói": "#BEBEBE",
                    "Xanh lá điện tử": "#00FF00",
                    "Hồng": "#FFC0CB"
                };

                // Reset tất cả các span
                var spans = document.querySelectorAll('.color-circles span');
                spans.forEach(function (span) {
                    span.style.fontWeight = 'normal'; // Đặt lại font weight
                    span.style.color = colorMap[span.textContent.trim()] || ''; // Đặt lại màu sắc ban đầu
                });

                // Lấy span tương ứng với màu đã chọn
                var selectedSpan = document.getElementById("span-" + selectedRadio.value);
                selectedSpan.style.fontWeight = 'bold'; // In đậm
                selectedSpan.style.color = colorMap[selectedRadio.value]; // Đặt màu sắc
            }
        </script>

    </body>
</html>