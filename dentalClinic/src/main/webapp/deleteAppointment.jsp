<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Delete Appointment</title>
    <link href="img/favicon.ico" rel="icon">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="css/style.css" rel="stylesheet">
    <style>
        .card { box-shadow: 0 0 20px rgba(0,0,0,0.1); border-radius: 15px; }
    </style>
</head>
<body>

    <div class="container-fluid py-5">
        <div class="container">
            <h1 class="display-5 text-primary mb-5">Delete Appointment</h1>
            <div class="card">
                <div class="card-body">
                    <%
                    int appointmentId = Integer.parseInt(request.getParameter("id"));
                    String patientName = "";
                    String doctorName = "";
                    
                    try {
                        String q = "SELECT * FROM appointments WHERE id = ?";
                        PreparedStatement psmt = conn.prepareStatement(q);
                        psmt.setInt(1, appointmentId);
                        ResultSet rs = psmt.executeQuery();
                        
                        if (rs.next()) {
                            patientName = rs.getString("patient_name");
                            doctorName = rs.getString("doctor");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>

                    <p>Are you sure you want to delete the appointment for <strong><%= patientName %></strong> with Dr. <strong><%= doctorName %></strong>?</p>
                    <form method="post">
                        <button type="submit" class="btn btn-danger">Yes, Delete</button>
                        <a href="viewAppointments.jsp" class="btn btn-secondary">No, Go Back</a>
                    </form>
                    
                    <%
                    // Deleting the appointment after confirmation
                    if (request.getMethod().equalsIgnoreCase("POST")) {
                        try {
                            String deleteQuery = "DELETE FROM appointments WHERE id = ?";
                            PreparedStatement deletePsmt = conn.prepareStatement(deleteQuery);
                            deletePsmt.setInt(1, appointmentId);
                            
                            int rowsDeleted = deletePsmt.executeUpdate();
                            if (rowsDeleted > 0) {
                                out.println("<p class='text-success'>Appointment deleted successfully!</p>");
                                out.println("<a href='viewAppointments.jsp' class='btn btn-primary'>Back to Appointments</a>");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
                        }
                    }
                    %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
