
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            }

            a{
                text-decoration: none;
            }

            body {
                display: grid;
                grid-template-columns: 200px 1fr; /* Sidebar chiếm 240px, main-content chiếm phần còn lại */
                min-height: 100vh;
                background: #f5f5f5;
            }

            .sidebar {
                width: 240px;
                background: #000000;
                color: white;
            }

            .logo {
                padding: 20px;
                font-size: 24px;
                border-bottom: 1px solid #3a3f5e;
            }

            .nav-item {
                display: flex;
                align-items: center;
                padding: 15px 20px;
                color: #a0aec0;
                cursor: pointer;
                transition: all 0.3s;
            }

            .nav-item:hover {
                background: #3a3f5e;
                color: white;
            }

            .nav-item.active {
                background: #e53e3e;
                color: white;
            }

            .nav-item i {
                margin-right: 12px;
                width: 20px;
            }

            .main-content {
                flex: 1;
                padding: 20px;
                background: #f5f5f5;
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 20px;
                background: white;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                margin-bottom: 20px;
            }

            .search-box {
                position: relative;
            }

            .search-box input {
                padding: 8px 12px 8px 35px;
                border: 1px solid #e2e8f0;
                border-radius: 6px;
                width: 250px;
            }

            .search-box i {
                position: absolute;
                left: 10px;
                top: 50%;
                transform: translateY(-50%);
                color: #718096;
            }

            .add-new {
                padding: 8px 16px;
                background: #3b82f6;
                color: white;
                border: none;
                border-radius: 6px;
                cursor: pointer;
            }

            .table-container {
                background: white;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                overflow-x: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 12px 20px;
                text-align: left;
                border-bottom: 1px solid #e2e8f0;
            }

            th {
                background: #f8fafc;
                font-weight: 500;
                color: #64748b;
                text-transform: uppercase;
                font-size: 12px;
            }

            .user-image {
                width: 90px; /* Kích thước cụ thể */
                height: 90px; /* Kích thước cụ thể */
                background: #e2e8f0;
                overflow: hidden; /* Đảm bảo hình ảnh không tràn ra ngoài */
                display: flex; /* Sử dụng flexbox để căn giữa hình ảnh */
                justify-content: center; /* Căn giữa hình ảnh theo chiều ngang */
                align-items: center; /* Căn giữa hình ảnh theo chiều dọc */
            }

            .user-image img {
                width: 100%; /* Chiều rộng 100% của vùng chứa */
                height: auto; /* Chiều cao tự động theo tỷ lệ */
                max-height: 100%; /* Giới hạn chiều cao tối đa để không vượt quá vùng chứa */
                object-fit: cover; /* Đảm bảo hình ảnh bao phủ vùng chứa mà không bị bóp méo */
            }

            .status {
                padding: 4px 8px;
                border-radius: 9999px;
                font-size: 12px;
                font-weight: 600;
                background: #fee2e2;
                color: #dc2626;
            }

            .pagination {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 20px;
                border-top: 1px solid #e2e8f0;
            }

            .page-info {
                color: #64748b;
                font-size: 14px;
            }

            .page-numbers {
                display: flex;
                gap: 8px;
            }

            .page-numbers button {
                padding: 8px 12px;
                border: 1px solid #e2e8f0;
                border-radius: 6px;
                background: white;
                cursor: pointer;
            }

            .page-numbers button.active {
                background: #3b82f6;
                color: white;
                border-color: #3b82f6;
            }

            .fa-ellipsis-v:before, .fa-ellipsis-vertical:before {
                content: "\f142";
                cursor: pointer;
            }

            .table-container td:last-child{
                text-align: center
            }





        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
        <div class="sidebar">
            <div class="logo">Instagram</div>
            <div class="nav-item active"><i class="fas fa-home"></i>Dashboard</div>
            <div class="nav-item"><i class="fas fa-users"></i>Dashboard</div>
            <div class="nav-item"><i class="fas fa-shopping-cart"></i>Dashboard</div>
            <div class="nav-item"><i class="fas fa-plane"></i>Dashboard</div>
            <div class="nav-item"><i class="fas fa-shield"></i>Dashboard</div>
            <div class="nav-item"><i class="fas fa-cog"></i>Dashboard</div>
        </div>

        <div class="main-content">
            <div class="header">
                <h1>Product List</h1>
                <div style="display: flex; gap: 16px;">
                    <div class="search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" placeholder="Search...">
                    </div>
                    <button class="add-new">ADD NEW</button>
                </div>
            </div>

            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>Image</th>
                            <th>Title</th>
                            <th>Price</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listProduct}" var="product">
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>
                                    <c:set var="imageUrls" value="${product.images}" />
                                    <c:set var="urlArray" value="${fn:split(imageUrls, ' ')}" />
                                    <div class="user-image">
                                        <!-- Hiển thị chỉ hình ảnh đầu tiên -->
                                        <img src="${urlArray[0]}" alt="${product.productName}" class="img-product" />
                                    </div>
                                </td>
                                <td>${product.productName}</td>
                                <td>${fn:substringBefore(product.price, '.')} $</td>
                                <td><button class="btn btn-success">Active</button></td>
                                <td><i class="fas fa-ellipsis-v"></i></td>
                            </tr>
                        </c:forEach>



                    </tbody>
                </table>

                <div class="pagination">
                    <div class="page-info">Showing 1 to 10 of 50 entries</div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <!-- Nút Previous -->
                            <li class="page-item ${index == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="admin?index=${index - 1}">Previous</a>
                            </li>

                            <!-- Hiển thị trang đầu tiên -->
                            <li class="page-item ${index == 1 ? 'active' : ''}">
                                <a class="page-link" href="admin?index=1">1</a>
                            </li>

                            <!-- Dấu ... nếu cách xa các trang phía sau -->
                            <c:if test="${index > 3}">
                                <li class="page-item disabled"><span class="page-link">...</span></li>
                                </c:if>

                            <!-- Hiển thị các trang xung quanh trang hiện tại -->
                            <c:forEach begin="${index > 2 ? index - 2 : 2}" end="${index + 2 > endPage ? endPage : index + 2}" var="i">
                                <c:if test="${i > 1 && i < endPage}">
                                    <li class="page-item ${index == i ? 'active' : ''}">
                                        <a class="page-link" href="admin?index=${i}">${i}</a>
                                    </li>
                                </c:if>
                            </c:forEach>

                            <!-- Dấu ... nếu cách xa các trang phía trước -->
                            <c:if test="${index < endPage - 2}">
                                <li class="page-item disabled"><span class="page-link">...</span></li>
                                </c:if>

                            <!-- Hiển thị trang cuối cùng -->
                            <li class="page-item ${index == endPage ? 'active' : ''}">
                                <a class="page-link" href="admin?index=${endPage}">${endPage}</a>
                            </li>

                            <!-- Nút Next -->
                            <li class="page-item ${index == endPage ? 'disabled' : ''}">
                                <a class="page-link" href="admin?index=${index + 1}">Next</a>
                            </li>
                        </ul>
                    </nav>


                    <!--                    <div class="page-numbers">
                                            <button><i class="fas fa-chevron-left"></i></button>
                    <c:forEach begin="1" end="${endPage}" var="i">
                    <button type="button" class="btn btn-primary">
                        <a href="admin?index=${i}">${i}</a>
                    </button>
                    </c:forEach>
                    <button><i class="fas fa-chevron-right"></i></button>
                </div>-->
                </div>
            </div>
        </div>

        <script>
            // Toggle sidebar items active state
            document.querySelectorAll('.nav-item').forEach(item => {
                item.addEventListener('click', function () {
                    document.querySelectorAll('.nav-item').forEach(i => i.classList.remove('active'));
                    this.classList.add('active');
                });
            });

            // Handle select all checkbox
            const selectAll = document.querySelector('thead input[type="checkbox"]');
            const rowCheckboxes = document.querySelectorAll('tbody input[type="checkbox"]');

            selectAll.addEventListener('change', function () {
                rowCheckboxes.forEach(checkbox => {
                    checkbox.checked = this.checked;
                });
            });

            // Handle pagination
            document.querySelectorAll('.page-numbers button').forEach(button => {
                button.addEventListener('click', function () {
                    if (!this.classList.contains('active') && !this.querySelector('i')) {
                        document.querySelector('.page-numbers button.active').classList.remove('active');
                        this.classList.add('active');
                    }
                });
            });

        </script>
        <!-- Bootstrap JavaScript -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    </body>
</html>