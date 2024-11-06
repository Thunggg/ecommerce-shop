
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
                grid-template-columns: 200px 1fr;
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

            /* Updated style for Add New button */
            .add-new {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 0px 20px;
                background: #3b82f6;
                color: white;
                border: none;
                border-radius: 6px;
                font-weight: 500;
                text-transform: uppercase;
                font-size: 14px;
                cursor: pointer;
                transition: background-color 0.3s ease, transform 0.1s ease;
            }

            .add-new:hover {
                background: #2563eb;
                transform: scale(1.05);
            }

            .add-new a {
                color: inherit; /* Keep text color white within the link */
                text-decoration: none; /* Remove underline */
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

            /*                                    view detail product                             */
            .action {
                position: relative;
            }

            /* Style for action button */
            .menu-btn {
                background: none;
                border: none;
                font-size: 18px;
                color: #333;
                cursor: pointer;
                padding: 8px;
                border-radius: 50%;
                transition: background-color 0.2s ease;
            }

            .menu-btn:focus {
                background-color: rgba(0, 0, 0, 0.1);
                outline: none;
            }

            /* Dropdown styling */
            .dropdown-content {
                top: calc(100% + 5px); /* Adds a 5px gap */
                left: -50%; /* Centers the dropdown */
                transform: translate(-50%, -10px); /* Slide animation starts 10px above */
                opacity: 0;
                max-height: 0;
                overflow: hidden;
                position: absolute;
                background-color: #ffffff;
                min-width: 140px;
                border-radius: 8px;
                box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
                z-index: 1;
                transition: opacity 0.3s ease, max-height 0.3s ease, transform 0.3s ease;
                z-index: 1000; /* Đảm bảo menu nằm trên cùng */
            }

            .dropdown-content.show {
                opacity: 1;
                max-height: 200px;
                transform: translate(-50%, 0); /* End position, dropdown fully visible */
            }


            .dropdown-content a {
                color: #333;
                padding: 10px 15px;
                text-decoration: none;
                display: block;
                font-size: 14px;
                transition: background-color 0.2s ease, color 0.2s ease;
                border-radius: 4px;
            }

            .dropdown-content a:hover {
                background-color: #f0f0f0;
                color: #007bff;
            }

            .product-name{
                width: 250px;
            }


        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
        <jsp:include page="sidebar.jsp"></jsp:include>

            <div class="main-content">
                <div class="header">
                    <h1>User List</h1>
                    <div style="display: flex; gap: 16px;">
                        <div class="search-box">
                            <i class="fas fa-search"></i>
                            <input type="text" placeholder="Search...">
                        </div>
                        <a class="btn btn-primary add-new" href="/admin/createNewAdmin" role="button">New Admin</a>
                    </div>
                </div>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th><input type="checkbox"></th>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Phone</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listUser}" var="user">
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>
                                    <c:set var="imageUrls" value="/${user.avatar}" />
                                    <c:set var="urlArray" value="${fn:split(imageUrls, ' ')}" />
                                    <div class="user-image">
                                        <!-- Hiển thị chỉ hình ảnh đầu tiên -->
                                        <img src="${urlArray[0]}" alt="${user.lastName}" class="img-product" />
                                    </div>
                                </td>
                                <td class="product-name">${user.lastName}</td>
                                <td>${user.email}</td>
                                <td>${user.address}</td>
                                <td>${user.phone}</td>
                                <c:if test="${user.status == 1}">
                                    <td>
                                        <button class="btn btn-success" onclick="handleClickButton(${user.getId()}, ${user.status})">Active</button>
                                    </td>
                                </c:if>
                                <c:if test="${user.status == 0}">
                                    <td>
                                        <button class="btn btn-danger" onclick="handleClickButton(${user.getId()}, ${user.status})">Inctive</button>
                                    </td>
                                </c:if>
                                <td class="action">
                                    <div class="dropdown">
                                        <button onclick="toggleDropdown(this)" class="menu-btn">
                                            <i class="fas fa-ellipsis-v"></i>
                                        </button>
                                        <div class="dropdown-content">
                                            <a href="#" onclick="viewDetails()">View Details</a>
                                            <a href="/admin/editAdmin?id=${user.id}" onclick="editProduct()">Edit Product</a>
                                            <a href="#" class="delete-user" data-user-id="${user.id}" onclick="confirmDelete(event)">Delete Users</a>
                                        </div>
                                    </div>
                                </td>
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
                                <a class="page-link" href="/admin/loadPageAdmin?index=${index - 1}">Previous</a>
                            </li>

                            <!-- Hiển thị trang đầu tiên -->
                            <li class="page-item ${index == 1 ? 'active' : ''}">
                                <a class="page-link" href="/admin/loadPageAdmin?index=1">1</a>
                            </li>

                            <!-- Dấu ... nếu cách xa các trang phía sau -->
                            <c:if test="${index > 3}">
                                <li class="page-item disabled"><span class="page-link">...</span></li>
                                </c:if>

                            <!-- Hiển thị các trang xung quanh trang hiện tại -->
                            <c:forEach begin="${index > 2 ? index - 2 : 2}" end="${index + 2 > endPage ? endPage : index + 2}" var="i">
                                <c:if test="${i > 1 && i < endPage}">
                                    <li class="page-item ${index == i ? 'active' : ''}">
                                        <a class="page-link" href="/admin/loadPageAdmin?index=${i}">${i}</a>
                                    </li>
                                </c:if>
                            </c:forEach>

                            <!-- Dấu ... nếu cách xa các trang phía trước -->
                            <c:if test="${index < endPage - 2}">
                                <li class="page-item disabled"><span class="page-link">...</span></li>
                                </c:if>

                            <!-- Hiển thị trang cuối cùng -->
                            <c:if test="${endPage > 1}">
                                <li class="page-item ${(index == endPage) ? 'active' : ''}">
                                    <a class="page-link" href="/admin/loadPageAdmin?index=${endPage}">${endPage}</a>
                                </li>
                            </c:if>

                            <!-- Nút Next -->
                            <li class="page-item ${index == endPage ? 'disabled' : ''}">
                                <a class="page-link" href="/admin/loadPageAdmin?index=${index + 1}">Next</a>
                            </li>
                        </ul>
                    </nav>

                    <%
                        HttpSession Session = request.getSession();
                        String successMessage = (String) Session.getAttribute("successMessage");
                        if (successMessage != null) {
                    %>
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                    <script>
                                                // Initialize SweetAlert Toast
                                                const Toast = Swal.mixin({
                                                    toast: true,
                                                    position: "top-end",
                                                    showConfirmButton: false,
                                                    timer: 5000,
                                                    timerProgressBar: true,
                                                    didOpen: (toast) => {
                                                        toast.onmouseenter = Swal.stopTimer;
                                                        toast.onmouseleave = Swal.resumeTimer;
                                                    }
                                                });

                                                // Trigger the success toast notification
                                                Toast.fire({
                                                    icon: "success",
                                                    title: "<%= successMessage%>"
                                                }).then(() => {
                                                    // Remove the session attribute after showing the notification
                        <%
                            session.removeAttribute("successMessage");
                        %>
                                                });
                    </script>
                    <%
                        }
                    %>


                </div>
            </div>
        </div>

        <script>
//            // Toggle sidebar items active state
//            document.querySelectorAll('.nav-item').forEach(item => {
//                item.addEventListener('click', function () {
//                    document.querySelectorAll('.nav-item').forEach(i => i.classList.remove('active'));
//                    this.classList.add('active');
//                });
//            });
//
//            // Handle select all checkbox
//            const selectAll = document.querySelector('thead input[type="checkbox"]');
//            const rowCheckboxes = document.querySelectorAll('tbody input[type="checkbox"]');
//
//            selectAll.addEventListener('change', function () {
//                rowCheckboxes.forEach(checkbox => {
//                    checkbox.checked = this.checked;
//                });
//            });
//
//            // Handle pagination
//            document.querySelectorAll('.page-numbers button').forEach(button => {
//                button.addEventListener('click', function () {
//                    if (!this.classList.contains('active') && !this.querySelector('i')) {
//                        document.querySelector('.page-numbers button.active').classList.remove('active');
//                        this.classList.add('active');
//                    }
//                });
//            });


            handleClickButton = (id, curStatus) => {
                const newStatus = 1 - curStatus; // Chuyển đổi trạng thái (0 <-> 1)

                // Gửi yêu cầu AJAX
                $.ajax({
                    url: '/admin/updateUserStatus',
                    type: 'POST',
                    data: {id: id, status: newStatus},
                    success: function (response, status, xhr) {
                        if (xhr.status === 200) {

                            window.location.reload();

                        }
                    },
                    error: function () {
                        const Toast = Swal.mixin({
                            toast: true,
                            position: "top-end",
                            showConfirmButton: false,
                            timer: 1000,
                            timerProgressBar: true,
                            didOpen: (toast) => {
                                toast.onmouseenter = Swal.stopTimer;
                                toast.onmouseleave = Swal.resumeTimer;
                            }
                        });
                        Toast.fire({
                            icon: "error",
                            title: "Update failed"
                        });
                    }
                });
            }


            function toggleDropdown(button) {
                const dropdownContent = button.nextElementSibling;
                dropdownContent.classList.toggle('show');

                // Remove focus from the button to prevent outline
                button.blur();

                // Close dropdown if clicking outside
                document.addEventListener('click', function (event) {
                    if (!button.contains(event.target) && !dropdownContent.contains(event.target)) {
                        dropdownContent.classList.remove('show');
                    }
                });
            }


            function viewDetails() {
                console.log("Viewing product details...");
                // Add your logic for viewing product details here
            }

            function editProduct() {
                console.log("Editing product...");
                // Add your logic for editing the product here
            }

            // In ra thông báo khi cập nhật trạng thái sản phẩm thành công
            // Hàm hiển thị thông báo bằng toast dựa vào dữ liệu trong session
            function showToast(message, type) {
                const Toast = Swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({
                    icon: type,
                    title: message
                });
            }

            // Hiển thị thông báo nếu tồn tại trong session
            document.addEventListener("DOMContentLoaded", function () {
                const message = "<c:out value='${sessionScope.message}'/>";
                const messageType = "<c:out value='${sessionScope.messageType}'/>";
                if (message) {
                    showToast(message, messageType);

                    // Xóa thông báo khỏi session sau khi hiển thị
            <% session.removeAttribute("message"); %>
            <% session.removeAttribute("messageType");%>
                }
            });
            function confirmDelete(event) {
                event.preventDefault(); // Ngăn không cho thẻ <a> thực hiện hành động mặc định

                const usertId = $(event.target).data("user-id"); // Lấy ID sản phẩm từ thuộc tính data

                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: "btn btn-success",
                        cancelButton: "btn btn-danger"
                    },
                    buttonsStyling: false
                });

                swalWithBootstrapButtons.fire({
                    title: "Are you sure?",
                    text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Yes, delete it!",
                    cancelButtonText: "No, cancel!",
                    reverseButtons: false
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Gửi yêu cầu AJAX để xóa sản phẩm
                        $.ajax({
                            url: `/admin/deleteUser`, // Đường dẫn servlet xử lý xóa sản phẩm
                            type: "POST", // Sử dụng POST để xóa
                            data: {id: usertId}, // Gửi ID sản phẩm
                            success: function (response) {
                                swalWithBootstrapButtons.fire({
                                    title: "Deleted!",
                                    text: "Your product has been deleted.",
                                    icon: "success"
                                }).then(() => {
                                    window.location.reload(); // Hoặc chuyển hướng đến danh sách sản phẩm
                                });
                            },
                            error: function (xhr, status, error) {
                                swalWithBootstrapButtons.fire({
                                    title: "Error",
                                    text: "There was an error deleting the product.",
                                    icon: "error"
                                });
                            }
                        });
                    } else if (result.dismiss === Swal.DismissReason.cancel) {
                        swalWithBootstrapButtons.fire({
                            title: "Cancelled",
                            text: "Your product is safe :)",
                            icon: "error"
                        });
                    }
                });
            }

        </script>
        <!-- Bootstrap JavaScript -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </body>
</html>