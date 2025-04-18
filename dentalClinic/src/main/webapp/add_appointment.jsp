<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>DentCare - Add Appointment</title>
    <link href="img/favicon.ico" rel="icon">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        .card { box-shadow: 0 0 20px rgba(0,0,0,0.1); border-radius: 15px; }
        .btn-back { margin-top: 20px; }
        .message { color: green; margin-bottom: 15px; }
        .error { color: red; margin-bottom: 15px; }
    </style>
</head>
<body>
    <!-- Topbar -->
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

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm px-5 py-3 py-lg-0">
        <a href="index.jsp" class="navbar-brand p-0">
            <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
        </a>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto py-0">
                <a href="admin.jsp" class="nav-item nav-link">Back to Dashboard</a>
            </div>
        </div>
    </nav>

    <!-- Backend Java Logic for Form Handling -->
    <div class="container-fluid py-5">
        <div class="container">
            <h1 class="display-5 text-primary mb-5 wow fadeInUp" data-wow-delay="0.1s">Add Appointment</h1>
            <div class="card wow fadeInUp" data-wow-delay="0.2s">
                <div class="card-body p-4">
                    <!-- Form for Appointment -->
                    <form method="post">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="patientName" placeholder="Patient Name" required>
                            </div>
                            <div class="col-md-6">
                                <select class="form-select" name="doctor" required>
                                    <option value="">Select Doctor</option>
                                    <option value="Dr. Smith">Dr. Smith</option>
                                    <option value="Dr. Johnson">Dr. Johnson</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <input type="date" class="form-control" name="appointmentDate" required>
                            </div>
                            <div class="col-md-6">
                                <input type="time" class="form-control" name="appointmentTime" required>
                            </div>
                            <div class="col-md-12">
                                <select class="form-select" name="service" required>
                                    <option value="">Select Service</option>
                                    <option value="Teeth Whitening">Teeth Whitening</option>
                                    <option value="Dental Implant">Dental Implant</option>
                                </select>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary w-100">Add Appointment</button>
                            </div>
                        </div>
                    </form>

                    <a href="admin.jsp" class="btn btn-secondary btn-back mt-3 wow fadeInUp" data-wow-delay="0.3s">Back to Dashboard</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Backend Java Logic for Database Insertion -->
    <%
        // Check if form is submitted
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String patientName = request.getParameter("patientName");
            String doctor = request.getParameter("doctor");
            String appointmentDate = request.getParameter("appointmentDate");
            String appointmentTime = request.getParameter("appointmentTime");
            String service = request.getParameter("service");

            // Validate input
            if (patientName != null && !patientName.trim().isEmpty() &&
                doctor != null && !doctor.trim().isEmpty() &&
                appointmentDate != null && !appointmentDate.trim().isEmpty() &&
                appointmentTime != null && !appointmentTime.trim().isEmpty() &&
                service != null && !service.trim().isEmpty()) {
                
                // Get database connection
                try {
                    String sql = "INSERT INTO appointments (patient_name, doctor, appointment_date, appointment_time, service) VALUES (?, ?, ?, ?, ?)";
                    PreparedStatement psmt = conn.prepareStatement(sql);
                    psmt.setString(1, patientName);
                    psmt.setString(2, doctor);
                    psmt.setString(3, appointmentDate);
                    psmt.setString(4, appointmentTime);
                    psmt.setString(5, service);

                    // Execute the query
                    int rowsAffected = psmt.executeUpdate();
                    if (rowsAffected > 0) {
                        out.println("<script>");
                        out.println("alert('Successfully Added Appointment!');");
                        out.println("window.location='admin.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<p>Error in adding appointment.</p>");
                    }

                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            } else {
                out.println("<p class='error'>Please fill all fields.</p>");
            }
        }
    %>

    <!-- Footer -->
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
                    <p class="mb-2"><i class="bi bi-geo-alt text-primary me-2"></i>123 Street, borivali Mumbai, </p>
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

    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
