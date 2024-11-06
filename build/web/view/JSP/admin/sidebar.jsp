<%-- 
    Document   : sidebar
    Created on : Nov 6, 2024, 9:07:44 PM
    Author     : Nguyen_Tien_Thuan_CE181024
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
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
</style>


<div class="sidebar">
    <div class="logo">Instagram</div>
    <div class="nav-item active"><i class="fas fa-home"></i>Dashboard</div>
    <div class="nav-item"><i class="fas fa-users"></i>Dashboard</div>
    <div class="nav-item"><i class="fas fa-shopping-cart"></i>Dashboard</div>
    <div class="nav-item"><i class="fas fa-plane"></i>Dashboard</div>
    <div class="nav-item"><i class="fas fa-shield"></i>Dashboard</div>
    <div class="nav-item"><i class="fas fa-cog"></i>Dashboard</div>
</div>