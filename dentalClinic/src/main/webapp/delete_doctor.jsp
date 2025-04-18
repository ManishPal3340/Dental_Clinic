<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp" %> <!-- Including the external connection file -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DentCare - Delete Doctor</title>
</head>
<body>
    <%
        String doctorId = request.getParameter("id");
        if (doctorId != null) {
            PreparedStatement pstmt = null;
            try {
                String sql = "DELETE FROM doctors WHERE id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(doctorId));

                int rowsDeleted = pstmt.executeUpdate();
                if (rowsDeleted > 0) {
                    out.println("<div class='alert alert-success'>Doctor deleted successfully!</div>");
                    out.println("<a href='view_doctors.jsp' class='btn btn-primary'>Back to Doctors List</a>");
                } else {
                    out.println("<div class='alert alert-danger'>Failed to delete doctor.</div>");
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
            out.println("<div class='alert alert-danger'>Invalid Doctor ID.</div>");
        }
    %>
</body>
</html>
