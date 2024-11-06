<%-- 
    Document   : sidebar
    Created on : Nov 6, 2024, 9:07:44 PM
    Author     : Nguyen_Tien_Thuan_CE181024
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    /* Xóa gạch chân ở liên kết và đảm bảo điều này cho cả trạng thái hover */
    a {
        text-decoration: none;
    }

    a:hover {
        text-decoration: none;
    }

    .nav-item a {
        text-decoration: none;
    }

    .nav-item a:hover, .nav-item a:active {
        text-decoration: none;
    }

     Sidebar tổng thể 
    .sidebar {
        width: 240px;
        background-color: #000;  
        color: #ffffff;
        height: 100vh; 
        overflow-y: auto;  
        display: flex;
        flex-direction: column;
    }

     Logo 
    .logo {
        padding: 20px;
        font-size: 24px;
        border-bottom: 1px solid #3a3f5e;
        text-align: center;
    }

     Mục menu 
    .nav-item {
        display: flex;
        align-items: center;
        padding: 15px 20px;
        color: #a0aec0;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
    }

     Khi hover vào nav-item 
    .nav-item:hover {
        background-color: #3a3f5e;
        color: #ffffff;
    }

     Mục menu đang được chọn 
    .nav-item.active {
        background-color: #e53e3e;
        color: #ffffff;
    }

     Icon trong nav-item 
    .nav-item i {
        margin-right: 12px;
        width: 20px;
        text-align: center;
    }
</style>


<div class="sidebar">
    <div class="logo">Instagram</div>
    <a class="nav-item" href="/admin"><i class="fas fa-home"></i>Dashboard</a>
    <a class="nav-item" href="/admin/user"><i class="fas fa-users"></i>User</a>
    <a class="nav-item"><i class="fas fa-shopping-cart"></i>Dashboard</a>
    <a class="nav-item"><i class="fas fa-plane"></i>Dashboard</a>
    <a class="nav-item"><i class="fas fa-shield"></i>Dashboard</a>
    <a class="nav-item"><i class="fas fa-cog"></i>Dashboard</a>
</div>

<script>
    // Lấy URL hiện tại
    const currentPath = window.location.pathname;

    // Chọn tất cả các thẻ <a> trong sidebar có class .nav-item
    document.querySelectorAll('.sidebar a.nav-item').forEach(item => {
        // Kiểm tra nếu href của item trùng với đường dẫn hiện tại
        if (item.getAttribute('href') === currentPath) {
            item.classList.add('active'); // Thêm lớp 'active' vào item phù hợp
        } else {
            item.classList.remove('active'); // Loại bỏ lớp 'active' khỏi các mục không phù hợp
        }
    });
</script>


