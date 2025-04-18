<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Edit Appointment</title>
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
            <h1 class="display-5 text-primary mb-5">Edit Appointment</h1>
            <div class="card">
                <div class="card-body">
                    <%
                    int appointmentId = Integer.parseInt(request.getParameter("id"));
                    String patientName = "";
                    String doctorName = "";
                    String appointmentDate = "";
                    String appointmentTime = "";
                    
                    try {
                        String q = "SELECT * FROM appointments WHERE id = ?";
                        PreparedStatement psmt = conn.prepareStatement(q);
                        psmt.setInt(1, appointmentId);
                        ResultSet rs = psmt.executeQuery();
                        
                        if (rs.next()) {
                            patientName = rs.getString("patient_name");
                            doctorName = rs.getString("doctor");
                            appointmentDate = rs.getString("appointment_date");
                            appointmentTime = rs.getString("appointment_time");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>

                    <form method="post" action="editAppointment.jsp?id=<%= appointmentId %>">
                        <div class="mb-3">
                            <label for="patientName" class="form-label">Patient Name</label>
                            <input type="text" class="form-control" id="patientName" name="patientName" value="<%= patientName %>" required>
                        </div>
                        <div class="mb-3">
                            <label for="doctorName" class="form-label">Doctor Name</label>
                            <input type="text" class="form-control" id="doctorName" name="doctorName" value="<%= doctorName %>" required>
                        </div>
                        <div class="mb-3">
                            <label for="appointmentDate" class="form-label">Appointment Date</label>
                            <input type="date" class="form-control" id="appointmentDate" name="appointmentDate" value="<%= appointmentDate %>" required>
                        </div>
                        <div class="mb-3">
                            <label for="appointmentTime" class="form-label">Appointment Time</label>
                            <input type="time" class="form-control" id="appointmentTime" name="appointmentTime" value="<%= appointmentTime %>" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </form>
                </div>
            </div>

            <%
            // Updating the appointment details after form submission
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String updatedPatientName = request.getParameter("patientName");
                String updatedDoctorName = request.getParameter("doctorName");
                String updatedAppointmentDate = request.getParameter("appointmentDate");
                String updatedAppointmentTime = request.getParameter("appointmentTime");
                
                try {
                    String updateQuery = "UPDATE appointments SET patient_name = ?, doctor = ?, appointment_date = ?, appointment_time = ? WHERE id = ?";
                    PreparedStatement updatePsmt = conn.prepareStatement(updateQuery);
                    updatePsmt.setString(1, updatedPatientName);
                    updatePsmt.setString(2, updatedDoctorName);
                    updatePsmt.setString(3, updatedAppointmentDate);
                    updatePsmt.setString(4, updatedAppointmentTime);
                    updatePsmt.setInt(5, appointmentId);
                    
                    int rowsUpdated = updatePsmt.executeUpdate();
                    if (rowsUpdated > 0) {
                        out.println("<p class='text-success'>Appointment updated successfully!</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
                }
            }
            %>

            <a href="viewAppointments.jsp" class="btn btn-secondary mt-3">Back to Appointments</a>
        </div>
    </div>
</body>
</html>
