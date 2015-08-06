<%@page import="Main_pacakage.Mysql_Connector"%>


<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*, java.util.*, java.sql.*, Main_pacakage.*"%>
<%

    String una = "";
    String pasW = "";
    
    if (request.getParameter("uname") != null && !request.getParameter("uname").equals("") && 
            
            request.getParameter("passwd") != null && !request.getParameter("uname").equals("")) {
        una = request.getParameter("uname"); 
        pasW = request.getParameter("passwd"); 
        try {
            Connection con_3=new Mysql_Connector().getCon(); 
            String query_1 = "select u_type from u_table where u_name=? and u_passwd=?"; 
            PreparedStatement ps = con_3.prepareStatement(query_1); 
            ps.setString(1, una); 
            ps.setString(2, pasW);    
            ResultSet rs = ps.executeQuery(); 
            if (rs.next()) { 
                int utype = rs.getInt("u_type");
                if (utype == 1) { 
                    request.getSession().setAttribute("uname", una); 
                    request.getSession().setAttribute("utype", "admin");
                    response.sendRedirect("admin_1721/index.jsp");
                } else {
                    response.sendRedirect("login.jsp?");
                }
            }else{
                response.sendRedirect("login.jsp?msg=-1");
            }
        } catch (Exception e) {
            out.print("Exception Occured !" + e.toString());
        }
    } else {
        response.sendRedirect("login.jsp?msg=0");
    }

%>