<%-- 
    Document   : home
    Created on : Oct 24, 2024, 1:18:37 PM
    Author     : Nguyen_Tien_Thuan_CE181024
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/view/assets/client/css/index.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Header -->
        <header class="header">
            <div class="container">
                <div class="inner-wrap">
                    <div class="inner-button-menu">
                        <i class="fa-solid fa-bars"></i>
                    </div>
                    <div class="inner-logo">
                        <a href="/">
                            <img src="/view/assets/client/images/Frame.svg"alt="Logo">
                        </a>
                    </div>
                    <nav class="inner-menu">
                        <ul>
                            <li>
                                <a href="/">Trang Chủ</a>
                            </li>
                            <li>
                                <a href="#">Danh Mục</a>
                            </li>
                            <li>
                                <a href="#">Giới thiệu</a>
                            </li>
                            <li>
                                <a href="#">Liên Hệ</a>
                            </li>
                        </ul>
                    </nav>
                    <div class="inner-search">
                        <form action="">
                            <button><i class="fa-solid fa-magnifying-glass"></i></button>
                            <input type="text" placeholder="Nhập từ khóa">
                        </form>
                    </div>
                    <a href="#" class="button button-primary">Tham Gia Cộng Đồng</a> 
                    <div class="inner-button-search">
                        <a href=""><i class="fa-solid fa-magnifying-glass"></i></a>
                    </div>
                </div>
            </div>
        </header>
        <!-- END Header -->

        <!-- Section 1 -->
        <div class="section-1">
            <div class="container">
                <div class="inner-wrap">
                    <div class="inner-bg-head"></div>
                    <div class="inner-content">
                        <img src="/view/assets/client/images/section-1-bg-1.svg" alt="" class="inner-bg-1">
                        <h1 class="inner-title">
                            Thêm Một Bạn
                        </h1>
                        <h2 class="inner-sub-title">
                            Thêm Ngàn Niềm Vui
                        </h2>
                        <p class="inner-desc">
                            Có một con thú cưng đồng nghĩa với việc bạn có thêm niềm vui mới. Chúng tôi có hơn 200 con thú cưng khác nhau có thể đáp ứng nhu cầu của bạn!
                        </p>
                        <div class="inner-buttons">
                            <a href="#" class="button">Giới Thiệu <i class="fa-regular fa-circle-play"></i></a>
                            <a href="#" class="button button-primary">Khám Phá Ngay</a>
                        </div>
                        <img src="/view/assets/client/images/section-1-bg-2.svg" alt="" class="inner-bg-2">
                    </div>
                    <div class="inner-image">
                        <img class="inner-thumb" src="/view/assets/client/images/image-1.png" alt="">
                        <img src="/view/assets/client/images/section-1-bg-3.svg" alt="" class="inner-bg-3">
                    </div>
                </div>
            </div>
        </div>
        <!-- END Section 1 -->

        <!-- Section 2 -->
        <div class="section-2">
            <div class="container">
                <div class="box-head">
                    <div class="inner-left">
                        <div class="inner-sub-title">Có gì mới?</div>
                        <h2 class="inner-title">một số vật nuôi của chúng tôi</h2>
                    </div>
                    <div class="inner-right">
                        <a href="" class="button">Xem thêm <i class="fa-solid fa-chevron-right"></i></a>
                    </div>
                </div>

                <div class="inner-wrap">
                    <c:forEach begin="1" end="8" var="product" items="${ListP}">
                        <div class="inner-item">
                            <div class="inner-image">
                                <a href="#">
                                    <img src="/view/assets/client/images/pet-1.jpg" alt="#">
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


                    <!--                    <div class="inner-item">
                                            <div class="inner-image">
                                                <a href="#">
                                                    <img src="../../assets/client/images/pet-2.jpg" alt="#">
                                                </a>
                                            </div>
                                            <div class="inner-content">
                                                <h3 class="inner-title">
                                                    <a href="#">MO502 - Poodle Tiny Vàng</a>
                                                </h3>
                                                <div class="inner-info">
                                                    <div class="inner-info-item">
                                                        Giống: <span>Cái</span>
                                                    </div>
                                                    <div class="inner-info-item">
                                                        Tuổi: <span>02 tháng</span>
                                                    </div>
                                                </div>
                                                <div class="inner-price">
                                                    3.900.000 VND
                                                </div>
                                            </div>
                                        </div>
                    
                                        <div class="inner-item">
                                            <div class="inner-image">
                                                <a href="#">
                                                    <img src="../../assets/client/images/pet-1.jpg" alt="#">
                                                </a>
                                            </div>
                                            <div class="inner-content">
                                                <h3 class="inner-title">
                                                    <a href="#">MO502 - Poodle Tiny Vàng</a>
                                                </h3>
                                                <div class="inner-info">
                                                    <div class="inner-info-item">
                                                        Giống: <span>Cái</span>
                                                    </div>
                                                    <div class="inner-info-item">
                                                        Tuổi: <span>02 tháng</span>
                                                    </div>
                                                </div>
                                                <div class="inner-price">
                                                    3.900.000 VND
                                                </div>
                                            </div>
                                        </div>
                    
                                        <div class="inner-item">
                                            <div class="inner-image">
                                                <a href="#">
                                                    <img src="../../assets/client/images/pet-1.jpg" alt="#">
                                                </a>
                                            </div>
                                            <div class="inner-content">
                                                <h3 class="inner-title">
                                                    <a href="#">MO502 - Poodle Tiny Vàng</a>
                                                </h3>
                                                <div class="inner-info">
                                                    <div class="inner-info-item">
                                                        Giống: <span>Cái</span>
                                                    </div>
                                                    <div class="inner-info-item">
                                                        Tuổi: <span>02 tháng</span>
                                                    </div>
                                                </div>
                                                <div class="inner-price">
                                                    3.900.000 VND
                                                </div>
                                            </div>
                                        </div>
                    
                                        <div class="inner-item">
                                            <div class="inner-image">
                                                <a href="#">
                                                    <img src="../../assets/client/images/pet-1.jpg" alt="#">
                                                </a>
                                            </div>
                                            <div class="inner-content">
                                                <h3 class="inner-title">
                                                    <a href="#">MO502 - Poodle Tiny Vàng</a>
                                                </h3>
                                                <div class="inner-info">
                                                    <div class="inner-info-item">
                                                        Giống: <span>Cái</span>
                                                    </div>
                                                    <div class="inner-info-item">
                                                        Tuổi: <span>02 tháng</span>
                                                    </div>
                                                </div>
                                                <div class="inner-price">
                                                    3.900.000 VND
                                                </div>
                                            </div>
                                        </div>
                    
                                        <div class="inner-item">
                                            <div class="inner-image">
                                                <a href="#">
                                                    <img src="../../assets/client/images/pet-1.jpg" alt="#">
                                                </a>
                                            </div>
                                            <div class="inner-content">
                                                <h3 class="inner-title">
                                                    <a href="#">MO502 - Poodle Tiny Vàng</a>
                                                </h3>
                                                <div class="inner-info">
                                                    <div class="inner-info-item">
                                                        Giống: <span>Cái</span>
                                                    </div>
                                                    <div class="inner-info-item">
                                                        Tuổi: <span>02 tháng</span>
                                                    </div>
                                                </div>
                                                <div class="inner-price">
                                                    3.900.000 VND
                                                </div>
                                            </div>
                                        </div>
                    
                                        <div class="inner-item">
                                            <div class="inner-image">
                                                <a href="#">
                                                    <img src="../../assets/client/images/pet-1.jpg" alt="#">
                                                </a>
                                            </div>
                                            <div class="inner-content">
                                                <h3 class="inner-title">
                                                    <a href="#">MO502 - Poodle Tiny Vàng</a>
                                                </h3>
                                                <div class="inner-info">
                                                    <div class="inner-info-item">
                                                        Giống: <span>Cái</span>
                                                    </div>
                                                    <div class="inner-info-item">
                                                        Tuổi: <span>02 tháng</span>
                                                    </div>
                                                </div>
                                                <div class="inner-price">
                                                    3.900.000 VND
                                                </div>
                                            </div>
                                        </div>
                    
                                        <div class="inner-item">
                                            <div class="inner-image">
                                                <a href="#">
                                                    <img src="../../assets/client/images/pet-1.jpg" alt="#">
                                                </a>
                                            </div>
                                            <div class="inner-content">
                                                <h3 class="inner-title">
                                                    <a href="#">MO502 - Poodle Tiny Vàng</a>
                                                </h3>
                                                <div class="inner-info">
                                                    <div class="inner-info-item">
                                                        Giống: <span>Cái</span>
                                                    </div>
                                                    <div class="inner-info-item">
                                                        Tuổi: <span>02 tháng</span>
                                                    </div>
                                                </div>
                                                <div class="inner-price">
                                                    3.900.000 VND
                                                </div>
                                            </div>-->
                </div>
            </div>
            <div class="inner-button-bottom">
                <a href="" class="button">Xem Thêm <i class="fa-solid fa-chevron-right"></i></a>
            </div>
        </div>
    </div>
    <!-- END Section 2 -->

    <!-- Section 3 -->
    <div class="section-3">
        <div class="container">
            <div class="inner-wrap">
                <div class="inner-imange">
                    <img src="/view/assets/client/images/image-2.png" alt="">
                </div>
                <div class="inner-content">
                    <h2 class="title">Thêm Một Bạn</h2>
                    <h3 class="inner-sub-title">Thêm Ngàn Niềm VUi</h3>
                    <p class="inner-desc">Có một con thú cưng đồng nghĩa với việc bạn có thêm niềm vui mới. Chúng tôi có hơn 200 con thú cưng khác nhau có thể đáp ứng nhu cầu của bạn!</p>
                    <div class="inner-button">
                        <a href="#" class="button">Giới Thiệu <i class="fa-regular fa-circle-play"></i></a>
                        <a href="#" class="button button-primary">Khám Phá Ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END Section 3 -->

    <!-- Section 4 -->
    <div class="section-4">
        <div class="container">
            <div class="box-head">
                <div class="inner-left">
                    <div class="inner-sub-title">Có thể bạn đã biết?</div>
                    <h2 class="inner-title">Kiến thức thú cưng hữu ích</h2>
                </div>
                <div class="inner-right">
                    <a href="" class="button">Xem thêm <i class="fa-solid fa-chevron-right"></i></a>
                </div>
            </div>

            <div class="inner-wrap">
                <div class="inner-item">
                    <div class="inner-image">
                        <a href="#">
                            <img src="/view/assets/client/images/section-4.jpg" alt="">
                        </a>
                    </div>

                    <div class="inner-content">
                        <div class="inner-tag">Kiến thức thú cưng</div>
                        <h3 class="inner-title">
                            <a href="#">Pomeranian là gì? Cách nhận biết chó Pomeranian</a>
                        </h3>
                        <div class="inner-desc">
                            Pomeranian hay còn gọi là chó Pomeranian (chó Pom) luôn nằm trong top những thú cưng dễ thương nhất. Không chỉ vậy, giống chó xiếc nhỏ nhắn, đáng yêu, thông minh, thân thiện và khéo léo.
                        </div>
                    </div>
                </div>

                <div class="inner-item">
                    <div class="inner-image">
                        <a href="#">
                            <img src="/view/assets/client/images/section-4.jpg" alt="">
                        </a>
                    </div>

                    <div class="inner-content">
                        <div class="inner-tag">Kiến thức thú cưng</div>
                        <h3 class="inner-title">
                            <a href="#">Pomeranian là gì? Cách nhận biết chó Pomeranian</a>
                        </h3>
                        <div class="inner-desc">
                            Pomeranian hay còn gọi là chó Pomeranian (chó Pom) luôn nằm trong top những thú cưng dễ thương nhất. Không chỉ vậy, giống chó xiếc nhỏ nhắn, đáng yêu, thông minh, thân thiện và khéo léo.
                        </div>
                    </div>
                </div>

                <div class="inner-item">
                    <div class="inner-image">
                        <a href="#">
                            <img src="/view/assets/client/images/section-4.jpg" alt="">
                        </a>
                    </div>

                    <div class="inner-content">
                        <div class="inner-tag">Kiến thức thú cưng</div>
                        <h3 class="inner-title">
                            <a href="#">Pomeranian là gì? Cách nhận biết chó Pomeranian</a>
                        </h3>
                        <div class="inner-desc">
                            Pomeranian hay còn gọi là chó Pomeranian (chó Pom) luôn nằm trong top những thú cưng dễ thương nhất. Không chỉ vậy, giống chó xiếc nhỏ nhắn, đáng yêu, thông minh, thân thiện và khéo léo.
                        </div>
                    </div>
                </div>
            </div>
            <div class="inner-button-bottom">
                <a href="" class="button">Xem Thêm <i class="fa-solid fa-chevron-right"></i></a>
            </div>
        </div>
    </div>
    <!-- END Section 4 -->

    <!-- Footer -->
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
                        <img src="/view/assets/client/images/Frame.svg" alt="">
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
    <!-- End Footer -->

</body>
</html>
