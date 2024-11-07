
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
        <link rel="icon" href="/view/assets/home/img/1.png" type="image/x-icon">
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
                        <li><a href="/home">Giới Thiệu</a></li>
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
        <form action="detail" method="post">
            <div class="main-container">
                <!-- Product Image -->
                <div class="product-images">
                    <div class="main-image">
                        <img src="${detail.images}" alt="${detail.productName}">
                    </div>
                </div>
                <!-- Product Info -->
                <div class="product-info">
                    <h1 name="productName" id="productName" class="product-title">${detail.productName}</h1>
                    <div class="rating">
                        <span class="stars">
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i>5/5</i>
                        </span>
                    </div>
                    <div class="price"> 
                        <div> 
                            <span class="current-price">$${fn:substringBefore(detail.price, '.')}</span>
                            <input style="display: none;" name="price" value="${fn:substringBefore(detail.price, '.')}" id="price"></input>
                        </div>
                        <div class="original-price">
                            <span class="e">$${fn:substringBefore(detail.price / (1 - detail.discount), '.')}</span>
                        </div>
                        <div class="dis">
                            <span class="discount">${fn:substringBefore(detail.discount * 100,'.')}%</span>
                        </div>
                    </div>
                    <div class="description">
                        <p>${detail.description}</p>
                    </div>
                    <div class="color-options">
                        <h3 class="color-optionss">Chọn màu</h3>
                        <div class="color-circles">
                            <c:forEach var="color" items="${fn:split(detail.colors, ',')}">
                                <c:choose>
                                    <c:when test="${color.trim() == 'Đen'}">
                                        <label>
                                            <input type="radio" name="color" id="${color.trim()}" value="${color.trim()}" onclick="updateColorSelection(this)">
                                        </label>
                                        <span id="span-${color.trim()}" style="color: #000000;">Đen</span>
                                    </c:when>
                                    <c:when test="${color.trim() == 'Trắng'}">
                                        <label>
                                            <input type="radio" name="color" id="${color.trim()}" value="${color.trim()}" onclick="updateColorSelection(this)">
                                        </label>
                                        <span id="span-${color.trim()}" style="color: #000000;">Trắng</span>
                                    </c:when>
                                    <c:when test="${color.trim() == 'Xám'}">
                                        <label>
                                            <input type="radio" name="color" id="${color.trim()}" value="${color.trim()}" onclick="updateColorSelection(this)">
                                        </label>
                                        <span id="span-${color.trim()}" style="color: #808080;">Xám</span>
                                    </c:when>
                                    <c:when test="${color.trim() == 'Xanh dương'}">
                                        <label>
                                            <input type="radio" name="color" id="${color.trim()}" value="${color.trim()}" onclick="updateColorSelection(this)">
                                        </label>
                                        <span id="span-${color.trim()}" style="color: #0000FF;">Xanh dương</span>
                                    </c:when>
                                    <c:when test="${color.trim() == 'Nâu'}">
                                        <label>
                                            <input type="radio" name="color" id="${color.trim()}" value="${color.trim()}" onclick="updateColorSelection(this)">
                                        </label>
                                        <span id="span-${color.trim()}" style="color: #A52A2A;">Nâu</span>
                                    </c:when>
                                    <c:when test="${color.trim() == 'Vàng'}">
                                        <label>
                                            <input type="radio" name="color" id="${color.trim()}" value="${color.trim()}" onclick="updateColorSelection(this)">
                                        </label>
                                        <span id="span-${color.trim()}" style="color: #FFFF00;">Vàng</span>
                                    </c:when>
                                    <c:when test="${color.trim() == 'Đỏ'}">
                                        <label>
                                            <input type="radio" name="color" id="${color.trim()}" value="${color.trim()}" onclick="updateColorSelection(this)">
                                        </label>
                                        <span id="span-${color.trim()}" style="color: #FF0000;">Đỏ</span>
                                    </c:when>
                                    <c:when test="${color.trim() == 'Xanh lá'}">
                                        <label>
                                            <input type="radio" name="color" id="${color.trim()}" value="${color.trim()}" onclick="updateColorSelection(this)">
                                        </label>
                                        <span id="span-${color.trim()}" style="color: #008000;">Xanh lá</span>
                                    </c:when>
                                    <c:when test="${color.trim() == 'Xanh đen'}">
                                        <label>
                                            <input type="radio" name="color" id="${color.trim()}" value="${color.trim()}" onclick="updateColorSelection(this)">
                                        </label>
                                        <span id="span-${color.trim()}" style="color: #003366;">Xanh đen</span>
                                    </c:when>
                                    <c:when test="${color.trim() == 'Bạc'}">
                                        <label>
                                            <input type="radio" name="color" id="${color.trim()}" value="${color.trim()}" onclick="updateColorSelection(this)">
                                        </label>
                                        <span id="span-${color.trim()}" style="color: #C0C0C0;">Bạc</span>
                                    </c:when>
                                    <c:when test="${color.trim() == 'Xanh Rêu'}">
                                        <label>
                                            <input type="radio" name="color" id="${color.trim()}" value="${color.trim()}" onclick="updateColorSelection(this)">
                                        </label>
                                        <span id="span-${color.trim()}" style="color: #556B2F;">Xanh rêu</span>
                                    </c:when>
                                    <c:when test="${color.trim() == 'Xám sói'}">
                                        <label>
                                            <input type="radio" name="color" id="${color.trim()}" value="${color.trim()}" onclick="updateColorSelection(this)">
                                        </label>
                                        <span id="span-${color.trim()}" style="color: #BEBEBE;">Xám sói</span>
                                    </c:when>
                                    <c:when test="${color.trim() == 'Xanh lá điện tử'}">
                                        <label>
                                            <input type="radio" name="color" id="${color.trim()}" value="${color.trim()}" onclick="updateColorSelection(this)">
                                        </label>
                                        <span id="span-${color.trim()}" style="color: #00FF00;">Xanh lá điện tử</span>
                                    </c:when>
                                    <c:when test="${color.trim() == 'Hồng'}">
                                        <label>
                                            <input type="radio" name="color" id="${color.trim()}" value="${color.trim()}" onclick="updateColorSelection(this)">
                                        </label>
                                        <span id="span-${color.trim()}" style="color: #FFC0CB;">Hồng</span>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="size-buttons">
                        <h3>Chọn kích cỡ</h3>
                        <c:forEach var="size" items="${fn:split(detail.size, ',')}">
                            <input type="radio" class="size-button" name="size" value="${size}" id="size">${size}</input>
                        </c:forEach>
                        <div class="stock-btns">
                            <div> <h3 class="stock-btn left">Số lượng</h3></div>
                            <div> <span class="stock-btn right">${detail.stock}</span></div>
                            <input style="display: none;" name="productName" value="${detail.productName}" id="productName"></input>
                            <input name="productId" value="${detail.id}" id="productId"></input>
                        </div>
                    </div>
                    <div class="add-to-cart-section">
                        <div class="quantity-selector">
                            <div class="quantity-control">
                                <button type="button" class="quantity-btn decrease" onclick="updateQuantity(-1)">-</button>
                                <input type="number" id="quantity" name="quantity" value="1" min="1" max="${detail.stock}" class="quantity-input">
                                <button type="button" class="quantity-btn increase" onclick="updateQuantity(1)">+</button>
                            </div>
                        </div>
                        <div class="quantity-add"><button type="submit" class="add-to-cart">Add to Cart</button></div>
                    </div>
                </div>
        </form>
    </div>
    <div class="container reviews">
        <h2>Rating & Reviews</h2>
        <div class="review">
            <div class="review-left">
                <div class="review-header">
                    <strong>Samantha D.</strong>
                    <span>August 14, 2023</span>
                </div>
                <div class="stars">★★★★★</div>
                <p>This product is great! The design is unique and the fabric feels so comfortable. As a fellow designer I appreciate the attention to detail. It's become my favorite go-to shirt!</p>
            </div>
            <div class="review-right">
                <div class="review-header">
                    <strong>Alex M.</strong>
                    <span>August 13, 2023</span>
                </div>
                <div class="stars">★★★★★</div>
                <p>Exactly what I was expecting! The cotton was almost just like wool quality is top notch. Being a UX/UI designer myself, I'm quite picky about aesthetics and this didn't let me down.</p>
            </div>
        </div>
    </div>
    <div class="container similar-products">
        <h2>YOU MIGHT ALSO LIKE</h2>
        <div class="product-grid">
            <c:forEach var="product" items="${relatedProducts}" begin="1" end="8">
                <div class="product-card">
                    <img src="${product.images}" alt="${product.productName}">
                    <h3>${product.productName}</h3>
                    <p>$${product.price}</p>
                    <a href="detail?id=${product.id}">Xem chi tiết</a>
                </div>
            </c:forEach>
        </div>
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
        document.getElementById("productId").style.display = "none";
        function updateQuantity(change) {
            const quantityInput = document.getElementById('quantity');
            let currentQuantity = parseInt(quantityInput.value);
            const maxQuantity = parseInt(quantityInput.max); // Số lượng tối đa từ thuộc tính max

            // Cập nhật số lượng mới
            currentQuantity += change;

            // Đảm bảo không vượt quá giới hạn
            if (currentQuantity < 1) {
                currentQuantity = 1; // Đặt lại về 1 nếu số lượng nhỏ hơn 1
            } else if (currentQuantity > maxQuantity) {
                currentQuantity = maxQuantity; // Đặt lại về số lượng tối đa nếu vượt quá
            }

            quantityInput.value = currentQuantity; // Cập nhật giá trị input
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