<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp" %> <!-- Including the external connection file -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DentCare - Update Doctor</title>
</head>
<body>
    <%
        // Get the updated data from the form
        String doctorId = request.getParameter("id");
        String doctorName = request.getParameter("doctor_name");
        String specialty = request.getParameter("specialty");
        String email = request.getParameter("email");

        // Validate the data
        if (doctorId != null && doctorName != null && specialty != null && email != null) {
            PreparedStatement pstmt = null;
            try {
                String sql = "UPDATE doctors SET doctor_name = ?, specialty = ?, email = ? WHERE id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, doctorName);
                pstmt.setString(2, specialty);
                pstmt.setString(3, email);
                pstmt.setInt(4, Integer.parseInt(doctorId));

                int rowsUpdated = pstmt.executeUpdate();
                if (rowsUpdated > 0) {
                    out.println("<div class='alert alert-success'>Doctor details updated successfully!</div>");
                    out.println("<a href='view_doctors.jsp' class='btn btn-primary'>Back to Doctors List</a>");
                } else {
                    out.println("<div class='alert alert-danger'>Failed to update doctor details.</div>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        } else {
            out.println("<div class='alert alert-danger'>Invalid input data.</div>");
        }
    %>
</body>
</html>
