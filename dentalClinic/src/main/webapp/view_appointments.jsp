h<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>DentCare - View Appointments</title>
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
        .table { margin-bottom: 0; }
        .btn-back { margin-top: 20px; }
        .edit-form { display: none; padding: 20px; background: #f8f9fa; border-radius: 10px; margin-top: 20px; }
        .message { color: green; margin-bottom: 15px; }
        .error { color: red; margin-bottom: 15px; }
        .search-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
        }
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

    <!-- View Appointments Content -->
    <div class="container-fluid py-5">
        <div class="container">
            <h1 class="display-5 text-primary mb-5 wow fadeInUp" data-wow-delay="0.1s">View Appointments</h1>
            <div class="card wow fadeInUp" data-wow-delay="0.2s">
            
                <form method="get" action="viewAppointments.jsp">
                    <input type="text" name="search" placeholder="Search doctor or patient name" required>
                    <button class="search-btn" type="submit">Search</button>
                </form>
                
                <div class="card-body p-4">
                <%
                String search = request.getParameter("search");
                try {
                    String q;
                    if (search != null && !search.isEmpty()) {
                        q = "SELECT * FROM appointments WHERE patient_name LIKE ? OR doctor LIKE ?";
                    } else {
                        q = "SELECT * FROM appointments";
                    }

                    PreparedStatement psmt = conn.prepareStatement(q);

                    if (search != null && !search.isEmpty()) {
                        psmt.setString(1, "%" + search + "%");
                        psmt.setString(2, "%" + search + "%");
                    }

                    ResultSet rs = psmt.executeQuery();
                    boolean foundAppointment = false;

                    out.println("<table class='table'>");
                    out.println("<tr>");
                    out.println("<th>ID</th>");
                    out.println("<th>Patient Name</th>");
                    out.println("<th>Doctor Name</th>");
                    out.println("<th>Appointment Date</th>");
                    out.println("<th>Appointment Time</th>");
                    out.println("<th>Action</th>");
                    out.println("</tr>");

                    while (rs.next()) {
                        foundAppointment = true;

                        int appointmentId = rs.getInt("id");
                        String fullname = rs.getString("patient_name");
                        String doctorname = rs.getString("doctor");
                        String appointmentDate = rs.getString("appointment_date");
                        String appointmentTime = rs.getString("appointment_time");

                        out.println("<tr>");
                        out.println("<td>" + appointmentId + "</td>");
                        out.println("<td>" + fullname + "</td>");
                        out.println("<td>" + doctorname + "</td>");
                        out.println("<td>" + appointmentDate + "</td>");
                        out.println("<td>" + appointmentTime + "</td>");
                        out.println("<td>");
                        out.println("<a href='editAppointment.jsp?id=" + appointmentId + "'><button class='btn btn-warning'>Edit</button></a>");
                        out.println("<a href='deleteAppointment.jsp?id=" + appointmentId + "'><button class='btn btn-danger'>Delete</button></a>");
                        out.println("</td>");
                        out.println("</tr>");
                    }

                    out.println("</table>");

                    if (!foundAppointment) {
                        out.println("<p>No appointments found.</p>");
                    }

                   

                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                }
                %>
     
                <a href="admin.jsp" class="btn btn-primary btn-back wow fadeInUp" data-wow-delay="0.3s">Back to Dashboard</a>
                </div>
            </div>
        </div>
    </div>

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
                    <p class="mb-2"><i class="bi bi-geo-alt text-primary me-2"></i>123 Street, borivali Mumbai</p>
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
