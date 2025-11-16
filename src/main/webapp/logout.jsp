<%@ page language="java" %>
<%
    session.invalidate();
    response.sendRedirect("login.jsp?message=You have been logged out successfully.");
%>
