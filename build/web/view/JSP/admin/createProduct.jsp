<%-- 
    Document   : createProduct
    Created on : Oct 30, 2024, 11:07:46 AM
    Author     : Nguyen_Tien_Thuan_CE181024
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Create New Product</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <style>
            /* General reset and body styling */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            }

            body {
                background: #f9fafb;
                padding: 40px;
                color: #333;
            }

            /* Container styling */
            .container {
                max-width: 900px;
                margin: 0 auto;
                background: #ffffff;
                border-radius: 8px;
                padding: 30px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

            .breadcrumb {
                display: flex;
                gap: 10px;
                margin-bottom: 20px;
                color: #666;
                font-size: 14px;
            }

            .breadcrumb a {
                color: #666;
                text-decoration: none;
            }

            .product-form {
                display: grid;
                grid-template-columns: 1fr 1.2fr;
                gap: 30px;
            }

            /* Image Section Styling */
            .image-section {
                border: 1px solid #e3e3e3;
                border-radius: 8px;
                padding: 20px;
                background: #fafafa;
                width: 100%;
            }

            .main-image {
                width: 100%;
                height: 250px;
                border: 2px dashed #e3e3e3;
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 20px;
                cursor: pointer;
                transition: border-color 0.3s ease;
            }

            .main-image:hover {
                border-color: #e32636;
            }

            .thumbnail-list {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 10px;
            }

            .thumbnail {
                width: 100%;
                aspect-ratio: 1;
                border: 2px dashed #e3e3e3;
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: border-color 0.3s ease;
            }

            .thumbnail:hover {
                border-color: #666;
            }

            /* Form Controls */
            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                margin-bottom: 8px;
                font-weight: 600;
                color: #333;
            }

            input[type="text"],
            input[type="number"],
            textarea {
                width: 100%;
                padding: 12px;
                border: 1px solid #ddd;
                border-radius: 6px;
                font-size: 15px;
                transition: border-color 0.3s;
            }

            input[type="text"]:focus,
            input[type="number"]:focus,
            textarea:focus {
                border-color: #e32636;
            }

            textarea {
                height: 100px;
                resize: vertical;
            }

            .form-select {
                margin-bottom: 20px;
            }

            /* Color Options */
            .color-options {
                display: flex;
                gap: 10px;
            }

            .color-option {
                width: 30px;
                height: 30px;
                border-radius: 50%;
                cursor: pointer;
                position: relative;
                border: 2px solid transparent;
                transition: border-color 0.3s;
            }

            .color-option.selected {
                border-color: #e32636;
            }

            .color-option.selected::after {
                content: '✓';
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                color: white;
                font-size: 14px;
            }

            /* Size Options Styling */
            .size-options {
                display: flex;
                gap: 10px;
                flex-wrap: wrap;
            }

            .size-option {
                position: relative;
                display: flex;
                align-items: center;
                justify-content: center;
                width: 50px;
                height: 50px;
                border: 2px solid #ddd;
                border-radius: 8px;
                cursor: pointer;
                transition: 0.3s;
            }

            /* Checkbox Styling */
            .size-option input[type="checkbox"] {
                position: absolute;
                opacity: 0;
                cursor: pointer;
            }

            /* Label Text and Hover Styling */
            .size-option span {


                display: flex;
                align-items: center;
                justify-content: center;
                width: 100%;
                height: 100%;
                font-weight: bold;
                color: #666;
                transition: color 0.3s;
            }

            .size-option:hover {
                border-color: #333;
            }

            .size-option input[type="checkbox"]:checked + span {
                color: #fff;
                background-color: #28a745;
                border-color: #28a745;
                border-radius: 8px;
                width: 100%;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            /* Action Buttons */
            .action-buttons {
                display: flex;
                gap: 10px;
                margin-top: 30px;
            }

            .btn {
                padding: 12px 24px;
                border-radius: 6px;
                border: none;
                cursor: pointer;
                font-weight: 500;
                font-size: 15px;
                transition: background 0.3s, color 0.3s;
            }

            .btn-primary {
                background: #e32636;
                color: white;
            }

            .btn-primary:hover {
                background: #cc202f;
            }

            .btn-secondary {
                background: #f5f5f5;
                color: #333;
            }

            .btn-secondary:hover {
                background: #e3e3e3;
            }

            .btn-create {
                margin-right: 20px;
            }
        </style>

    </head>
    <body>
        <div class="container">
            <div class="breadcrumb">
                <a href="#">Products</a> / <span>Create New Product</span>
            </div>

            <form action="/admin/create" method="POST" enctype="multipart/form-data" class="product-form">
                <div class="image-section">

                    <div class="main-image" onclick="handleImageUpload(this)">
                        <input type="file" name="photo" accept="image/*" style="display: none;" onchange="previewMainImage(event)">
                        <img id="mainImagePreview" src="" alt="Preview" style="display: none; width: 100%; height: 100%; object-fit: cover; border-radius: 8px;" />
                    </div>

                </div>

                <div class="details-section">
                    <!-- Product Name -->
                    <div class="form-group">
                        <label for="productName">Product Name</label>
                        <input type="text" name="productName" id="productName" placeholder="Enter product name" required>
                    </div>

                    <!-- Price -->
                    <div class="form-group">
                        <label for="price">Price ($)</label>
                        <input type="number" name="price" id="price" placeholder="Enter price" min="1" step="0.01" required>
                    </div>

                    <!-- Discount -->
                    <div class="form-group">
                        <label for="discount">Discount ($)</label>
                        <input type="number" name="discount" id="discount" placeholder="Enter discount" min="0" step="0.01">
                    </div>

                    <!-- Description -->
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea name="description" id="description" placeholder="Enter product description" required></textarea>
                    </div>

                    <!-- Category -->
                    <div class="form-group">
                        <label for="categoryId">Category</label>
                        <select name="categoryId" id="categoryId" class="form-select" required>
                            <c:forEach items="${listCategory}" var="category">
                                <option value="${category.id}-${category.type_id}">${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- supplier -->
                    <div class="form-group">
                        <label for="supplierId">Supplier</label>
                        <select name="supplierId" id="supplierId" class="form-select" required>
                            <c:forEach items="${listSupplier}" var="supplier">
                                <option value="${supplier.id}">${supplier.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Stock -->
                    <div class="form-group">
                        <label for="stock">Stock </label>
                        <input type="number" name="stock" id="stock" placeholder="Enter stock" min="1" step="1">
                    </div>

                    <!-- Colors -->
                    <div class="form-group">
                        <label for="colors">Colors</label>
                        <input type="text" name="colors" id="colors" placeholder="Enter colors of product (e.g., Red, Blue)" required>
                    </div>

                    <!-- Sizes -->
                    <div class="form-group">
                        <label>Sizes</label>
                        <div class="size-options">
                            <label class="size-option">
                                <input type="checkbox" name="sizes" value="XS">
                                <span>XS</span>
                            </label>
                            <label class="size-option">
                                <input type="checkbox" name="sizes" value="S" checked>
                                <span>S</span>
                            </label>
                            <label class="size-option">
                                <input type="checkbox" name="sizes" value="M">
                                <span>M</span>
                            </label>
                            <label class="size-option">
                                <input type="checkbox" name="sizes" value="L">
                                <span>L</span>
                            </label>
                            <label class="size-option">
                                <input type="checkbox" name="sizes" value="XL">
                                <span>XL</span>
                            </label>
                            <label class="size-option">
                                <input type="checkbox" name="sizes" value="XL">
                                <span>XXL</span>
                            </label>
                        </div>
                    </div>

                    <!-- Stock Quantity -->
                    <div class="form-group">
                        <label for="stock">Stock Quantity</label>
                        <input type="number" name="stock" id="stock" placeholder="Enter stock quantity" min="1" required>
                    </div>

                    <!-- Action Buttons -->
                    <div class="action-buttons">
                        <button type="submit" class="btn btn-success btn-create">Create</button>
                        <a class="btn btn-danger" href="/admin" role="button">Cancel</a>
                    </div>
                </div>
            </form>
        </div>

        <%
            HttpSession Session = request.getSession();
            String successMessage = (String) Session.getAttribute("errorMessage");
            if (successMessage != null) {
        %>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
                // Initialize SweetAlert Toast
                const Toast = Swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 8000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });

                // Trigger the success toast notification
                Toast.fire({
                    icon: "error",
                    title: "<%= successMessage%>"
                }).then(() => {
                    // Remove the session attribute after showing the notification
            <%
                session.removeAttribute("errorMessage");
            %>
                });
        </script>
        <%
            }
        %>

        <script>
            document.querySelectorAll('.color-option').forEach(option => {
                option.addEventListener('click', function () {
                    document.querySelectorAll('.color-option').forEach(opt => opt.classList.remove('selected'));
                    this.classList.add('selected');
                });
            });

            document.querySelectorAll('.size-option').forEach(option => {
                option.addEventListener('click', function () {
                    this.classList.toggle('selected');
                });
            });

            function handleImageUpload(element) {
                // Tìm input file bị ẩn trong div này và kích hoạt một click vào nó
                const fileInput = element.querySelector('input[type="file"]');
                if (fileInput) {
                    fileInput.click(); // Mở hộp thoại chọn tệp
                }
            }

            function handleThumbnailUpload(element) {
                const input = document.createElement('input');
                input.type = 'file';
                input.accept = 'image/*';
                input.onchange = function (e) {
                    const file = e.target.files[0];
                    if (file) {
                        const reader = new FileReader();
                        reader.onload = function (event) {
                            const thumbnailPreview = element.querySelector('.thumbnail-preview');
                            thumbnailPreview.src = event.target.result;
                            thumbnailPreview.style.display = 'block'; // Show the image
                            element.querySelector('.add-icon').style.display = 'none'; // Hide the add icon
                        };
                        reader.readAsDataURL(file);
                    }
                };
                input.click();
            }


            function previewMainImage(event) {
                const mainImagePreview = document.getElementById('mainImagePreview');
                mainImagePreview.src = null;
                const file = event.target.files[0];

                if (file) {
                    const reader = new FileReader();
                    reader.onload = function () {
                        mainImagePreview.src = reader.result;
                        mainImagePreview.style.display = 'block'; // Hiển thị hình ảnh
                    }
                    reader.readAsDataURL(file);
                }
            }
        </script>
        <!-- Bootstrap 5 JavaScript Bundle with Popper -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </body>
</html>

