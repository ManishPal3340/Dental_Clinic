<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>DentCare - Admin Dashboard</title>
    <!-- Same CSS imports as original -->
    <link href="img/favicon.ico" rel="icon">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <!-- Custom CSS for cards and animations -->
    <style>
        .admin-card {
            position: relative;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            height: 300px;
            overflow: hidden;
            margin-bottom: 30px;
        }

        .admin-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        }

        .card-content {
            padding: 30px;
            text-align: center;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-decoration: none;
            color: inherit;
        }

        .card-icon {
            font-size: 40px;
            color: #0d6efd;
            margin-bottom: 20px;
            animation: bounce 2s infinite;
        }

        .card-title {
            color: #0d6efd;
            font-size: 24px;
            margin-bottom: 15px;
            font-weight: 600;
        }

        .card-description {
            color: #666;
            font-size: 16px;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-15px);
            }
            60% {
                transform: translateY(-7px);
            }
        }

        .admin-card:hover .card-icon {
            animation: bounce 1s infinite;
        }
    </style>
</head>
<body>
    <!-- Topbar and Navbar same as original -->
    <div class="container-fluid bg-light ps-5 pe-0 d-none d-lg-block">
        <div class="row gx-0">
            <div class="col-md-6 text-center text-lg-start mb-2 mb-lg-0">
                <div class="d-inline-flex align-items-center">
                    <small class="py-2"><i class="far fa-clock text-primary me-2"></i>Opening Hours: Mon - Tues : 6.00 am - 10.00 pm, Sunday Closed </small>
                </div>
            </div>
            <div class="col-md-6 text-center text-lg-end">
                <div class="position-relative d-inline-flex align-items-center bg-primary text-white top-shape px-5">
                    <div class="me-3 pe-3 border-end py-2">
                        <p class="m-0"><i class="fa fa-envelope-open me-2"></i>info@example.com</p>
                    </div>
                    <div class="py-2">
                        <p class="m-0"><i class="fa fa-phone-alt me-2"></i>+012 345 6789</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm px-5 py-3 py-lg-0">
        <a href="index.jsp" class="navbar-brand p-0">
            <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto py-0">
                <a href="login.jsp" class="nav-item nav-link">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Admin Dashboard Start -->
    <div class="container-fluid py-5">
        <div class="container">
            <h1 class="display-5 text-primary mb-5 wow fadeInUp" data-wow-delay="0.1s">Admin Dashboard</h1>
            <div class="row g-5">
                <!-- View Appointments Card -->
                <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                    <a href="view_appointments.jsp" class="admin-card">
                        <div class="card-content">
                            <i class="fas fa-calendar-check card-icon"></i>
                            <h3 class="card-title">View Appointments</h3>
                            <p class="card-description">View and manage all scheduled appointments</p>
                        </div>
                    </a>
                </div>

                <!-- Add Appointment Card -->
                <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <a href="add_appointment.jsp" class="admin-card">
                        <div class="card-content">
                            <i class="fas fa-calendar-plus card-icon"></i>
                            <h3 class="card-title">Add Appointment</h3>
                            <p class="card-description">Schedule new appointments for patients</p>
                        </div>
                    </a>
                </div>

                <!-- View Doctors Card -->
                <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay="0.4s">
                    <a href="view_doctors.jsp" class="admin-card">
                        <div class="card-content">
                            <i class="fas fa-user-md card-icon"></i>
                            <h3 class="card-title">View Doctors</h3>
                            <p class="card-description">Manage doctor information and schedules</p>
                        </div>
                    </a>
                </div>

                <!-- Add Doctor Card -->
                <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <a href="add_doctor.jsp" class="admin-card">
                        <div class="card-content">
                            <i class="fas fa-user-plus card-icon"></i>
                            <h3 class="card-title">Add Doctor</h3>
                            <p class="card-description">Add new doctors to the system</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- Admin Dashboard End -->

    <!-- Footer same as original -->
    <div class="container-fluid bg-dark text-light py-5 wow fadeInUp" data-wow-delay="0.3s">
        <div class="container pt-5">
            <div class="row g-5 pt-4">
                <div class="col-lg-3 col-md-6">
                    <h3 class="text-white mb-4">Quick Links</h3>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                        <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                        <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
                        <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Latest Blog</a>
                        <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 class="text-white mb-4">Popular Links</h3>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                        <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                        <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
                        <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Latest Blog</a>
                        <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 class="text-white mb-4">Get In Touch</h3>
                    <p class="mb-2"><i class="bi bi-geo-alt text-primary me-2"></i>123 Street,borivali Mumbai</p>
                    <p class="mb-2"><i class="bi bi-envelope-open text-primary me-2"></i>info@example.com</p>
                    <p class="mb-0"><i class="bi bi-telephone text-primary me-2"></i>+012 345 67890</p>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 class="text-white mb-4">Follow Us</h3>
                    <div class="d-flex">
                        <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                        <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                        <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                        <a class="btn btn-lg btn-primary btn-lg-square rounded" href="#"><i class="fab fa-instagram fw-normal"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>