<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %> <!-- Include the database connection file -->

<!DOCTYPE html>
<html lang="en">
<head>
    <link href="img/favicon.ico" rel="icon">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <meta charset="utf-8">
    <title>DentCare - Add Doctor</title>
   <style>
        .card { box-shadow: 0 0 20px rgba(0,0,0,0.1); border-radius: 15px; }
        .table { margin-bottom: 0; }
        .btn-back { margin-top: 20px; }
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

    <!-- Add Doctor Content -->
    <div class="container-fluid py-5">
        <div class="container">
            <h1 class="display-5 text-primary mb-5 wow fadeInUp" data-wow-delay="0.1s">Add Doctor</h1>
            <div class="card wow fadeInUp" data-wow-delay="0.2s">
                <div class="card-body p-4">
                    <!-- Form to Add Doctor -->
                    <form method="POST" action= add_doctor.jsp>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <input type="text" name="doctorName" class="form-control" placeholder="Doctor Name" required>
                            </div>
                            <div class="col-md-6">
                                <input type="text" name="specialty" class="form-control" placeholder="Specialty" required>
                            </div>
                            <div class="col-md-6">
                                <input type="email" name="email" class="form-control" placeholder="Email" required>
                            </div>
                            <div class="col-md-6">
                                <input type="tel" name="phoneNumber" class="form-control" placeholder="Phone Number" required>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary w-100">Add Doctor</button>
                            </div>
                        </div>
                    </form>

                    <!-- Handle form submission -->
                    <%
                        if ("POST".equalsIgnoreCase(request.getMethod())) {
                            // Get form data
                            String doctorName = request.getParameter("doctorName");
                            String specialty = request.getParameter("specialty");
                            String email = request.getParameter("email");
                            String phoneNumber = request.getParameter("phoneNumber");

                            // Prepare database connection (use the connection from conn.jsp)
                            PreparedStatement ps = null;

                            try {
                                // Create the SQL insert query
                                String sql = "INSERT INTO doctors (doctor_name, specialty, email, phone_number) VALUES (?, ?, ?, ?)";
                                ps = conn.prepareStatement(sql);
                                ps.setString(1, doctorName);
                                ps.setString(2, specialty);
                                ps.setString(3, email);
                                ps.setString(4, phoneNumber);

                                // Execute the query
                                int rowsAffected = ps.executeUpdate();

                                if (rowsAffected > 0) {
                                    out.println("<div class='alert alert-success'>Doctor added successfully!</div>");
                                    // Optionally, you can redirect after successful insertion
                                    response.sendRedirect("view_doctors.jsp");
                                } else {
                                    out.println("<div class='alert alert-danger'>Error: Unable to add doctor.</div>");
                                }
                            } catch (Exception e) {
                                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                            } finally {
                                try {
                                    if (ps != null) ps.close();
                                } catch (SQLException se) {
                                    se.printStackTrace();
                                }
                            }
                        }
                    %>

                    <a href="admin.jsp" class="btn btn-secondary btn-back mt-3 wow fadeInUp" data-wow-delay="0.3s">Back to Dashboard</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer and JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
