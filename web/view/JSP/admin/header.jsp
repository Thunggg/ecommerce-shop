<%-- 
    Document   : header
    Created on : Nov 6, 2024, 9:14:03 PM
    Author     : Nguyen_Tien_Thuan_CE181024
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
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
        color: inherit;
        text-decoration: none;
    }


</style>

<div class="header">
    <h1>Product List</h1>
    <div style="display: flex; gap: 16px;">
        <div class="search-box">
            <i class="fas fa-search"></i>
            <input type="text" placeholder="Search...">
        </div>
        <a class="btn btn-primary add-new" href="/admin/create" role="button">New Product</a>
    </div>
</div>
