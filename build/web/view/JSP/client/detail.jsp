<%-- 
    Document   : detail
    Created on : Oct 28, 2024, 9:24:13 PM
    Author     : tins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Monitô - Pet Details</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            /* Navigation */
            nav {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 1rem 5%;
                background: white;
                border-bottom: 1px solid #eee;
            }

            .logo {
                font-size: 1.5rem;
                font-weight: bold;
                color: #003366;
            }

            .nav-links {
                display: flex;
                gap: 2rem;
            }

            .nav-links a {
                text-decoration: none;
                color: #333;
            }

            .join-btn {
                background: #003366;
                color: white;
                padding: 0.5rem 1rem;
                border-radius: 5px;
                text-decoration: none;
            }

            /* Breadcrumb */
            .breadcrumb {
                padding: 1rem 5%;
                color: #666;
            }

            .breadcrumb a {
                color: #003366;
                text-decoration: none;
            }

            /* Main Content */
            .content {
                max-width: 1200px;
                margin: 0 auto;
                padding: 2rem 5%;
            }

            /* Product Details Grid */
            .product-details {
                display: grid;
                grid-template-columns: 3fr 2fr;
                gap: 2rem;
                margin-bottom: 3rem;
            }

            /* Image Gallery */
            .gallery {
                position: relative;
            }

            .main-image {
                width: 100%;
                height: 500px;
                object-fit: cover;
                border-radius: 10px;
                margin-bottom: 1rem;
            }

            .thumbnail-container {
                display: flex;
                gap: 1rem;
                overflow-x: auto;
            }

            .thumbnail {
                width: 80px;
                height: 80px;
                object-fit: cover;
                border-radius: 5px;
                cursor: pointer;
            }

            /* Product Info */
            .product-info {
                padding: 1rem;
            }

            .product-title {
                font-size: 2rem;
                margin-bottom: 1rem;
            }

            .price {
                font-size: 1.5rem;
                color: #003366;
                font-weight: bold;
                margin-bottom: 2rem;
            }

            .action-buttons {
                display: flex;
                gap: 1rem;
                margin-bottom: 2rem;
            }

            .btn {
                padding: 0.75rem 1.5rem;
                border-radius: 5px;
                text-decoration: none;
                font-weight: bold;
                text-align: center;
                flex: 1;
            }

            .btn-primary {
                background: #003366;
                color: white;
            }

            .btn-secondary {
                border: 2px solid #003366;
                color: #003366;
            }

            /* Specifications Table */
            .specs-table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 2rem;
            }

            .specs-table tr {
                border-bottom: 1px solid #eee;
            }

            .specs-table td {
                padding: 0.75rem 0;
            }

            .specs-table td:first-child {
                color: #666;
                width: 40%;
            }

            /* Guarantees */
            .guarantees {
                display: flex;
                gap: 2rem;
                margin-bottom: 2rem;
            }

            .guarantee-item {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                color: #666;
            }

            /* Social Share */
            .social-share {
                display: flex;
                align-items: center;
                gap: 1rem;
                color: #666;
            }

            .social-icons {
                display: flex;
                gap: 0.5rem;
            }

            .social-icons a {
                color: #666;
                text-decoration: none;
            }

            /* Customer Reviews Section */
            .customer-section {
                margin-top: 3rem;
            }

            .section-title {
                font-size: 1.5rem;
                margin-bottom: 1.5rem;
            }

            .customer-gallery {
                display: flex;
                gap: 1rem;
                overflow-x: auto;
                padding-bottom: 1rem;
            }

            .customer-image {
                width: 200px;
                height: 200px;
                object-fit: cover;
                border-radius: 10px;
            }

            /* Related Products */
            .related-products {
                margin-top: 3rem;
            }

            .product-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 1.5rem;
            }

            .product-card {
                border: 1px solid #eee;
                border-radius: 10px;
                overflow: hidden;
            }

            .product-card img {
                width: 100%;
                height: 200px;
                object-fit: cover;
            }

            .product-card-info {
                padding: 1rem;
            }

            .product-card-title {
                font-weight: bold;
                margin-bottom: 0.5rem;
            }

            .product-card-price {
                color: #003366;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <nav>
            <div class="logo">Monitô</div>
            <div class="nav-links">
                <a href="#">Home</a>
                <a href="#">Category</a>
                <a href="#">About</a>
                <a href="#">Contact</a>
            </div>
            <a href="#" class="join-btn">Join the community</a>
        </nav>

        <div class="breadcrumb">
            <a href="#">Home</a> > <a href="#">Dog</a> > <a href="#">Large Dog</a> > Shiba Inu Sepia
        </div>

        <div class="content">
            <div class="product-details">
                <div class="gallery">
                    <img src="/api/placeholder/800/500" alt="Shiba Inu" class="main-image">
                    <div class="thumbnail-container">
                        <img src="/api/placeholder/80/80" alt="Thumbnail 1" class="thumbnail">
                        <img src="/api/placeholder/80/80" alt="Thumbnail 2" class="thumbnail">
                        <img src="/api/placeholder/80/80" alt="Thumbnail 3" class="thumbnail">
                        <img src="/api/placeholder/80/80" alt="Thumbnail 4" class="thumbnail">
                    </div>
                </div>

                <div class="product-info">
                    <h1 class="product-title">Shiba Inu Sepia</h1>
                    <div class="price">34,000,000 VND</div>

                    <div class="action-buttons">
                        <a href="#" class="btn btn-primary">Contact us</a>
                        <a href="#" class="btn btn-secondary">Chat with Monitô</a>
                    </div>

                    <table class="specs-table">
                        <tr>
                            <td>SKU</td>
                            <td>#1000078</td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td>Female</td>
                        </tr>
                        <tr>
                            <td>Age</td>
                            <td>2 Months</td>
                        </tr>
                        <tr>
                            <td>Size</td>
                            <td>Small</td>
                        </tr>
                        <tr>
                            <td>Color</td>
                            <td>About 6.5 Tan</td>
                        </tr>
                        <tr>
                            <td>Vaccinated</td>
                            <td>Yes</td>
                        </tr>
                    </table>

                    <div class="guarantees">
                        <div class="guarantee-item">
                            ✓ 100% health guarantee for pets
                        </div>
                        <div class="guarantee-item">
                            ✓ 100% guarantee of pet identification
                        </div>
                    </div>

                    <div class="social-share">
                        Share: 
                        <div class="social-icons">
                            <a href="#">FB</a>
                            <a href="#">TW</a>
                            <a href="#">IG</a>
                            <a href="#">Email</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="customer-section">
                <h2 class="section-title">Our lovely customer</h2>
                <div class="customer-gallery">
                    <img src="/api/placeholder/200/200" alt="Customer 1" class="customer-image">
                    <img src="/api/placeholder/200/200" alt="Customer 2" class="customer-image">
                    <img src="/api/placeholder/200/200" alt="Customer 3" class="customer-image">
                    <img src="/api/placeholder/200/200" alt="Customer 4" class="customer-image">
                    <img src="/api/placeholder/200/200" alt="Customer 5" class="customer-image">
                </div>
            </div>

            <div class="related-products">
                <h2 class="section-title">See More Puppies</h2>
                <div class="product-grid">
                    <div class="product-card">
                        <img src="/api/placeholder/250/200" alt="Pomeranian White">
                        <div class="product-card-info">
                            <div class="product-card-title">MO231 - Pomeranian White</div>
                            <div class="product-card-price">6,900,000 VND</div>
                        </div>
                    </div>
                    <!-- Add more product cards as needed -->
                </div>
            </div>
        </div>
    </body>
</html>