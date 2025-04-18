<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="conn.jsp" %>

<%
    String appointmentId = request.getParameter("id");
    String patientName = request.getParameter("patientName");
    String doctorName = request.getParameter("doctorName");
    String appointmentDate = request.getParameter("appointmentDate");
    String appointmentTime = request.getParameter("appointmentTime");

    if (appointmentId != null && patientName != null && doctorName != null && appointmentDate != null && appointmentTime != null) {
        try {
            // Prepare update query
            String updateQuery = "UPDATE appointments SET patient_name = ?, doctor_name = ?, appointment_date = ?, appointment_time = ? WHERE id = ?";
            PreparedStatement psmt = conn.prepareStatement(updateQuery);
            psmt.setString(1, patientName);
            psmt.setString(2, doctorName);
            psmt.setString(3, appointmentDate);
            psmt.setString(4, appointmentTime);
            psmt.setInt(5, Integer.parseInt(appointmentId));

            // Execute the update
            int rowsUpdated = psmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.sendRedirect("viewAppointments.jsp?message=Appointment updated successfully");
            } else {
                out.println("<p>Error: Appointment not found or update failed.</p>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p>All fields are required!</p>");
    }
%>
