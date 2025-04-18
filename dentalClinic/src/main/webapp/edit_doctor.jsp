<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp" %> <!-- Including the external connection file -->

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
    <title>DentCare - Edit Doctor</title>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm px-5 py-3 py-lg-0">
        <a href="index.jsp" class="navbar-brand p-0">
            <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
        </a>
    </nav>

    <!-- Edit Doctor Content -->
    <div class="container-fluid py-5">
        <div class="container">
            <h1 class="display-5 text-primary mb-5">Edit Doctor</h1>

            <%
                // Get doctor ID from the query string
                String doctorId = request.getParameter("id");
                if (doctorId == null) {
                    out.println("<div class='alert alert-danger'>Doctor ID is missing.</div>");
                } else {
                    // Fetch doctor data from the database
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    try {
                        String sql = "SELECT * FROM doctors WHERE id = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setInt(1, Integer.parseInt(doctorId));
                        rs = pstmt.executeQuery();

                        if (rs.next()) {
                            String doctorName = rs.getString("doctor_name");
                            String specialty = rs.getString("specialty");
                            String email = rs.getString("email");
            %>

            <form action="update_doctor.jsp" method="post">
                <input type="hidden" name="id" value="<%= doctorId %>">
                <div class="mb-3">
                    <label for="doctor_name" class="form-label">Doctor Name</label>
                    <input type="text" class="form-control" id="doctor_name" name="doctor_name" value="<%= doctorName %>" required>
                </div>
                <div class="mb-3">
                    <label for="specialty" class="form-label">Specialty</label>
                    <input type="text" class="form-control" id="specialty" name="specialty" value="<%= specialty %>" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
                </div>
                <button type="submit" class="btn btn-primary">Update Doctor</button>
            </form>

            <%
                        } else {
                            out.println("<div class='alert alert-danger'>Doctor not found.</div>");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (pstmt != null) pstmt.close();
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                    }
                }
            %>
        </div>
    </div>

    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
