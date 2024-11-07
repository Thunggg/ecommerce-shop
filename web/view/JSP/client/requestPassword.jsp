<%-- 
    Document   : login.jsp
    Created on : 4 Jun, 2024, 4:48:55 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
        <link rel="icon" href="/view/assets/home/img/1.png" type="image/x-icon">
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <style>
            /* Custom styles for #F2F0F1 background and black text */
            body {
                background-color: #F2F0F1;
                color: black;
            }
            .card {
                background-color: white;
                border: none;
            }
            .card-body {
                color: black;
            }
            .form-control {
                color: black;
            }
            .form-floating label {
                color: black;
            }
            .btn-primary {
                background-color: black;
                border-color: black;
            }
            .btn-primary:hover {
                background-color: #333333;
                border-color: #333333;
            }
            .btn-primary {
                padding: 15px;
            }
            /* Overlay style */
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.7); /* Background color with transparency */
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 1050; /* High z-index to cover other content */
                display: none; /* Initially hidden */
            }
            .message-box {
                background-color: white;
                border: 1px solid #dc3545; /* Border color for error messages */
                color: #721c24; /* Dark red text color */
                padding: 20px;
                border-radius: 5px;
                text-align: center;
                width: 300px; /* Width of the message box */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Optional shadow for depth */
            }
        </style>
    </head>
    <body>
        <section class="p-3 p-md-4 p-xl-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6 col-xxl-5">
                        <div class="card shadow-sm rounded-4" style="margin-top: 250px;">
                            <div class="card-body p-3 p-md-4 p-xl-5">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="mb-5">
                                            <h3>Send to Email</h3>
                                        </div>
                                    </div>
                                </div>
                                <form action="requestPassword" method="POST">
                                    <div class="row gy-3 overflow-hidden">
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="email" class="form-control"
                                                       name="email" 
                                                       id="email" placeholder="name@example.com" required>
                                                <label for="email" class="form-label">Email</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="d-grid">
                                                <button class="btn bsb-btn-2xl btn-primary" type="submit">Reset Password</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                
                                <%-- Overlay for displaying messages --%>
                                <div id="overlay" class="overlay">
                                    <div class="message-box" role="alert">
                                        <span id="messageText"></span>
                                        <br>
                                        <button id="closeButton" class="btn btn-primary mt-3">Close</button>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <script>
            // Check if the 'mess' variable has a value and show it in the message box if it does
            var message = '<%= request.getAttribute("mess") != null ? request.getAttribute("mess").toString() : "" %>';
            if (message) {
                var overlay = document.getElementById("overlay");
                var messageText = document.getElementById("messageText");
                messageText.textContent = message; // Set the message text
                overlay.style.display = 'flex'; // Show the overlay
            }

            // Close button functionality
            document.getElementById("closeButton").onclick = function() {
                var overlay = document.getElementById("overlay");
                overlay.style.display = 'none'; // Hide the overlay
            };
        </script>
    </body>
</html>
