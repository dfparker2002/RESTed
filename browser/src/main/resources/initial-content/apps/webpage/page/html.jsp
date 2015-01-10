<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%><%
%><%@page session="false" contentType="text/html; charset=utf-8" %><%
%><%@page import="java.io.*,
                  java.net.*,
									java.sql.*,
									org.teiid.jdbc.TeiidDriver,
                  utils.*" 
%><%
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><%!
//functions

%><%
%><sling:defineObjects /><%
//body

//request
//reposponse
//out

String url = "jdbc:teiid:sf@mm://localhost:31000";
    String sql = "select * from Campaign.salesforce.Campaign";
 
    Class.forName("org.teiid.jdbc.TeiidDriver");
 
    Connection connection = null;
    try{
        connection = DriverManager.getConnection(url, "user", "user");
        Statement statement = connection.createStatement();
        ResultSet results = statement.executeQuery(sql);
        while(results.next()) {
          %><%=results.getString(1)%><%
          System.out.println(results.getString(2));
        }
        results.close();
        statement.close();
    } catch (SQLException e){
        e.printStackTrace();
        throw e;
    } finally {
        try{
          connection.close();
        }catch(SQLException e1){
          // ignore
        }
    }

//TeiidDriver td = teiidServer.getDriver();
//Connection c = td.connect("jdbc:teiid:sf", null);

%><%= slingRequest.getContextPath() %>
