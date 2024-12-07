<%@ page import="java.sql.*" %>
<%
    String senderId = request.getParameter("senderId");
    String receiverId = request.getParameter("receiverId");
    String message = request.getParameter("message");

    if (senderId != null && receiverId != null && message != null && !message.trim().isEmpty()) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dietpro", "root", "password");

            String query = "INSERT INTO Chats (sender_id, receiver_id, message) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(senderId));
            pstmt.setInt(2, Integer.parseInt(receiverId));
            pstmt.setString(3, message);

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    response.sendRedirect("chat.jsp?receiverId=" + receiverId);
%>
